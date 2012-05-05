//
//  Player.m
//  FlickFreak
//
//  Created by  on 2012/5/5.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize hp;
@synthesize combo;
@dynamic isFever;

- (id)initWithTexture:(CCTexture2D *)texture {
  self = [super init];
  if (self) {
    self.hp = 3;
    self.combo = 0;
  }
  return self;
}

- (BOOL)isFever {
  return self.combo > 16;
}

@end
