//
//  Shoot.m
//  FlickFreak
//
//  Created by  on 2012/5/5.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Shoot.h"

@interface Shoot()
@end

@implementation Shoot
@synthesize bullets;
@synthesize time;
@synthesize direction;

- (id)initWithbullets:(NSArray *)array time:(float)t {
  self = [super init];
  if (self) {
    bullets = array;
    time = t;
    for (Bullet* bullet in self.bullets) {
      bullet.shoot = self;
    }
  }
  return self;
}

- (void)scheduleAttacks:(id)target selector:(SEL)selector delay:(ccTime)delay {
  if ([self.bullets count] == 0) return;
  float first = [(Bullet*)[self.bullets objectAtIndex:0] time];
  for (Bullet* bullet in self.bullets) {
    float sub = bullet.time - first;
    [bullet scheduleAttack:target selector:selector delay:(delay + sub)];
  }
}

@end
