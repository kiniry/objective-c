//
//  Fibonacci.m
//  fibonacci
//
//  Created by Anders Emil Nielsen on 23/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "Fibonacci.h"

@implementation Fibonacci

+ (int)calculateFibonacciForIndex:(int)N;
{
    // Base case
    if (N <= 2) return 1;
    
    // Recursive case
    return [Fibonacci calculateFibonacciForIndex:(N - 1)] +
           [Fibonacci calculateFibonacciForIndex:(N - 2)];
}

@end
