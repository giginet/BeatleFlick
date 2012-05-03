//
//  Marker.h
//  FlickFreak
//
//  Created by  on 2012/5/4.
//  Copyright 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Marker : CCNode {
    
}

@property(readwrite) float maxTime;
@property(readwrite) float currentTime;
@property(readwrite) float maxScale;
@property(readwrite) float radius;
@property(readwrite) ccColor4F color;

- (id)initWithRadius:(float)rad;

@end
