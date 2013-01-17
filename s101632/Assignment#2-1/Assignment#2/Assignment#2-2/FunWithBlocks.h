//
//  FunWithBlocks.h
//  Assignment#2
//
//  Created by Jacob Espersen on 16/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FunWithBlocks : NSObject

@property double num;
@property NSMutableArray *blocks;

- (void)changeNumberWithABlock:(double(^)(void))block;
- (id)initWithDouble:(double)num;

@end
