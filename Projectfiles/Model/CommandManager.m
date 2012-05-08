//
//  CommandManager.m
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CommandManager.h"

@implementation CommandManager
@synthesize commands = commands_;

- (id)init {
  self = [super init];
  if (self) {
    commands_ = [NSMutableArray array];
  }
  return self;
}

- (void)pushCommand:(CommandType)type {
  int count = [commands_ count];
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

- (void)printStack {
  for (Command* com in commands_) {
    if (com.type == CommandTypeCircle) {
      NSLog(@"red");
    } else if (com.type == CommandTypeSquare) {
      NSLog(@"blue");
    } else {
      NSLog(@"yellow");
    }
  }
  NSLog(@"----------");
}

- (Shoot*)shoot:(Direction)dir time:(float)time {
  Shoot* shoot = [[Shoot alloc] initWithCommands:self.commands];
  [self clearCommands];
  shoot.direction = dir;
  return shoot;
}

@end
