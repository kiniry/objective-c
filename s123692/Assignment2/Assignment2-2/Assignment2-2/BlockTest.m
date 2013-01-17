//
//  BlockTest.m
//  Assignment2-2
//
//  Created by Markus Færevaag on 16.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest

-(void) runSomeBlockWithMsg: (NSString *)msg
{
    [self giveSomeBlock](msg);
}

-(void) runSomeBlocksThreaded
{
    [self giveSomeBlock](@"Passed block arg threaded");
}

-(SimpleBlockWithArg) giveSomeBlock
{
    __block NSNumber* localNum = [NSNumber numberWithInt:1];
    return ^(NSString* msg) {
        NSLog(@"Block executing (and increasing localNum)");
        NSLog(@"> Passed arg: %@", msg);
        NSLog(@"> LocalNum: %@", localNum);
    };
}

@end
