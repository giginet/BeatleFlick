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

- (id)initWithBulletType:(BulletType)t {
  self = [super init];
  if (self) {
    type = t;
    justBeat = NO;
    time = 0;
  }
  return self;
}

@end
