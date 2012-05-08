//
//  Enemy.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCSprite.h"
#import "Bullet.h"
#import "Direction.h"

@class EnemyManager;

@interface Enemy : CCSprite

@property(readwrite) int hp;
@property(readonly) BulletType type;
@property(readonly) Direction direction;
@property(readwrite, weak) EnemyManager* manager;

- (id)initWithFile:(NSString*)filename 
              type:(BulletType)t 
         direction:(Direction)dir;
- (BOOL)damage:(int)damage;
- (void)death;

@end
