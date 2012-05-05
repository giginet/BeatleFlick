//
//  MainLayer.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"
#import "Command.h"
#import "CCNodeExtensions.h"

@interface MainLayer()
- (void)pressButton:(CommandType)type;
- (void)pollFlick;
- (void)attackTo:(Direction)dir;
@end

@implementation MainLayer
@synthesize manager;
@synthesize enemyManager;
@synthesize music;

- (id)init {
  self = [super init];
  if (self) {
    CCDirector* director = [CCDirector sharedDirector];
    KKInput* input = [KKInput sharedInput];
    input.gestureSwipeEnabled = YES;
    
    CCSprite* background = [CCSprite spriteWithFile:@"background.png"];
    background.position = director.screenCenter;
    [self addChild:background];
    
    buttons_ = [NSMutableArray array];
    for (int i = 0; i < 3; ++i) {
      NSString* filename = [NSString stringWithFormat:@"button%d.png", i];
      CCSprite* button = [CCSprite spriteWithFile:filename];
      button.tag = i;
      int width = button.contentSize.width;
      int margin = (director.screenSize.width - width * 3.0) / 4.0;
      float x = margin * (i + 1) + width * i + width * 0.5;
      button.position = ccp(x, 180);
      [self addChild:button];
      [buttons_ addObject:button];
    }
    manager = [[CommandManager alloc] init];
    enemyManager = [[EnemyManager alloc] init];
    self.isTouchEnabled = YES;
    music = [[Music alloc] initWithFile:@"stage1.caf" bpm:130];
    marker_ = [[Marker alloc] initWithRadius:50];
    marker_.position = ccp(80, 60);
    marker_.color = ccc4f(1, 0, 0, 1);
    marker_.maxTime = music.beatLength;
    
    [self addChild:marker_];
    [[OALSimpleAudio sharedInstance] preloadEffect:@"decide.caf"];
    [[OALSimpleAudio sharedInstance] preloadEffect:@"flick.caf"];
    
    player_ = [Player spriteWithFile:@"button0.png"];
  }
  return self;
}

- (void)onEnter {
  [super onEnter];
  [self.music play];
}

- (void)update:(ccTime)dt {
  [self pollFlick];
  Enemy* enemy = [enemyManager lotPopEnemy];
  if (enemy) {
    [self addChild:enemy];
  }
  marker_.currentTime = self.music.remainToNextBeat;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  for (CCSprite* button in buttons_) {
    if([button containsTouch:touch]){
      [self pressButton:button.tag];
    }
  }
  return YES;
}

- (void)pressButton:(CommandType)type {
  [manager pushCommand:type];
  if ([self isJustBeat]) {
    [[OALSimpleAudio sharedInstance] playEffect:@"decide.caf"];
    player_.combo += 1;
  } else {
    player_.combo = 0;
  }
}

- (void)pollFlick {
  KKInput* input = [KKInput sharedInput];
  if (input.gesturesAvailable) {
    KKSwipeGestureDirection dir = input.gestureSwipeDirection;
    if ([input gestureSwipeRecognizedThisFrame]) {
      if (dir == KKSwipeGestureDirectionLeft || dir == KKSwipeGestureDirectionRight) {        
        Direction d = dir == KKSwipeGestureDirectionLeft ? DirectionLeft : DirectionRight;
        int count = (int)[manager.commands count];
        for (int i = 0; i < count; ++i) {
          [self attackTo:d];
        }
      }
      if ([self isJustBeat]) {
        [[OALSimpleAudio sharedInstance] playEffect:@"flick.caf"];
        player_.combo += 1;
      } else {
        player_.combo = 0;
      }
    }
  }
}

- (void)attackTo:(Direction)dir {
  Command* command = [self.manager popCommand];
  BOOL result = [enemyManager attackEnemy:dir type:command.type];
  if (result) {
    NSLog(@"hit");
  } else {
    NSLog(@"not hit");
  }
}

- (BOOL)isJustBeat {
  float max = self.music.beatLength;
  float current = self.music.remainToNextBeat;
  float sub = max - current;
  const float threshold = 0.20;
  NSLog(@"%f", sub);
  return sub <= threshold || (max - threshold) <= sub;
}

@end
