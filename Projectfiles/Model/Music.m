//
//  Music.m
//  FlickFreak
//
//  Created by  on 2012/5/4.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Music.h"

@implementation Music
@synthesize bpm;
@synthesize filename;
@synthesize track;
@synthesize beatTimer;
@dynamic beatLength;
@dynamic remainToNextBeat;

- (id)initWithFile:(NSString *)fn bpm:(int)b {
  self = [super init];
  if (self) {
    bpm = b;
    filename = fn;
    track = [OALAudioTrack track];
    [track preloadFile:fn];
    beatTimer = [KWTimer timerWithMax:self.beatLength];
    beatTimer.looping = YES;
  }
  return self;
}

- (void)play {
  [self.beatTimer play];
  [self.track playFile:self.filename loops:-1];
}

- (void)stop {
  [self.beatTimer stop];
  [self.track stop];
}

- (float)beatLength {
  return 60.0 / self.bpm;
}

- (float)remainToNextBeat {
  return self.beatTimer.max - self.beatTimer.now;
}

@end
