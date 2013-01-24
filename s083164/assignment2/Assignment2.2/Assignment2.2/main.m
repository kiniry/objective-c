//
//  main.m
//  Assignment2.2
//
//  Created by Emil Klarskov Kristensen on 1/18/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKKPerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // 1. Foundation Framework
        
        /*
                                        ---NSArray---
         NSArray is immutable and cant be changed after creation. For a mutable use NSMutableArray
         The following creates a imutable NSArray using its factory method
         */
        NSArray  *firstArray = [NSArray arrayWithObjects:@"First",@"Second",@"Third",nil];
        // Can also be created using alloc/init
        NSArray *firstArrayCreatedWithAllocAndInit = [[NSArray alloc] initWithObjects:@"First",@"Second",@"Third",nil];
        //NSArray provides several methods. For example you can ask if it contains a certain object:
        BOOL contained = [firstArray containsObject:@"First"];
        
        /*
         Compare this to the Java Array found in java.util
         String[] firstArray = {"First", "Second", "Third" };
         */
        
        /*
                                        ---NSString---
        NSString is a object that manages textstrings. NSString's are imutable.
        */
        NSString *firstString = @"textstring";
        
        // The NSString object provides several methods.
        NSString *newString = [firstString uppercaseString];
        
        
        // 3. alloc/init
        // All objects inherit from NSObject and therefor has a init method
        EKKPerson *standardInit = [[EKKPerson alloc] init];
        
        NSLog(@"%@", standardInit.name);
        
        // Implemented init method that instantiates the object with a name
        EKKPerson *personInitWithName = [[EKKPerson alloc] initWithName:@"Superman"];
        
        NSLog(@"%@", personInitWithName.name);
        
    }
    return 0;
}

