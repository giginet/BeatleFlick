//
//  GameTimer.m
//  FlickFreak
//
//  Created by  on 2012/5/6.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "GameTimer.h"

@interface GameTimer()
- (void)update:(ccTime)dt;
@end

@implementation GameTimer
@synthesize time;
@synthesize playing;

- (id)init {
  self = [super init];
  if (self) {
    time = 0;
    playing = NO;
  }
  return self;
}

- (void)play {
  playing = YES;
  [[CCScheduler sharedScheduler] scheduleUpdateForTarget:self 
                                                priority:0 
                                                  paused:NO];
  
}

- (void)stop {
  [self pause];
  time = 0;
}

- (void)pause {
  playing = NO;
  [[CCScheduler sharedScheduler] unscheduleUpdateForTarget:self];
}

- (void)update:(ccTime)dt {
  time += dt;
}

@end
