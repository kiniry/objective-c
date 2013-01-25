//
//  main.m
//  Protocols
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LargeProtocol.h"
#import "OneProtocol.h"
#import "MultipleProtocols.h"
#import "SmallProtocol.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSUInteger numberOfIterations = 1000000;
        
        if(argc > 1)
        {
            numberOfIterations = atoi(argv[1]);
        }
        
        // test small protocols
        id <SmallProtocol> smallProtocolUse = [[SmallProtocol alloc]init];
        // start the timer
        NSDate *start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [smallProtocolUse testing];
        }
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using small protocol took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test large protocols
        id <LargeProtocol> largeProtocolUse = [[LargeProtocol alloc]init];
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [largeProtocolUse testing];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using large protocol took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // test small protocols
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            id <SmallProtocol> smallProtocolAllocUse = [[SmallProtocol alloc]init];
            [smallProtocolAllocUse testing];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of allocating and using small protocols took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test large protocols
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            id <LargeProtocol> largeProtocolAllocUse = [[LargeProtocol alloc]init];
            [largeProtocolAllocUse testing];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of allocating and using large protocols took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test one protocols
        id <Protocol1> oneProtocolUse = [[OneProtocol alloc]init];
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [oneProtocolUse aMethod];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using only one protocol took %f ms", numberOfIterations, (timeInterval*-1000));

        // test multiple protocols
        id <Protocol1, Protocol2, Protocol3, Protocol4, Protocol5> multipleProtocolUse = [[MultipleProtocols alloc]init];
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [multipleProtocolUse aMethod];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of using multiple protocols took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test one protocols
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            id <Protocol1> oneProtocolAllocUse = [[OneProtocol alloc]init];
            [oneProtocolAllocUse aMethod];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of allocating and using only one protocol took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // test multiple protocols
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            id <Protocol1, Protocol2, Protocol3, Protocol4, Protocol5> multipleProtocolAllocUse = [[MultipleProtocols alloc]init];
            [multipleProtocolAllocUse aMethod];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of allocating and using multiple protocols took %f ms", numberOfIterations, (timeInterval*-1000));
    }
    return 0;
}

