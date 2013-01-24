//
//  main.m
//  fibonacci
//
//  Created by Anders Emil Nielsen on 23/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fibonacci.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        static int maxFibonacciIndex = 50;
        
        NSDate *start;
        for (int i = 1; i < maxFibonacciIndex; i++) {
            start = [NSDate date];
            [Fibonacci calculateFibonacciForIndex:i];
            NSLog(@"Fib(%d) took %fs", i, [[NSDate date] timeIntervalSinceDate:start]);
        }
    }
    return 0;
}

