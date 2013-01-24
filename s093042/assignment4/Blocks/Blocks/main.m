//
//  main.m
//  Blocks
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Blocks.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSUInteger numberOfIterations = 100000;
        
        if(argc > 1)
        {
            numberOfIterations = atoi(argv[1]);
        }
        
        // init
        Blocks *blocksTests = [[Blocks alloc] init];
        
        // test small blocks
        // start the timer
        NSDate *start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useSmallBlock];
        }
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using small blocks took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test large blocks
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useLargeBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using large blocks took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test declaring and calling blocks with bound variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [Blocks declareAndCallBlockWithBoundVariables];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of declaring and calling blocks with bound variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test declaring and calling blocks with internal variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [Blocks declareAndCallBlockWithInternalVariables];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of declaring and calling blocks with internal variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test use of internal variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useInternalVariablesInBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using internal variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test use of external variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useExternalVariablesInBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using external variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test use of bound prmitive type variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useBoundPrimitiveTypeInBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using bound primtive type variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test use of free prmitive type variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useFreePrimitiveTypeInBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using free primtive type variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test use of bound reference type variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useBoundReferenceTypeInBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using bound reference type variables took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test use of free reference type variables
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [blocksTests useFreeReferenceTypeInBlock];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using free reference type variables took %f ms", numberOfIterations, (timeInterval*-1000));
    }
    
    return 0;
}

