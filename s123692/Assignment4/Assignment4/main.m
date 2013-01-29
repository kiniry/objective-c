//
//  main.m
//  Assignment4
//
//  Created by Markus Færevaag on 24.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeTask.h"
#import "Recursion.h"
#import "Enumeration.h"
#import "StringManipulation.h"
#import "Blocks.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Recursion
        int limit = 40;
        NSLog(@"Fibonacci limit: %d", limit);
        TimeTask([Recursion fibonacci:limit], @"Fibonacci");
        TimeTask([Recursion fibonacciTailRecursive:limit],
                 @"Fibonacci, tail recursive");
        
        // Enumeration
        Enumeration *enumarator = [[Enumeration alloc] initWithLimit:1000000];
        TimeTask([enumarator classicIteration], @"Classic iteration");
        TimeTask([enumarator classicEnumeration], @"Classic enumeration");
        TimeTask([enumarator fastEnumeration], @"Fast enumeration");
        
        // String Manipulation
        StringManipulation *manipulator = [[StringManipulation alloc] initWithIterations:100000];
        TimeTask([manipulator manipulateImmutableString],
                 @"Manipulate immutable string");
        TimeTask([manipulator manipulateMutableString],
                 @"Manipulate mutable string");
        
        // Blocks
        Blocks *blox = [[Blocks alloc] initWithLimit:5000000];
        TimeTask([blox runBlock], @"Blocks");
        TimeTask([blox runNonBlock], @"Nonblock");
        
    }
    return 0;
}

