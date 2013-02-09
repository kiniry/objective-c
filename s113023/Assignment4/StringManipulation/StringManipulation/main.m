//
//  main.m
//  StringManipulation
//
//  Created by Andreas Haure on 23/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //------------------------------------------\\
        //     TEST CASES ON STRING MANIPULATION    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        // Tests to see how costly string manipulations can be...
        //MORE TEXT HERE...
        
        
        //--------------------------\\
        //     Prepare for tests    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        // Creating string to test on1
        NSMutableString *stringMutable = [NSMutableString string];
        NSString *stringImmutable = [stringMutable copy];
        unsigned int iterations = 10000;
        //NSLog(@"Enter number of iterations");
        //scanf("%d",&iterations);
        //NSLog(@"You have chosen %ld iterations",iterations);
        
        
        //-----------------------------------------\\
        //     Run mutableString appending test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"mutableString appending test started");
        NSDate *start = [NSDate date];
        
        for (unsigned int i=0; i < iterations; i++){
            [stringMutable appendString:@"a"];
        }
        NSLog(@"mutableString appending test finished");
        double timePassedAppendingMutable = [[NSDate date] timeIntervalSinceDate:start];
                    
        //-------------------------------------------\\
        //     Run immutableString appending test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"immutableString appending test started");
        start = [NSDate date];
        
        for (unsigned int i=0; i < iterations; i++){
            [stringImmutable stringByAppendingString:@"a"];
        }
        NSLog(@"immutableString appending test finished");
        double timePassedAppendingImmutable = [[NSDate date] timeIntervalSinceDate:start];
                
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"MutableString appending took %f seconds doing %d additions",timePassedAppendingMutable,iterations);
        NSLog(@"ImmutableString appending took %f seconds doing %d additions",timePassedAppendingImmutable,iterations);
        NSLog(@"MutableString time spent pr char appended: %f ms",timePassedAppendingMutable/iterations*1000);
        NSLog(@"ImmutableString time spent pr char appended: %f ms",timePassedAppendingImmutable/iterations*1000);
        
    }
    return 0;
}

