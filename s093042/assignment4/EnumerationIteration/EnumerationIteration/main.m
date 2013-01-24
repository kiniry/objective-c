//
//  main.m
//  EnumerationIteration
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSUInteger numberOfElements = 100000;
        
        if(argc > 1)
            numberOfElements = atoi(argv[1]);
        
        // initialization
        NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:numberOfElements];
        for(NSUInteger i = 0; i < numberOfElements; i++)
            [tmpArray addObject:[NSNumber numberWithInteger:i]];
        
        // normal iteration to get elements of array
        // start the timer
        NSDate *start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfElements; i++)
        {
            tmpArray[i];
        }
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"Enumeration using normal iteration (for loop), using bracket syntax, with %lu ordered elements took %f ms", numberOfElements, (timeInterval*-1000));
        
        // fast enumeration to get elements of array
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfElements; i++)
        {
            [tmpArray objectAtIndex:i];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"Enumeration using normal iteration (for loop) using 'objectAtIndex' method, with %lu ordered elements took %f ms", numberOfElements, (timeInterval*-1000));
        
        // enumeration to get elements of array
        // start the timer
        start = [NSDate date];
        NSEnumerator *enumerator = [tmpArray objectEnumerator];
        id tmpI;
        while((tmpI = [enumerator nextObject]))
        {
            tmpI;
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"Enumeration using enumeration with %lu ordered elements took %f ms", numberOfElements, (timeInterval*-1000));
        
        // fast enumeration to get elements of array
        // start the timer
        start = [NSDate date];
        for(id i in tmpArray)
        {
            i;
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"Enumeration using fast enumeration with %lu ordered elements took %f ms", numberOfElements, (timeInterval*-1000));
        
    }
    return 0;
}

