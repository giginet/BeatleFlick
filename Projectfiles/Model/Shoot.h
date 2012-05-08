//
//  Shoot.h
//  FlickFreak
//
//  Created by  on 2012/5/5.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import "Enemy.h"

@interface Shoot : NSObject {
  NSMutableArray* commands_;
}

@property(readwrite) float time;
@property(readwrite) Direction direction;
@property(readonly) NSArray* commands;

- (id)initWithCommands:(NSArray*)array;

@end
