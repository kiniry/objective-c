//
//  main.m
//  assignment2-2
//
//  Created by Anders Emil Nielsen on 14/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "CelebrityModel.h"
#import "Klass.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        /*
            The following is a code experiment comparing Ruby with Objective-C
        */

        // --------------------------------------------------------------------------
        // # Classes from the Foundation Framework compared to the Ruby core
        // --------------------------------------------------------------------------

        /*
            The Foundation framework provides many wrappers for primitive types
            to perform operations. This is also seen in Java with Integer, String etc.
            Ruby doesn't have primitive and instead treats everything as an object
        */

        // ## Strings
        NSString *string = @"body";

        // ### Appending strings
        [string stringByAppendingString:@"appended"];
        // vs. Ruby:
        // string = "body"
        // string.concat "appended"
        
        // ### Converting to uppercase
        [string uppercaseString];
        // vs. Ruby:
        // string = "body"
        // string.upcase
        
        // ## Integers
        // ### Comparison
        NSNumber *num = @10;
        [num isGreaterThan:@5];
        // vs. Ruby:
        // num = 10
        // num > 5
        
        // --------------------------------------------------------------------------
        // # Init (and alloc) pattern
        // --------------------------------------------------------------------------
        
        /*
            In Objective-C an object is instantiated by the alloc/init pattern.
         
            Both the core classes of Objective-C (NSObject) and Ruby (Class) uses the
            alloc/init attern, but they have different best practises for this purpose.
        */
        
        // The initialization of an Objective-C object is as follow:
        // The first step is allocating the memory for the object using the class
        // method alloc. This returns an 'empty' instance of the given class.
        Model *modelAlloc = [Model alloc];
        NSLog(@"%@", modelAlloc);
        // vs Ruby
        // model_alloc = Model.allocate
        
        // The next step is the initialization. The standard initialization is done
        // with init
        Model *modelInst = [modelAlloc init];
        NSLog(@"%@", modelInst);
        // The Ruby initialisation method is private
        
        // One line initialization in Objective-C
        Model *oneLineInst = [[Model alloc] init];
        Model *altInst = [Model new]; // not really used anymore
        NSLog(@"%@", oneLineInst);
        NSLog(@"%@", altInst);
        // vs Ruby
        // model_inst = Model.new
        
        // Custom intialization method
        Model *expModelInst = [[Model alloc] initWithFoo:@"bar"];
        NSLog(@"%@", expModelInst);
        // vs Ruby
        // exp_model_inst = Model.new("bar")
        
        // --------------------------------------------------------------------------
        // # Factories
        // --------------------------------------------------------------------------
        /*
            In Objective-C factories are used in many of the core classes. This can e.g. be
            seen in the NSNumber class, which can represent many different primitive types
        */
        // Factory of a NSNumber from an int
        [NSNumber numberWithInt:2];
        
        // Factory of a string with specific format
        [NSString stringWithFormat:@"%s+%s", "foo", "bar"];
        
        // --------------------------------------------------------------------------
        // # Copying and cloning
        // --------------------------------------------------------------------------
        /*
            In many languages you copy by assigning a variable to the element, you want to copy.
            In Objective-C, where you operate with pointers, you will only point to the address
            of the other object.
        */
        // An example of how pointers works showing that pointing to another object doesn't copy it.
        NSMutableArray *foo = [@[[@"1" mutableCopy],[@"2" mutableCopy],[@"3" mutableCopy]] mutableCopy];
        NSMutableArray *bar = foo;

        NSLog(@"%lu = 3", foo.count);
        NSLog(@"%lu = 3", bar.count);
        [foo removeLastObject];
        NSLog(@"%lu = 2", foo.count);
        NSLog(@"%lu = 2", bar.count);
        // vs Ruby
        // array1 = [1,2,3]
        // array2 = array1
        // array2.pop
        // arary1 # = [1,2]
        
        // Now if make a copy of the object, it would make a shallow copy of the objects
        bar = [foo mutableCopy];
        [bar removeLastObject];
        NSLog(@"%lu = 2", foo.count);
        NSLog(@"%lu = 1", bar.count);
        
        // The following experiment shows why it's still only a shallow copy
        NSMutableString *numA = [bar objectAtIndex:0];
        [numA appendString:@"60"];
        
        NSLog(@"%@ = 160", [foo objectAtIndex:0]); // gets "60" appended
        NSLog(@"%@ = 160", [bar objectAtIndex:0]); // gets "60" appended
        
        // To make deep copies (copy of the value instead of the reference), you should
        // allocate new memorey, e.g. by using the factories for the core objects.
        NSMutableString *numB = [NSMutableString stringWithString:[bar objectAtIndex:0]];
        [numB appendString:@"70"];
        
        NSLog(@"%@ = 160", [bar objectAtIndex:0]); // hasn't changed
        
        // --------------------------------------------------------------------------
        // # Dynamic typing of ids
        // --------------------------------------------------------------------------
        
        /*
            Objective-C contains a dynamic type called id. This means that the compiler
            doesn't check the calls made on the id object until runtime.
        */
        
        // An example of an id
        id modelId = [[Klass alloc] init];
        if ([modelId isKindOfClass:[Model class]]) {
            // compiler allows this operation that would fail at runtime because
            // a Klass object doesn't have the method doSomething
            [modelId doSomething];
        }
        NSLog(@"%@", [modelId class]);
        
        // --------------------------------------------------------------------------
        // # Hiding fields
        // --------------------------------------------------------------------------
        
        /*
            In Objective-C it is possible to hide variables using the @property.
            With a @property instead of an instance variable, the compiler will
            automatically create getters and setters for the given variable (before
            xCode 4.4, one need explicitly use @synthesize in the implemenation for
            this feature).
        */

        // In the Model class the property foo has both setters and getters, which
        // can be accessed by methods (also with the dot-notation)
        Model *mWithFields = [[Model alloc] initWithFoo:@"bar"];
        NSLog(@"%@", mWithFields.foo);   // getter with dot-notation
        NSLog(@"%@", [mWithFields foo]); // standard getter
        // vs Ruby
        // m_with_fields = Model.new("bar")
        // m.foo
        
        mWithFields.foo = @"stillBar";
        NSLog(@"%@", mWithFields.foo);
        
        [mWithFields setFoo:@"barSet"];
        NSLog(@"%@", [mWithFields foo]);
        // vs Ruby
        // m_with_fields.foo = "stillBar"
        
        // --------------------------------------------------------------------------
        // # Immutability
        // --------------------------------------------------------------------------
        
        /*
            Most of the Foundation objects are immutable, but some of them, such as
            NSMutableString and NSMutableArray also have a mutable version.
        */
        // With NSMutableString it is possible to change the state/value of a string
        // without allocating new memory
        NSMutableString *mutable = [@"string" mutableCopy];
        [mutable appendString:@"hey"];
        
        return 0;
    }
}

