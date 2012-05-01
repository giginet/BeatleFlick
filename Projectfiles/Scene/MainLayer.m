//
//  MainLayer.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "MainLayer.h"

@implementation MainLayer

- (id)init {
  self = [super init];
  if (self) {
    [self schedule:@selector(update:) interval:0.1];
    KKInput* input = [KKInput sharedInput];
    input.gestureSwipeEnabled = YES;
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
}

@end
