//
//  Recursion.m
//  Assignment4
//
//  Created by Markus Færevaag on 24.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Recursion.h"

@implementation Recursion

+(int) fibonacci:(int)n
{
    if (n == 0 || n == 1)
    {
        return n;
    } else
    {
        return ([Recursion fibonacci:(n-1)] +
                [Recursion fibonacci:(n-2)]);
    }
}

+(int) fibonacciTailRecursive:(int)n
{
    return [Recursion recWithA:0 andB:1 andN:n];
}

+(int) recWithA:(int)a andB:(int)b andN:(int)n
{
    return (n < 1)? a :(n == 1)?  b : [Recursion recWithA:b andB:a+b andN:(n-1)];
}
@end
