//
//  StringManipulation.m
//  StringManipulation
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "StringManipulation.h"

@interface StringManipulation ()

// make it nonatomic so there is no overhead...
@property (nonatomic) NSMutableString *string;

@property NSUInteger iterations;

@end

@implementation StringManipulation

-(id)initWithIterations:(NSUInteger)numberOfIterations
{
    self = [super init];
    if(self)
    {
        _iterations = numberOfIterations;
        // set empty string
        _string = [NSMutableString string];
    }
    return self;
}

-(void)compute
{
    for (NSUInteger i = 0; i < self.iterations; i++) {
        [self.string appendString:@"a"];
    }
}

@end
