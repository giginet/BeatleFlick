//
//  Bullet.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet
@synthesize type;
@synthesize justBeat;
@synthesize time;
@synthesize shoot;

- (id)initWithBulletType:(BulletType)t {
  self = [super init];
  if (self) {
    type = t;
    justBeat = NO;
    time = 0;
  }
  return self;
}

- (void)scheduleAttack:(id)target selector:(SEL)selector delay:(ccTime)delay {
  target_ = target;
  selector_ = selector;
  [[CCScheduler sharedScheduler] scheduleSelector:@selector(attack) 
                                        forTarget:self 
                                         interval:delay 
                                           paused:NO 
                                           repeat:0 
                                            delay:0];
}

- (void)attack {
  [target_ performSelector:selector_ withObject:self];
}

@end
