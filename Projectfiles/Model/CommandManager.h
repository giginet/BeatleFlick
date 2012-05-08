//
//  CommandManager.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import "Shoot.h"

@interface CommandManager : NSObject {
  NSMutableArray* commands_;
}

@property(readonly, strong) NSArray* commands;

- (void)pushCommand:(CommandType)type;
- (Command*)popCommand;
- (void)clearCommands;
- (void)printStack;
- (Shoot*)shoot:(Direction)dir time:(float)time;

@end
