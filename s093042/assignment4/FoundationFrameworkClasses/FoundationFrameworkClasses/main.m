//
//  main.m
//  FoundationFrameworkClasses
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSUInteger numberOfIterations = 1000000;
        
        if(argc > 1)
            numberOfIterations = atoi(argv[1]);
        
        // start the timer
        NSDate *start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            NSNumber *j = [NSNumber numberWithInteger:i];
        }
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations using NSUInteger and using NSNumbers to hold the value took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // start the timer
        start = [NSDate date];
        for(int i = 0; i < numberOfIterations; i++)
        {
            int j = i;
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations using int and using int to hold the value took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // copying
        // start the timer
        start = [NSDate date];
        for(int i = 0; i < numberOfIterations; i++)
        {
            [@"Testing" copy];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of NSString copying took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // NSNumber factory
        // start the timer
        start = [NSDate date];
        for(int i = 0; i < numberOfIterations; i++)
        {
            [NSNumber numberWithDouble:1.2];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling the double number factory of NSNumber took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // NSArray count
        NSUInteger numberOfElements = 100000;
        NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:100000];
        for(NSUInteger i = 0; i < numberOfElements; i++)
            [tmpArray addObject:[NSNumber numberWithInteger:i]];
        // start the timer
        start = [NSDate date];
        for(int i = 0; i < numberOfIterations; i++)
        {
            [tmpArray count];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of counting the elements of a NSMutableArray took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
    }
    return 0;
}

