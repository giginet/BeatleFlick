//
//  Shoot.h
//  FlickFreak
//
//  Created by  on 2012/5/5.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bullet.h"
#import "Direction.h"

@interface Shoot : NSObject {
  NSMutableArray* bullets_;
}

@property(readwrite) float time;
@property(readwrite) Direction direction;
@property(readonly) NSArray* bullets;

- (id)initWithbullets:(NSArray*)array time:(float)time;
- (void)scheduleAttacks:(id)target selector:(SEL)selector delay:(ccTime)delay;

@end
