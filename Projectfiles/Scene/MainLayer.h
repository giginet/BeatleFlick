//
//  MainLayer.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "heqet.h"
#import "BulletManager.h"
#import "EnemyManager.h"
#import "Marker.h"
#import "Music.h"
#import "Player.h"
#import "GameTimer.h"

@interface MainLayer : KWLayer {
  NSMutableArray* buttons_;
  NSMutableArray* shoots_;
  Marker* marker_;
  Player* player_;
  GameTimer* timer_;
}

@property(readonly, strong) BulletManager* manager;
@property(readonly, strong) EnemyManager* enemyManager;
@property(readonly, strong) Music* music;

- (BOOL)isJustBeat;
- (void)attack:(Bullet*)bullet;

@end
