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
#import "FieldHidingClass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Experiments running...");
        
        // Foundation framework experiments
        [FoundationFramework runExperiments];
        
        // Aliasing
        
        // ObjectInstantiation experiments
        // Allocate memory for the instance calling 'alloc', and call the "constructor"/initializer using 'init'
        AClass *someClass = [[AClass alloc] init];
        NSLog(@"%@", someClass);
        // Initialize this instance using the initializer that sets the 'aProperty' from the 'AClass' object.
        AClass *someOtherClass = [[AClass alloc] initWithParameter:@"This string came from the instantiation."];
        NSLog(@"%@", someOtherClass);
        
        // class types
        
        // Factories experiments
        // We use our class' factory method to create (allocate memory and initialize) and see what was set in the object.
        AFactoryClass *anObjectFromFactory = [AFactoryClass aFactoryClassWithNoParameterSet];
        NSLog(@"%@", anObjectFromFactory);
        // We also try our other factory method:
        AFactoryClass *anotherObjectFromFactory = [AFactoryClass aFactoryClassWithAParameterSet];
        NSLog(@"%@", anotherObjectFromFactory);
        
        // Copy and cloning of objects experiments
        // NSObject does not implement the NSCopying protocol, the method 'copyWithZone' is invoked when calling 'copy' on a NSObject.
        
        // Dynamic typing for pointers
        
        // Dynamic typing for 'id's experiments
        // id is comparable to var in C#
        // and are used mostly for the same purpose, of allowing indirect type regonition of e.g. collections of data.
        
        // Expanded types
        
        // Field hiding experiments
        FieldHidingClass *fieldHidingClass = [FieldHidingClass fieldHidingClassWithDefaultInfo];
        fieldHidingClass.aProperty = @"A test string";
        NSLog(@"%@", fieldHidingClass);
        // the following code is not allowed, even at compile-time, because it is readonly, but it is not really hidden. The error is "Assignment to readonly property".
        //fieldHidingClass.anotherString = @"Another test string";
        // At least not as hidden as 'aPrivateProperty'. Here the following code will give the error "Property 'aPrivateProperty' not found on object of type 'FieldHidingClass *'".
        //fieldHidingClass.aPrivateProperty = @"A third test string";
        // The method 'aVisibleMethod' can be invoked from here:
        [fieldHidingClass aVisibleMethod];
        // But the method 'aHiddenMethod' cannot be invoked, this give the compile-time error "No visible @interface for 'FieldHiddingClass' declares the selector 'aHiddenMethod'".
        //[fieldHidingClass aHiddenMethod];
        
        
        NSLog(@"Experiments done.");
    }
    return 0;
}

