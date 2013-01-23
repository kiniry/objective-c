//
//  main.m
//  StringManipulation
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StringManipulation.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSUInteger numberOfIterations = 1000;
        
        if(argc > 1)
            numberOfIterations = atoi(argv[1]);
        
        StringManipulation *strMan = [[StringManipulation alloc]initWithIterations:numberOfIterations];
        
        // start the timer
        NSDate *start = [NSDate date];
        [strMan compute];
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of string manipulation took %f ms", numberOfIterations, (timeInterval*-1000));
    }
    return 0;
}

