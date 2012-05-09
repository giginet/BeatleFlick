//
//  BulletManager.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "BulletManager.h"

const int MAX_STOCK = 3;

@interface BulletManager()
- (void)update:(ccTime)dt;
@end

@implementation BulletManager
@synthesize bullets = bullets_;

- (id)init {
  self = [super init];
  if (self) {
    bullets_ = [NSMutableArray array];
    [self scheduleUpdate];
  }
  return self;
}

- (void)pushBullet:(BulletType)type time:(float)time justBeat:(BOOL)beat {
  int count = [bullets_ count];
  if (count >= MAX_STOCK) {
    NSRange range = NSMakeRange(0, count - (MAX_STOCK - 1));
    NSIndexSet* indexSet = [[NSIndexSet alloc] initWithIndexesInRange:range];
    for (Bullet* bullet in [self.bullets objectsAtIndexes:indexSet]) {
      [self removeChild:bullet cleanup:YES];
    }
    [bullets_ removeObjectsInRange:range];
  }
  Bullet* bullet = [[Bullet alloc] initWithBulletType:type];
  bullet.time = time;
  bullet.justBeat = beat;
  [bullets_ addObject:bullet];
  [self addChild:bullet];
}

- (Bullet*)popBullet {
  NSAssert([self.bullets count] > 0, @"can't pop from empty array.");
  Bullet* bullet = [self.bullets objectAtIndex:0];
  [bullets_ removeObjectAtIndex:0];
  [self removeChild:bullet cleanup:YES];
  return bullet;
}

- (void)clearBullets {
  [bullets_ removeAllObjects];
  [self removeAllChildrenWithCleanup:YES];
}

- (Shoot*)shoot:(Direction)dir time:(float)time {
  Shoot* shoot = [[Shoot alloc] initWithbullets:[NSArray arrayWithArray:self.bullets] time:time];
  [self clearBullets];
  shoot.direction = dir;
  return shoot;
}

- (void)update:(ccTime)dt {
  for (int i = 0; i < (int)[self.bullets count]; ++i) {
    Bullet* bullet = [self.bullets objectAtIndex:i];
    bullet.position = ccp(0, -30 * i);
  }
}

@end
