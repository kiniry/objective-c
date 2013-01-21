//
//  FunWithBlocks.m
//  Assignment#2
//
//  Created by Jacob Espersen on 16/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "FunWithBlocks.h"

@implementation FunWithBlocks

- (void)changeNumberWithABlock:(double (^)(void))block{
    self.num = block()*self.num;
}

- (id)initWithDouble:(double)num{
    self = [super init];
    if (self) {
        self.num = num;
    }
    return self;
}

@end
