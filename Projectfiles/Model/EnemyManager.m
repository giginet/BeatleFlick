//
//  EnemyManager.m
//  FlickFreak
//
//  Created by  on 2012/5/2.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "EnemyManager.h"
#import "Bullet.h"

@interface EnemyManager()
- (NSString*)filenameWithType:(NSString*)prefix type:(BulletType)type;
@end

@implementation EnemyManager
@synthesize enemies = enemies_;

- (id)init {
  self = [super init];
  if (self) {
    enemies_ = [NSMutableArray array];
    random_ = [KWRandom random];
  }
  return self;
}

- (Enemy*)popEnemy:(Direction)direction {
  BulletType types[] = {
    BulletTypeCircle, 
    BulletTypeSquare, 
    BulletTypeTriangle
  };
  int idx = [random_ nextIntFrom:0 to:2];
  BulletType type = types[idx];
  NSString* filename = [self filenameWithType:@"enemy" type:type];
  Enemy* enemy = [[Enemy alloc] initWithFile:filename type:type direction:direction];
  enemy.manager = self;
  [enemies_ addObject:enemy];
  return enemy;
}

- (Enemy*)lotPopEnemy {
  int r = [random_ nextInt];
  if (r % 100 == 0) {
    Direction dir;
    r = [random_ nextInt];
    if (r % 2 == 0) {
      dir = DirectionLeft;
    } else {
      dir = DirectionRight;
    }
    return [self popEnemy:dir];
  }
  return nil;
}

- (BOOL)attackEnemy:(Direction)dir type:(BulletType)type {
  for (Enemy* enemy in self.enemies) {
    if (enemy.direction == dir) {
      if (enemy.type == type) {
        [enemy damage:1];
        return YES;
      }
      return NO;
    }
  }
  return NO;
}

- (BOOL)removeEnemy:(Enemy *)enemy {
  if ([self.enemies containsObject:enemy]) {
    [enemies_ removeObject:enemy];
    return YES;
  }
  return NO;
}

- (NSString*)filenameWithType:(NSString *)prefix type:(BulletType)type {
  return [NSString stringWithFormat:@"%@%d.png", prefix, type];
}

@end
