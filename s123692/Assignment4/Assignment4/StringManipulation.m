//
//  StringManipulation.m
//  Assignment4
//
//  Created by Markus Færevaag on 25.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "StringManipulation.h"

@implementation StringManipulation

@synthesize immutableString = _immutableString;
@synthesize mutableString   = _mutableString;
@synthesize iterations      = _iterations;

-(id) initWithIterations:(int)iterations
{
    self = [super init];
    if (self)
    {
        _immutableString = [[NSString alloc] init];
        _mutableString = [[NSMutableString alloc] init];
        _iterations = iterations;
        
    }
    return self;
}

-(void) manipulateImmutableString
{
    for (int i = 0; i < self.iterations; i++) {
        self.immutableString = [NSString stringWithFormat:@"LOL %@",
                                [NSString stringWithFormat:@"LOL "]];
    }
}

-(void) manipulateMutableString
{
    for (int i = 0; i < self.iterations; i++) {
        [self.mutableString appendString:@"LOL "];
    }
}

@end
