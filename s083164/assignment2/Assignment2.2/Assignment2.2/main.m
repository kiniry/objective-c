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
        /*
         The Foundation framework provides several useful classes. Among these are the
        NSObject, NSArray etc. As the name implies it forms the foundation of the
        Objective-C language used for development on the Macintosh platform.
            
        The Foundation framework is similar to Java's java.lang and java.util packages
        and provides alot of the same functionality. They are both fundamental to the
        programming languages.
         */
        
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
        
        //------------------------------------------------------------------------------------------------------
        
        //aliasing
        /*
         One pointer is aliasing another when they point to the same memory location.
         */
        
        //alloc/init
        /*
         In Objective-C object are created using the alloc/init pattern. First memory is
         allocated using the alloc method. It is defined in the NSObject, which all
         objects in Objective-C inherits from. The alloc method returns a pointer to the
         memory allocated. The pointer is given to the init method (which returns an id) which makes sure that
         the class properties are initielized. The pattern looks like this:
         
         [[Object alloc] init]
         
         Many classes provide initialization methods that takes arguments, so that the
         properties values can be set at the moment of initialization. It is possible to
         initilize objects in other ways but this is the recommended pattern by Apple.
         
         To initialize objects in Java one uses the keyword new.
         */
        
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
        
        //------------------------------------------------------------------------------------------------------
        
        //Constructors & Factories
        
        //We have already seen an example of a factory, a class method that initializes an instance. As an example:
        EKKPerson *factoryInit = [EKKPerson initWithFactory:@"Factory Superman"];
        
        //The NSNumber is an example:
        NSNumber *number = [NSNumber numberWithInt:10];
        
        //Theres an even shorter syntax using the Objective-C literal syntax which are equivalent to class facrtory methods
        NSNumber *newNumber = @10;
        
        //Many Java classes found in the java.util and java.lang also has factories
        
        //------------------------------------------------------------------------------------------------------
        
        //Copying and cloning
        /*
         Using the float1 = float2 operator with primitive datatypes copies the content of flaot2 into float1's memory location. You end up with two memory locations that contains the same value.
         When we are dealing with objects the = operation would would only copy the reference to the object. 
         */
        
        NSString *string1 = @"string 1 content";
        NSString *string2 = @"string 2 content";
        
        string1 = string2;
        NSLog(@"The content of string1 is %@ and string1 is saved at %p", string1, string1);
        NSLog(@"The content of string2 is %@ and string2 is saved at %p", string2, string2);
        
        /*
         For more info look here:
         https://developer.apple.com/library/ios/#documentation/General/Conceptual/DevPedia-CocoaCore/ObjectCopying.html
         https://developer.apple.com/library/ios/#documentation/CoreFoundation/Conceptual/CFMemoryMgmt/Concepts/CopyFunctions.html
         */
        
        //------------------------------------------------------------------------------------------------------
        
        //Dynamic typing
        
        /*
         In Objective-C you can use the id to indicate that the object it points to isnt checked at compile time. It can therefor point to any kind of object. If the object doesnt respond to a certain message, you will get a error and runtime and the program will crash.
         */
        
        id a = @[@"First",@"Second",@"Third"];
        
        NSLog(@"The length of a is %ld", (unsigned long)[a count]);
        
        /*This would crash at runtime
         NSLog(@"The length of a is %d", [a messageThatArrayDoesntRespondTo]);
         */
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Expanded type
        
    
        //------------------------------------------------------------------------------------------------------
        
        //Field hiding
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Immutability
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Inheritance
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Logging
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Method overloading
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Polymorphism
        
        
        //------------------------------------------------------------------------------------------------------
        
        //NSArray
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Nil
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Primitive types
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Protocols
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Singletons
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Static and dynamic method resolution
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Strong vs. Weak pointers
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Variance
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Exceptions
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Value boxing and unboxing
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Introspection
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Enumerations
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Property lists
        
        
        //------------------------------------------------------------------------------------------------------
        
        //Blocks
        
        
        //------------------------------------------------------------------------------------------------------
        
        
        
    }
    return 0;
}

