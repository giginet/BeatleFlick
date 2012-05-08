//
//  EnemyManager.h
//  FlickFreak
//
//  Created by  on 2012/5/2.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "heqet.h"
#import "Enemy.h"

@interface EnemyManager : NSObject {
  int counter_;
  NSMutableArray* enemies_;
  KWRandom* random_;
}

@property(readonly, strong) NSArray* enemies;

- (Enemy*)popEnemy:(Direction)direction;
- (Enemy*)lotPopEnemy;
- (BOOL)attackEnemy:(Direction)dir type:(BulletType)type;
- (BOOL)removeEnemy:(Enemy*)enemy;
- (NSArray*)enemiesWithDirection:(Direction)dir;

@end
