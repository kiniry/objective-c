//
//  Blocks.m
//  Assignment4
//
//  Created by Markus Færevaag on 28.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Blocks.h"

@interface Blocks()

@property (nonatomic, copy) void (^block)(void);

@end

@implementation Blocks

@synthesize limit = _limit;

-(id) initWithLimit:(int)limit
{
    self = [super init];
    if (self)
    {
        _limit = limit;
        
        self.block = ^{
            int a = 1;
            int b = 20;
            int c = a;
            a = a + a;
            c = b + b + a;
        };
        
    }
    return self;
}

-(void) runBlock
{
    for (int i = 0; i < self.limit; i++) {
        self.block();
    }
}

-(void) runNonBlock
{
    for (int i = 0; i < self.limit; i++) {
        [self nonBlock];
    }
}

-(void) nonBlock
{
    int a = 1;
    int b = 20;
    int c = a;
    a = a + a;
    c = b + b + a;
}


@end
