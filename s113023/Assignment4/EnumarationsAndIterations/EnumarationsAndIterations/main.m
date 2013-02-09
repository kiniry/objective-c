//
//  main.m
//  EnumarationsAndIterations
//
//  Created by Andreas Haure on 23/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //-----------------------------------------------\\
        //     TEST CASES ON ENUMARATION MANIPULATION    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        // Tests to see how costly different types of enumarations and iterations can be...
        //MORE TEXT HERE...
        
        
        //--------------------------\\
        //     Prepare for tests    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        // Creating array to test on
        long iterations = 100000000;
        NSLog(@"Enter number of iterations");
        scanf("%ld",&iterations);
        NSLog(@"You have chosen %ld iterations",iterations);
        
        NSLog(@"Initializing array for tests");

        NSMutableArray *array = [NSMutableArray arrayWithCapacity:iterations];
        //Fill array with numbers from zero to iterations
        for (int i = 0; i<iterations;i++){
            [array addObject:[NSNumber numberWithInt:i]];
        }
        NSLog(@"Initializing complete");
        
        //----------------------------------------------------------------\\
        //     Test using normal iteration - C-style access to element    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Test using normal iteration and C-style array access to element started");
        NSDate *start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            array[i];
        }
        double timePassedUsingNormalIteration1 = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Test using normal iteration and C-style array access to element finished");
        
        //-----------------------------------------------------------------\\
        //     Test using normal iteration - Using objectAtIndex method    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Test using normal iteration and objectAtIndex access to element started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [array objectAtIndex:i];
        }
        double timePassedUsingNormalIteration2 = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Test using normal iteration and objectAtIndex access to element finished");
        
        //--------------------------------------\\
        //     Test using normal enumaration    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Test using normal enumeration to access elements started");
        start = [NSDate date];
        NSEnumerator *enumerator = [array objectEnumerator];
        id currentNumber;
        while (currentNumber = [enumerator nextObject]){
            currentNumber;
        }
        double timePassedUsingNormalEnumeration = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Test using normal enumeration to access elements finished");
        
        //------------------------------------\\
        //     Test using fast enumaration    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Test using fast enumeration to access elements started");
        start = [NSDate date];
        for (id i in array){
            i;
        }
        double timePassedUsingFastEnumeration = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Test using fast enumeration to access elements finished");
        
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Normal iteration using c-style acces to %ld array elements took %f seconds",iterations,timePassedUsingNormalIteration1);
        NSLog(@"Normal iteration using objectAtIndex to %ld array elements took %f seconds",iterations,timePassedUsingNormalIteration2);
        NSLog(@"Normal enumeration to %ld array elements took %f seconds",iterations,timePassedUsingNormalEnumeration);
        NSLog(@"Fast enumeration to %ld array elements took %f seconds",iterations,timePassedUsingFastEnumeration);
    }
    return 0;
}

