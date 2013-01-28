//
//  main.m
//  assignment4
//
//  Created by Magloire on 1/28/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        int cost = [LevenshteinDistance distanceBetween:@"kitten" and:@"sitting"];
        
        long cost1 = [LevenshteinDistance distanceUsingRecursionBetween:@"rosettacode" and:@"raisethysword"];
        NSLog(@"the distance using iteration is %i", cost);
        NSLog(@"the distance using recursion is %li", cost1);
        
    }
    return 0;
}

