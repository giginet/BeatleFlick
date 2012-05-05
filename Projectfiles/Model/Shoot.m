//
//  Shoot.m
//  FlickFreak
//
//  Created by  on 2012/5/5.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Shoot.h"

@implementation Shoot
@synthesize commands;
@synthesize time;

- (id)initWithCommands:(NSArray *)array {
  self = [super init];
  if (self) {
    commands = array;
    time = -1;
  }
  return self;
}

@end
