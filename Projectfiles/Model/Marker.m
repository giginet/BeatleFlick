//
//  Marker.m
//  FlickFreak
//
//  Created by  on 2012/5/4.
//  Copyright 2012 Kawaz. All rights reserved.
//

#import "Marker.h"
#import "CCDrawingPrimitives.h"
#import "KWDrawingPrimitives.h"

@implementation Marker
@synthesize maxTime;
@synthesize currentTime;
@synthesize maxScale;
@synthesize radius;
@synthesize color;

- (id)initWithRadius:(float)rad {
  self = [super init];
  if (self) {
    radius = rad;
    self.currentTime = 0;
    self.maxScale = 2.0;
  }
  return self;
}

- (void)draw {
  [super draw];
  glColor4f(color.r, color.g, color.b, color.a);
  float rad = self.radius * (self.maxScale - 1) * (self.maxTime - self.currentTime) / self.maxTime;
  ccDrawCircle(self.position, self.radius + rad, 0, 100, NO);
  ccFillCircle(self.position, self.radius, 0, 100, YES);
}

@end
