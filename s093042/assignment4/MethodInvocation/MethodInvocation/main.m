//
//  main.m
//  MethodInvocation
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MethodsClass.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSUInteger numberOfIterations = 1000;
        
        if(argc > 1)
            numberOfIterations = atoi(argv[1]);
        
        MethodsClass *methodsClassInstance = [[MethodsClass alloc] init];
        
        // normal method invocation
        // start the timer
        NSDate *start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [methodsClassInstance computeInstanceMethod];
        }
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling an instance method using brackets took %f ms", numberOfIterations, (timeInterval*-1000));

        
        // normal class method invocation
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [MethodsClass computeClassMethod];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling a class method using brackets took %f ms", numberOfIterations, (timeInterval*-1000));

        
        // using selectors gives warnings:
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        
        // instance method invocation using selector:
        SEL computeInstaceMethodSelector = @selector(computeInstanceMethod);
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [methodsClassInstance performSelector:computeInstaceMethodSelector];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling an instance method using selectors took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // instance method invocation using selector:
        SEL computeClassMethodSelector = @selector(computeClassMethod);
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            [MethodsClass performSelector:computeClassMethodSelector];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling a class method using selectors took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // instance method invocation using selector and introspection
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            if([methodsClassInstance isKindOfClass:[MethodsClass class]] && [methodsClassInstance respondsToSelector:computeInstaceMethodSelector])
            {
                [methodsClassInstance performSelector:computeInstaceMethodSelector];
            }
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling an instance method using selectors and verifying using introspection took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // instance method invocation using selector:
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            if([MethodsClass respondsToSelector:computeClassMethodSelector])
            {
                [MethodsClass performSelector:computeClassMethodSelector];
            }
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of calling a class method using selectors and verifying using introspection took %f ms", numberOfIterations, (timeInterval*-1000));
        
        
        // get warnings back from compiler...
        #pragma clang diagnostic pop
        
        
        // normal dot-syntax property
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            int t = methodsClassInstance.instanceProperty;
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of getting a property using dot-syntax took %f ms", numberOfIterations, (timeInterval*-1000));
        
        // normal dot-syntax property
        // start the timer
        start = [NSDate date];
        for(NSUInteger i = 0; i < numberOfIterations; i++)
        {
            int t = [methodsClassInstance instanceProperty];
        }
        timeInterval = [start timeIntervalSinceNow];
        
        // get the result
        NSLog(@"%lu iterations of getting a property using method call style took %f ms", numberOfIterations, (timeInterval*-1000));
    }
    return 0;
}

