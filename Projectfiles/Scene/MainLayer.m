//
//  MainLayer.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"
#import "Command.h"

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
    KKInput* input = [KKInput sharedInput];
    input.gestureSwipeEnabled = YES;
    CommandType types[] = {CommandTypeCircle, CommandTypeSquare, CommandTypeTriangle};
    CCMenuItem* items[3];
    for (int i = 0; i < 3; ++i) {
      NSString* filename = [NSString stringWithFormat:@"button%d.png", i];
      __block CommandType type = types[i];
      __block MainLayer* layer = self;
      CCMenuItemImage* item = [CCMenuItemImage itemFromNormalImage:filename 
                                                     selectedImage:filename 
                                                             block:^(id sender){
                                                               [layer pressButton:type];
      }];
      items[i] = item;
    }
    CCMenu* menu = [CCMenu menuWithItems:items[0], items[1], items[2], nil];
    [menu alignItemsHorizontally];
    [self addChild:menu];
    menu.position = ccp(menu.position.x, 180);
    manager = [[CommandManager alloc] init];
    enemyManager = [[EnemyManager alloc] init];
    self.isTouchEnabled = YES;
    music = [[Music alloc] initWithFile:@"sample.caf" bpm:126];
    marker_ = [[Marker alloc] initWithRadius:50];
    marker_.position = ccp(80, 60);
    marker_.color = ccc4f(1, 0, 0, 1);
    marker_.maxTime = music.beatTimer.max;
    
    [self addChild:marker_];
    [[OALSimpleAudio sharedInstance] preloadEffect:@"decide.caf"];
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

- (void)pressButton:(CommandType)type {
  [manager pushCommand:type];
  if ([self isCorrectBeat]) {
    [[OALSimpleAudio sharedInstance] playEffect:@"decide.caf"];
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

- (BOOL)isCorrectBeat {
  float max = self.music.beatLength;
  float current = self.music.remainToNextBeat;
  float sub = max - current;
  NSLog(@"%f", sub);
  const float threshold = 0.1;
  return sub <= threshold || max - threshold < sub;
}

@end
