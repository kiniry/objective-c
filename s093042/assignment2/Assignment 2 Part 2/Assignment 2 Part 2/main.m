//
//  main.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FoundationFramework.h"
#import "AClass.h"
#import "AFactoryClass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Experiments running...");
        
        // Run Foundation framework experiments
        [FoundationFramework runExperiments];
        
        // Aliasing
        
        // Run ObjectInstantiation experiments
        // Allocate memory for the instance calling 'alloc', and call the "constructor"/initializer using 'init'
        AClass *someClass = [[AClass alloc] init];
        NSLog(@"%@", someClass);
        // Initialize this instance using the initializer that sets the 'aProperty' from the 'AClass' object.
        AClass *someOtherClass = [[AClass alloc] initWithParameter:@"This string came from the instantiation."];
        NSLog(@"%@", someOtherClass);
        
        // class types
        
        // Run Factories experiments
        // We use our class' factory method to create (allocate memory and initialize) and see what was set in the object.
        AFactoryClass *anObjectFromFactory = [AFactoryClass aFactoryClassWithNoParameterSet];
        NSLog(@"%@", anObjectFromFactory);
        // We also try our other factory method:
        AFactoryClass *anotherObjectFromFactory = [AFactoryClass aFactoryClassWithAParameterSet];
        NSLog(@"%@", anotherObjectFromFactory);
        
        NSLog(@"Experiments done.");
    }
    return 0;
}

