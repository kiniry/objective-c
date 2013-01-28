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
        NSMutableString *string = [NSMutableString string];
        unsigned int iterations = 50000;
        NSLog(@"Enter number of iterations");
        scanf("%d",&iterations);
        //NSLog(@"You have chosen %ld iterations",iterations);
        int additions = 0;
        int removals = 0;
        
        
        //----------------------------------\\
        //     Run string appending test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        //NSLog(@"String appending test started");
        NSDate *start = [NSDate date];
        
        for (unsigned int i=0; i < iterations; i++){
            [string appendString:@"a"];
            //additions++;
        }
        //NSLog(@"String appending test finished");
        double timePassedAppending = [[NSDate date] timeIntervalSinceDate:start];
                
        NSString *filledString = [string mutableCopy];
        
        //--------------------------------\\
        //     Run string removal test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSMutableString *stringForRemoval = [filledString mutableCopy];

        NSRange firstChar = NSMakeRange(0,1);
        //NSLog(@"String removal test started");
        start = [NSDate date];
        for (unsigned int i=0; i< iterations; i++){
            [stringForRemoval replaceCharactersInRange:firstChar withString:@""];
            //removals++;
        }
        //NSLog(@"String removal test finished");
        double timePassedRemoval = [[NSDate date] timeIntervalSinceDate:start];
                
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"String appending took %f seconds doing %d additions",timePassedAppending,additions);
        NSLog(@"String removal took %f seconds doing %d removals",timePassedRemoval,removals);
        NSLog(@"Overall manipulations took %f seconds",timePassedAppending+timePassedRemoval);
        
    }
    return 0;
}

