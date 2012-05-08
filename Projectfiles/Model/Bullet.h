//
//  Bullet.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  BulletTypeCircle,
  BulletTypeSquare,
  BulletTypeTriangle
} BulletType;

@interface Bullet : NSObject {
}

@property(readonly) BulletType type;
@property(readwrite) BOOL justBeat;
@property(readwrite) float time;

- (id)initWithBulletType:(BulletType)type;

@end
