//
//  Music.h
//  FlickFreak
//
//  Created by  on 2012/5/4.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectAL.h"
#import "heqet.h"

@interface Music : NSObject

@property(readonly) int bpm;
@property(readonly) NSString* filename;
@property(readonly) OALAudioTrack* track;
@property(readonly) KWTimer* beatTimer;

- (id)initWithFile:(NSString*)filename bpm:(int)bpm;
- (void)play;
- (void)stop;
- (float)remainToNextBeat;

@end
