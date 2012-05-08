//
//  Bullet.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Shoot;

typedef enum {
  BulletTypeCircle,
  BulletTypeSquare,
  BulletTypeTriangle
} BulletType;

@interface Bullet : NSObject {
  id target_;
  SEL selector_;
}

@property(readonly) BulletType type;
@property(readwrite) BOOL justBeat;
@property(readwrite) float time;
@property(readwrite, weak) Shoot* shoot;

- (id)initWithBulletType:(BulletType)type;
- (void)scheduleAttack:(id)target selector:(SEL)selector delay:(ccTime)delay;
- (void)attack;

@end
