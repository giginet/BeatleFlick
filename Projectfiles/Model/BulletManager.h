//
//  BulletManager.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bullet.h"
#import "Shoot.h"

@interface BulletManager : NSObject {
  NSMutableArray* bullets_;
}

@property(readonly, strong) NSArray* bullets;

- (void)pushBullet:(BulletType)type time:(float)time justBeat:(BOOL)beat;
- (Bullet*)popBullet;
- (void)clearBullets;
- (void)printStack;
- (Shoot*)shoot:(Direction)dir time:(float)time;

@end
