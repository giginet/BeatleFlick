//
//  EnemyManager.m
//  FlickFreak
//
//  Created by  on 2012/5/2.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "EnemyManager.h"
#import "Command.h"

@interface EnemyManager()
- (NSString*)filenameWithType:(NSString*)prefix type:(CommandType)type;
@end

@implementation EnemyManager
@synthesize enemies = enemies_;

- (id)init {
  self = [super init];
  if (self) {
    enemies_ = [NSArray array];
    random_ = [KWRandom random];
  }
  return self;
}

- (Enemy*)popEnemy:(Direction)direction {
  CommandType types[] = {
    CommandTypeCircle, 
    CommandTypeSquare, 
    CommandTypeTriangle
  };
  int idx = [random_ nextInt] % 3;
  CommandType type = types[idx];
  NSString* filename = [self filenameWithType:@"enemy" type:type];
  Enemy* enemy = [[Enemy alloc] initWithFile:filename type:type direction:direction];
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

- (NSString*)filenameWithType:(NSString *)prefix type:(CommandType)type {
  return [NSString stringWithFormat:@"%@%d.png", prefix, type];
}

@end