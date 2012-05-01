//
//  Enemy.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "CCSprite.h"
#import "Command.h"

@class EnemyManager;

typedef enum {
  DirectionLeft,
  DirectionRight,
  DirectionUp
} Direction;

@interface Enemy : CCSprite

@property(readwrite) int hp;
@property(readonly) CommandType type;
@property(readonly) Direction direction;
@property(readwrite, weak) EnemyManager* manager;

- (id)initWithFile:(NSString*)filename 
              type:(CommandType)t 
         direction:(Direction)dir;
- (BOOL)damage:(int)damage;
- (void)death;

@end
