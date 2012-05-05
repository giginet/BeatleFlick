//
//  Command.h
//  FlickFreak
//
//  Created by  on 2012/5/1.
//  Copyright (c) 2012 Kawaz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  CommandTypeCircle,
  CommandTypeSquare,
  CommandTypeTriangle
} CommandType;

@interface Command : NSObject {
}

@property(readonly) CommandType type;
@property(readwrite) BOOL justBeat;
@property(readwrite) float time;

- (id)initWithCommandType:(CommandType)type;

@end
