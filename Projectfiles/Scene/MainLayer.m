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
@end

@implementation MainLayer
@synthesize manager;
@synthesize enemyManager;

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
    manager = [[CommandManager alloc] init];
    enemyManager = [[EnemyManager alloc] init];
  }
  return self;
}

- (void)onEnter {
  [super onEnter];
}

- (void)update:(ccTime)dt {
  KKInput* input = [KKInput sharedInput];
  if (input.gesturesAvailable) {
    KKSwipeGestureDirection dir = input.gestureSwipeDirection;
    switch (dir) {
      case KKSwipeGestureDirectionUp:
        NSLog(@"up");
        break;
      case KKSwipeGestureDirectionRight:
        NSLog(@"Right");
        break;
      case KKSwipeGestureDirectionDown:
        NSLog(@"Down");
        break;
      case KKSwipeGestureDirectionLeft:
        NSLog(@"Left");
        break;
    }
  }
  Enemy* enemy = [enemyManager lotPopEnemy];
  if (enemy) {
    [self addChild:enemy];
  }
}

- (void)pressButton:(CommandType)type {
  [manager pushCommand:type];
  NSLog(@"%d", [manager.commands count]);
}

@end
