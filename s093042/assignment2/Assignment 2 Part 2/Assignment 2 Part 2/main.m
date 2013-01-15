//
//  main.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FoundationFramework/FoundationFramework.h"

#import "ObjectInstantiation/AClass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Experiments running...");
        
        // Run Foundation framework experiments
        [FoundationFramework runExperiments];
        
        // Run ObjectInstantiation experiments
        // Allocate memory for the instance calling 'alloc', and call the "constructor"/initializer using 'init'
        AClass *someClass = [[AClass alloc] init];
        NSLog(@"%@", someClass);
        // Initialize this instance using the initializer that sets the 'aProperty' from the 'AClass' object.
        AClass *someOtherClass = [[AClass alloc] initWithParameter:@"This string came from the instantiation."];
        NSLog(@"%@", someOtherClass);
        
        NSLog(@"Experiments done.");
    }
    return 0;
}

