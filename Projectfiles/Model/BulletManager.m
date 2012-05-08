//
//  BulletManager.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "BulletManager.h"

@implementation BulletManager
@synthesize bullets = bullets_;

- (id)init {
  self = [super init];
  if (self) {
    bullets_ = [NSMutableArray array];
  }
  return self;
}

- (void)pushBullet:(BulletType)type time:(float)time justBeat:(BOOL)beat {
  int count = [bullets_ count];
  if (count >= 3) {
    [bullets_ removeObjectsInRange:NSMakeRange(0, count - 2)];
  }
  Bullet* bullet = [[Bullet alloc] initWithBulletType:type];
  bullet.time = time;
  bullet.justBeat = beat;
  [bullets_ addObject:bullet];
}

- (Bullet*)popBullet {
  NSAssert([self.bullets count] > 0, @"can't pop from empty array.");
  Bullet* bullet = [self.bullets objectAtIndex:0];
  [bullets_ removeObjectAtIndex:0];
  return bullet;
}

- (void)clearBullets {
  [bullets_ removeAllObjects];
}

- (void)printStack {
  for (Bullet* com in bullets_) {
    if (com.type == BulletTypeCircle) {
      NSLog(@"red");
    } else if (com.type == BulletTypeSquare) {
      NSLog(@"blue");
    } else {
      NSLog(@"yellow");
    }
  }
  NSLog(@"----------");
}

- (Shoot*)shoot:(Direction)dir time:(float)time {
  Shoot* shoot = [[Shoot alloc] initWithbullets:self.bullets time:time];
  [self clearBullets];
  shoot.direction = dir;
  return shoot;
}

@end
