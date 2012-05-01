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

- (id)init {
  self = [super init];
  if (self) {
    lastSwipeDirection_ = -1;
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
  }
  return self;
}

- (void)onEnter {
  [super onEnter];
}

- (void)update:(ccTime)dt {
  [self pollFlick];
  Enemy* enemy = [enemyManager lotPopEnemy];
  if (enemy) {
    [self addChild:enemy];
  }
}

- (void)pressButton:(CommandType)type {
  [manager pushCommand:type];
  NSLog(@"%d", [manager.commands count]);
}

- (void)pollFlick {
  KKInput* input = [KKInput sharedInput];
  if (input.gesturesAvailable) {
    KKSwipeGestureDirection dir = input.gestureSwipeDirection;
    if (lastSwipeDirection_ != dir) {
      if (dir == KKSwipeGestureDirectionLeft || dir == KKSwipeGestureDirectionRight) {
        [manager printStack];
        Direction d = dir == KKSwipeGestureDirectionLeft ? DirectionLeft : DirectionRight;
        int count = (int)[manager.commands count];
        for (int i = 0; i < count; ++i) {
          [self attackTo:d];
        }
      }
    }
    lastSwipeDirection_ = dir;
  }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  lastPosition_ = [self convertTouchToNodeSpace:touch];
  return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
  CGPoint currentPosition = [self convertTouchToNodeSpace:touch];
  if (ccpDistance(currentPosition, lastPosition_) < 5) {
    lastSwipeDirection_ = -1;
  }
  lastPosition_ = currentPosition;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
  lastSwipeDirection_ = -1;
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

@end
