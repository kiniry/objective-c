//
//  main.m
//  Blocks
//
//  Created by Andreas Haure on 27/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FunWithBlocks.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //--------------------------\\
        //     Prepare for tests    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        long iterations = 100000000;
        
        NSLog(@"Enter number of iterations");
        scanf("%ld",&iterations);
        NSLog(@"You have chosen %ld iterations",iterations);
        
        //-------------------------\\
        //     Normal operation    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Perform normal operations without block started");
        NSDate *start = [NSDate date];
        for (int i = 0; i< iterations; i++){
            int a = 1;
            int b = a;
            a = b + a;
        }
        double timePassedNormalOperation = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Perform normal operations without block finished");
        
        //-------------------------\\
        //     Normal operation    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Perform method call for normal operations started");
        start = [NSDate date];
        for (int i = 0; i< iterations; i++){
            [FunWithBlocks funWithBlocks];
        }
        double timePassedMethodCall = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Perform method call for normal operations finished");
        
        //------------------------------\\
        //     Operation using block    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Perform operations in block started");
        start = [NSDate date];
        
        void(^funWithBlocks)(void) = ^{
            int a = 1;
            int b = a;
            a = b + a;
        };
        
        for (int i = 0; i< iterations; i++){
            funWithBlocks();
        }
        double timePassedUsingBlock = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Perform operations in block finished");
        
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Performed normal operations %ld times and spent %f seconds doing it",iterations,timePassedNormalOperation);
        NSLog(@"Performed method calls for normal operation %ld times and spent %f seconds doing it",iterations,timePassedMethodCall);
        NSLog(@"Performed operations in block %ld times and spent %f seconds doing it",iterations,timePassedUsingBlock);
    }
    return 0;
}

