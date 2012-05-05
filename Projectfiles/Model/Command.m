//
//  Command.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Command.h"

@implementation Command
@synthesize type;
@synthesize justBeat;
@synthesize time;

- (id)initWithCommandType:(CommandType)t {
  self = [super init];
  if (self) {
    type = t;
    justBeat = NO;
    time = 0;
  }
  return self;
}

@end
