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
@dynamic beatLength;
@dynamic remainToNextBeat;

- (id)initWithFile:(NSString *)fn bpm:(int)b {
  self = [super init];
  if (self) {
    bpm = b;
    filename = fn;
    track = [OALAudioTrack track];
    [track preloadFile:fn];
  }
  return self;
}

- (void)play {
  [self.track playFile:self.filename loops:-1];
}

- (void)stop {
  [self.track stop];
}

- (float)beatLength {
  return 60.0 / self.bpm;
}

- (float)remainToNextBeat {
  float current = self.track.currentTime;
  int nextBeat = ceil(current / self.beatLength);
  return (nextBeat * self.beatLength) - current;
}

@end
