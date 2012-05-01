//
//  Enemy.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Enemy.h"

@interface Enemy()
- (void)onReachToCenter;
@end

@implementation Enemy
@synthesize hp;
@synthesize type;
@synthesize direction;

- (id)initWithTexture:(CCTexture2D *)texture {
  self = [super initWithTexture:texture];
  if (self) {
  }
  return self;
}

- (id)initWithFile:(NSString *)filename type:(CommandType)t direction:(Direction)dir {
  self = [super initWithFile:filename];
  if (self) {
    type = t;
    direction = dir;
    CCDirector* director = [CCDirector sharedDirector];
    int centerX = director.screenCenter.x;
    int width = director.screenSize.width;
    int x = width * dir;
    int y = 400;
    self.position = ccp(x, y);
    [self runAction:[CCSequence actions:
                     [CCMoveTo actionWithDuration:5 position:ccp(centerX, 300)],
                     [CCCallFunc actionWithTarget:self selector:@selector(onReachToCenter)],
                     nil]];
  }
  return self;
}

- (void)onReachToCenter {
  [self.parent removeChild:self cleanup:YES];
}

@end
