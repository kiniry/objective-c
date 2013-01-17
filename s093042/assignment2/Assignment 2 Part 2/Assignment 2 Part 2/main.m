//
//  main.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FoundationFramework.h" // found in FoundationFramework folder
#import "AClass.h" // found in ObjectInstantiation folder
#import "AFactoryClass.h" // found in Factories folder
#import "FieldHidingClass.h" // found in FieldHiding folder
#import "SimpleProtocolClass.h" // found in Protocols folder

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Experiments running...");
        
        // Foundation framework experiments
        [FoundationFramework runExperiments];
        
        // Aliasing
        // -
        
        // Object instantiation experiments
        // Allocate memory for the instance calling 'alloc', and call the "constructor"/initializer using 'init'
        AClass *someClass = [[AClass alloc] init];
        NSLog(@"%@", someClass);
        // Initialize this instance using the initializer that sets the 'aProperty' from the 'AClass' object.
        AClass *someOtherClass = [[AClass alloc] initWithParameter:@"This string came from the instantiation."];
        NSLog(@"%@", someOtherClass);
        
        // Class types experiments
        // Just like the primitive types dsicussed further down, classes define types for objects, like for a primitive type:
        //int k = 1;
        // the type for an object is
        //AClass *aVarName = [[AClass alloc] init];
        
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
        // -
        
        // Dynamic typing for 'id's experiments
        // id is comparable to var in C#
        // and are used mostly for the same purpose, of allowing indirect type regonition of e.g. collections of data.
        // It can hold any othe type, it is a weak reference, but the * is not required.
        id someObjectFromAFactory = [AFactoryClass aFactoryClassWithNoParameterSet];
        NSLog(@"'aProperty' from the object that is stored using id: %@", [someObjectFromAFactory aProperty]);
        // But it cannot access the 'aProperty' using dot-syntax, unless the id reference is cast to the object:
        NSLog(@"'aProperty' from the object that is stored using id: %@", ((AFactoryClass *)someObjectFromAFactory).aProperty);
        
        // Expanded types experiments
        // -
        
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
        
        // Immutability
        // A pair of objects that do the same thing are the NSArray and NSMutableArray.
        // In the NSArray the content cannot be changed:
        NSArray *anArray = [[NSArray alloc] initWithObjects:@"one", @"two", @"three", nil];
        // But in the mutable version that can be optained from NSArray, the content can be changed:
        NSMutableArray *anotherArray = [anArray mutableCopy];
        [anotherArray addObject:@"four"];
        
        // Inheritance experiments
        // Most of the above used objects inherit from each other, this can be investigated using introspection which experiments are further down
        
        // Logging experiments
        // The mostly used tool to logging is the NSLog, which will put a string representation of a value into the log, the string can be formatted. All the above experiments used the NSLog, here is another example:
        NSLog(@"The description method of the object 'someClass' returns: %@", someClass);
        // As it can be seen the object's 'description' method is called to give a string representation of the object.
        
        // Method overloading experiments
        // Method overloading is not compatible in Objective-C.
        
        // Polymorphism experiments
        // -
        
        // NSArray and monomorphic experiments
        // NSArrays can have many different types of data stored in them, this is typycally not allowed in other languages, also nil, is used as a "stop sign", meaning a NSArray cannot have a nil inside, unless it is wrapped into a container (value boxing).
        // E.g. the following is a legal NSArray:
        anArray = [[NSArray alloc]initWithObjects:@"A string", someClass, [NSNumber numberWithInt:12], nil];
        // This mix of types in an array is not allowed in e.g. C# and Java, unless you box all the data into a container, like Java's 'Object' or C#'s 'object'.
        
        // Nil experiments
        // Here we define a new instance variable, and without allocating memory and without initializing it...
        NSArray *someOtherArray;
        // we can still call the count method, on a nil object, witout any errors at compile-time or run-time. In other languages this would result in a NullException, some compilers even give this error already at comile-time.
        [someOtherArray count];
        
        // Primitive types experiments
        // The primitive types are mostly the same as those found in C:
        //_Bool b = true;
        //char c = 'a';
        //short s = 10;
        int i = 12;
        //long l = 100;
        //long long ll = 1000;
        //float f = 1.2;
        //double d = 1.0;
        //long double ld = 12.10;
        // Some of the types can have unsigned or signed in front as well.
        // Objective-C has also defined its own boolean, where YES and NO are mostly used instead of true and false, respectively.
        //BOOL bo = YES;
        
        // Protocols experiments
        // We do not have to use the class for the type, instead we can use 'id', and define that we use the protocol 'MyProtocol'.
        id <MyProtocol> simpleProtocolClass = [[SimpleProtocolClass alloc] init];
        // Now we can call the methods that were defined in the protocol
        // The implemented required methods:
        [simpleProtocolClass aRequiredMethod];
        [simpleProtocolClass anotherRequiredMethod];
        // The unimplemented optional method:
        //[simpleProtocolClass anOptionalMethod];
        // This call will give the runtime exception "-[SimpleProtocolClass anOptionalMethod]: unrecognized selector sent to instance ...".
        
        // Singletons experiments
        // -
        
        // Method resolution experiments
        // -
        
        // Strong vs. weak pointers experiments
        // Because of ARC, the program can now mange memory allocation and deallocation automatically. Depending on whether a reference is strong or weak, it will remain in memory.
        
        // Variance experiments
        // -
        
        // Exception experiments
        // This is a try-catch block in Objective-C
        @try {
            NSLog(@"Throw an exception");
            // We throw an exception for fun!
            @throw [[NSException alloc] initWithName:@"Some error" reason:@"We just wanted to test exception handling." userInfo:nil];
        }
        @catch (NSException *exception) {
            // And get down to the catch bracket...
            NSLog(@"An exception was caught: %@", exception);
        }
        @finally {
            // And then we can finish up...
            NSLog(@"Finish cleaning up afterwards.");
        }
        
        // Value boxing and unboxing experiments
        // All the primitive types and other types, e.g. class types can be boxed and unboxed in Objective-C.
        // Boxing:
        NSNumber *iNS = [NSNumber numberWithInt:i];
        NSObject *oNS = someClass;
        // Unboxing:
        int unboxedInt = [iNS intValue];
        AClass *unboxAClass = (AClass *)oNS;
        NSLog(@"The int was %d. The AClass object contained: %@", unboxedInt, unboxAClass);
        
        // Introspection experiments
        NSLog(@"The instance 'fieldHiddingClass' is %@a kind of 'AClass', is %@a member of 'AClass', is %@a member of 'FieldHidingClass'.", ([fieldHidingClass isKindOfClass:[AClass class]] ? @"" : @"not "), ([fieldHidingClass isMemberOfClass:[AClass class]] ? @"" : @"not "), ([fieldHidingClass isMemberOfClass:[FieldHidingClass class]] ? @"" : @"not "));
        
        // Enumeration experiments
        // In Objective-C the fast enumeration can be used this way:
        for (id someValue in anotherArray) {
            NSLog(@"The value %@ was in the array 'anotherArray'.", (NSString *)someValue);
        }
        
        // Property lists experiments
        // -
        
        // Blocks experiments
        // Blocks are very nice to have, this way you don't have to declare and implement a method in a place that is far from where the statements are being executed, this is shown below.
        int (^aBlock)(int) = ^(int aNumber) {
            NSLog(@"This is from the block.");
            return 11+aNumber;
        };
        NSLog(@"This is the result from the block was %d.", aBlock(1));
        
        NSLog(@"Experiments done.");
    }
    return 0;
}
