//
//  main.m
//  MethodInvocations
//
//  Created by Andreas Haure on 24/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RandomObject.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //----------------------------------------\\
        //     TEST CASES ON METHOD INVOCATION    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        // Tests to see how costly method invocations can be...
        //MORE TEXT HERE...
        
        
        //--------------------------\\
        //     Prepare for tests    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        // Creating instance of randomObject object to test instance method on
        RandomObject *randomObject = [[RandomObject alloc] init];
        long iterations = 100000000;
        NSLog(@"Enter number of iterations");
        scanf("%ld",&iterations);
        NSLog(@"You have chosen %ld iterations",iterations);

        //-------------------------------------------\\
        //     Call object's instance method test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Call object's instance method test started");
        NSDate *start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [randomObject randomInstanceMethod];
        }
        double timePassedCallingObjectsInstanceMethod = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Call object's instance method test finished");
        
        //--------------------------------------------------------\\
        //     Call object's instance method via selector test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Call object's instance method via selector test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [randomObject performSelector:@selector(randomInstanceMethod)];
        }
        double timePassedCallingObjectsInstanceMethodViaSelector = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Call object's instance method via selector test finished");
        
        //----------------------------------------\\
        //     Call object's class method test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Call object's class method test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [RandomObject randomClassMethod];
        }
        double timePassedCallingObjectsClassMethod = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Call object's class method test finished");
        
        //-----------------------------------------------------\\
        //     Call object's class method via selector test    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Call object's class method via selector test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            [[RandomObject class] performSelector:@selector(randomClassMethod)];
        }
        double timePassedCallingObjectsClassMethodViaSelector = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Call object's class method via selector test finished");
        
        //----------------------------------------\\
        //     Call object using introspection    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Call object using introspection test started");
        start = [NSDate date];
        for (int i = 0; i < iterations; i++){
            if ([randomObject isKindOfClass:[RandomObject class]]){
                if ([randomObject respondsToSelector:@selector(randomInstanceMethod)]){
                    [randomObject randomInstanceMethod];
                }
            }
        }
        double timePassedCallingObjectUsingIntrospection = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Call object using introspection test finished");
        
        //----------------\\
        //     Summary    \\
        //----------------------------------------------------------------------------------------------------------------//
        
        NSLog(@"Calling Object's instance method %ld times took %f seconds",iterations,timePassedCallingObjectsInstanceMethod);
        NSLog(@"Calling Object's instance method %ld times via selector took %f seconds",iterations,timePassedCallingObjectsClassMethodViaSelector);
        NSLog(@"Calling Object's class method %ld times took %f seconds",iterations,timePassedCallingObjectsInstanceMethodViaSelector);
        NSLog(@"Calling Object's class method %ld times via selector took %f seconds", iterations,timePassedCallingObjectsClassMethodViaSelector);
        NSLog(@"Calling Objects instance method %ld times using introspection took %f seconds",iterations,timePassedCallingObjectUsingIntrospection);
    }
    return 0;
}

