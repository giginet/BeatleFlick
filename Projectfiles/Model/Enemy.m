//
//  Enemy.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Enemy.h"
#import "EnemyManager.h"

@interface Enemy()
- (void)onReachToCenter;
@end

@implementation Enemy
@synthesize hp;
@synthesize type;
@synthesize direction;
@synthesize manager;

- (id)initWithTexture:(CCTexture2D *)texture {
  self = [super initWithTexture:texture];
  if (self) {
  }
  return self;
}

- (id)initWithFile:(NSString *)filename type:(BulletType)t direction:(Direction)dir {
  self = [super initWithFile:filename];
  if (self) {
    hp = 1;
    type = t;
    direction = dir;
    CCDirector* director = [CCDirector sharedDirector];
    int centerX = director.screenCenter.x;
    int width = director.screenSize.width;
    int x = width * dir;
    int y = 400;
    self.position = ccp(x, y);
    [self runAction:[CCSequence actions:
                     [CCMoveTo actionWithDuration:10 position:ccp(centerX, 300)],
                     [CCCallFunc actionWithTarget:self selector:@selector(onReachToCenter)],
                     nil]];
  }
  return self;
}

- (BOOL)damage:(int)damage {
  hp -= damage;
  if (hp <= 0) {
    [self death];
    return YES;
  }
  return NO;
}

- (void)death {
  [self.parent removeChild:self cleanup:YES];
  [self.manager removeEnemy:self];
}

- (void)onReachToCenter {
  [self.parent removeChild:self cleanup:YES];
  [self.manager removeEnemy:self];
}

@end
