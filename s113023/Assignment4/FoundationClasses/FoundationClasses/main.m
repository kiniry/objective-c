//
//  main.m
//  FoundationClasses
//
//  Created by Andreas Haure on 24/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

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
        
        // Creating array to test on
        
        NSLog(@"Initializing array for tests");
        
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:iterations];
        //Fill array with numbers from zero to iterations
        for (int i = 0; i<iterations;i++){
            [mutableArray addObject:[NSNumber numberWithInt:i]];
        }
        NSLog(@"Initializing complete");
        
        // Create dictionary to test on
        
        NSLog(@"Initializing dictionary for tests");
        
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        for (int i=0; i < iterations; i++){
            [dictionary setObject:[NSNumber numberWithInt:i] forKey:[NSString stringWithFormat:@"%u",i]];
        }
        NSLog(@"Initializing complete");
        
        //------------------------------------------\\
        //     Count elements in immutable array    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSArray *immutableArray = [mutableArray copy];
        NSLog(@"Count elements in immutable array test started");
        NSDate *start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [immutableArray count];
        }
        double timePassedImmutableArrayCount = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Count elements in immutable array test finished");
        
        //----------------------------------------\\
        //     Count elements in mutable array    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Count elements in mutable array test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [mutableArray count];
        }
        double timePassedMutableArrayCount = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Count elements in mutable array test finished");
        
        //-------------------------------------------\\
        //     Wrap integer in NSNumber (Factory)    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Wrap integer in NSNumber object (Factory) test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            NSNumber *currentNumber = [NSNumber numberWithInt:i];
        }
        double timePassedWrappingIntegersInNSNumberFactory = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Wrap integer in NSNumber object (Factory) test finished");
        
        //--------------------------------------------\\
        //     Wrap integer in NSNumber (Instance)    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Wrap integer in NSNumber object (Instance) test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            NSNumber *currentNumber = [currentNumber initWithInt:i];
        }
        double timePassedWrappingIntegersInNSNumberInstance = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Wrap integer in NSNumber object (Instance) test finished");

        
        //------------------------------\\
        //     Save normal C-integer    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Save normal integer test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            int currentNumber = i;
        }
        double timePassedSavingNormalCIntegers = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Save normal integer test finished");
        
        //-----------------------------\\
        //     Immutable dictionary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSDictionary *immutableDictionary = [dictionary copy];
        NSLog(@"Test on immutable dictionary started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [immutableDictionary objectForKey:[NSString stringWithFormat:@"%u",i]];
        }
        double timePassedWithImmutableDictionary = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Test on immutable dictionary finished");
        
        //---------------------------\\
        //     Mutable dictionary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Test on mutable dictionary started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [dictionary objectForKey:[NSString stringWithFormat:@"%u",i]];
        }
        double timePassedWithMutableDictionary = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Test on mutable dictionary finished");
        
        
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        NSLog(@"Counted %ld objects in immutable array in %f seconds",iterations,timePassedImmutableArrayCount);
        NSLog(@"Counted %ld objects in mutable array in %f seconds",iterations,timePassedMutableArrayCount);
        NSLog(@"Created %ld normal C integers in %f seconds",iterations,timePassedSavingNormalCIntegers);
        NSLog(@"Wrapped %ld normal integers in NSNumbers using factory method in %f seconds",iterations,timePassedWrappingIntegersInNSNumberFactory);
        NSLog(@"Wrapped %ld normal integers in NSNumbers using instance method in %f seconds",iterations,timePassedWrappingIntegersInNSNumberInstance);
        NSLog(@"Looped through %ld objects in immutable dictionary in %f seconds",iterations,timePassedWithImmutableDictionary);
        NSLog(@"Looped through %ld objects in mutable dictionary in %f seconds",iterations,timePassedWithMutableDictionary);

    }
    return 0;
}

