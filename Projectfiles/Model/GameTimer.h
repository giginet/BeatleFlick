//
//  GameTimer.h
//  FlickFreak
//
//  Created by  on 2012/5/6.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameTimer : NSObject

@property(readonly) float time;
@property(readonly) BOOL playing;

- (void)play;
- (void)stop;
- (void)pause;

@end
