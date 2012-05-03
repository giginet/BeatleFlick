//
//  MainLayer.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import "heqet.h"
#import "CommandManager.h"
#import "EnemyManager.h"
#import "Marker.h"
#import "Music.h"

@interface MainLayer : KWLayer {
  Marker* marker_;
  NSMutableArray* buttons_;
}

@property(readonly, strong) CommandManager* manager;
@property(readonly, strong) EnemyManager* enemyManager;
@property(readonly, strong) Music* music;

- (BOOL)isCorrectBeat;

@end
