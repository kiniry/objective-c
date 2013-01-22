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
        
        //Foundation Framework
        
        NSLog(@"Foundation framework");
        //Below is two examples how objects found in the Foundation Framework, NSArray and NSString
        
        // ---NSArray---
        //NSArray is immutable and cant be changed after creation. For a mutable use NSMutableArray
        //The following creatappes a imutable NSArray using its factory method
        NSArray  *firstArray = [NSArray arrayWithObjects:@"First",@"Second",@"Third",nil];
        
        // It can also be created using alloc/init
        NSArray *firstArrayCreatedWithAllocAndInit = [[NSArray alloc] initWithObjects:@"First",@"Second",@"Third",nil];
        
        //NSArray provides several methods. For example you can ask if it contains a certain object:
        BOOL contained = [firstArray containsObject:@"First"];
        
        //Compare this to the Java Array found in java.util
        //String[] firstArray = {"First", "Second", "Third" };
        
        //---NSString---
        //NSString is a object that manages textstrings. NSString's are imutable.
        
        NSString *firstString = @"textstring";
        
        // The NSString object provides several methods.
        NSString *newString = [firstString uppercaseString];
        
        //---------------------------------------------------
        
        //alloc/init
        
        NSLog(@"alloc/init");
        
        // All objects inherit from NSObject and therefor has a init method
        EKKPerson *standardInit = [[EKKPerson alloc] init];
        
        NSLog(@"%@", standardInit.name);
        
        //Compare to Java's new
        //EKKPerson standardInit = new EkkPerson()
        
        // Implemented init method that instantiates the object with a name
        EKKPerson *personInitWithName = [[EKKPerson alloc] initWithName:@"Superman"];
        
        NSLog(@"%@", personInitWithName.name);
        
        //Compare to Java using custom constructor
        //EKKPerson standardInit = new EkkPerson("Superman")
        
        //---------------------------------------------------
        
        //Constructors & Factories
        
        //We have already seen an example of a factory, a class method that initializes an instance. As an example:
        EKKPerson *factoryInit = [EKKPerson initWithFactory:@"Factory Superman"];
        
        //The NSNumber is an example:
        NSNumber *number = [NSNumber numberWithInt:10];
        
        //Theres an even shorter syntax using the Objective-C literal syntax which are equivalent to class facrtory methods
        NSNumber *newNumber = @10;
        
        //Many Java classes found in the java.util and java.lang also has factories
        
        //---------------------------------------------------
        
    }
    return 0;
}

