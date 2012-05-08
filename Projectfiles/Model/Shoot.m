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
  }
  return self;
}

@end
