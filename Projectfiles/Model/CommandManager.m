//
//  CommandManager.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CommandManager.h"

@implementation CommandManager
@synthesize commands;

- (id)init {
  self = [super init];
  if (self) {
    commands_ = [NSMutableArray array];
  }
  return self;
}

- (void)pushCommand:(CommandType)type {
  int count = [commands count];
  if (count >= 3) {
    [commands_ removeObjectsInRange:NSMakeRange(0, count - 2)];
  }
  Command* command = [[Command alloc] initWithCommandType:type];
  [commands_ addObject:command];
}

- (Command*)popCommand {
  NSAssert([self.commands count] > 0, @"can't pop from empty array.");
  Command* command = [self.commands objectAtIndex:0];
  [commands_ removeObjectAtIndex:0];
  return command;
}

- (void)clearCommands {
  [commands_ removeAllObjects];
}

@end
