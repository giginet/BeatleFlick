//
//  Bullet.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "heqet.h"

@class Shoot;

typedef enum {
  BulletTypeCircle,
  BulletTypeSquare,
  BulletTypeTriangle
} BulletType;

@interface Bullet : CCSprite {
  id target_;
  SEL selector_;
}

@property(readonly) BulletType type;
@property(readwrite) BOOL justBeat;
@property(readonly) BOOL shooted;
@property(readwrite) float time;
@property(readwrite, weak) Shoot* shoot;

- (id)initWithBulletType:(BulletType)type;
- (void)scheduleAttack:(id)target selector:(SEL)selector delay:(ccTime)delay;
- (void)attack;

@end
