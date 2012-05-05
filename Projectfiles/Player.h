//
//  Player.h
//  FlickFreak
//
//  Created by  on 2012/5/5.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCSprite.h"

@interface Player : CCSprite

@property(readwrite) int hp;
@property(readwrite) int combo;
@property(readonly) BOOL isFever;

@end
