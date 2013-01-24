Peer-review on assignment 2 part 2
=======
### To Carsten Nilsson (s093751) from Sivanujann Selliah (s093042)

The code for the experiments (or just code fragments) would have been nice to have, just to see how each concept is implemented in Objective-C.

Regarding the section about...

#### The Foundation Framework
Everything in Objective-C is *not* instantiated as instances of the core Foundation framework classes, most of the Foundation framework and most classes one makes oneself inherent from the Foundation framework classes (but does not have to); there is much more than objects and the Foundation framework in Objective-C, since it is a superset of C.
#### Aliasing
Consider the following:

        NSMutableString *t = [NSMutableString stringWithString:@"Test"];
        NSMutableString *s = t;
        [t appendString:@"ing"];
Here the two pointers `t` and `s` are pointing to the string containing "Testing", this code does not crash in Objective-C and this type of aliasing is also possible in C# and Java.
#### Class types
This section talks about interface and implementation files, does this belong here?
#### Factories
Factories in C# and Java are used just like they are used in Objective-C, i.e. not *typically* for conversion, but as you say to make a new object that a caller can use immediately afterwards.
#### Copying and cloning
The required method that needs to be implemented when conforming to the `NSCopying` protocol is the `copyWithZone` method; the `copy` method is a convenience method that is defined in `NSObject` and invokes the `copyWithZone` method.
#### Dynamic typing of ids
`id` is an Objective-C keyword, it is not something that is inherited from C.
#### Immutability
`NSArray` does not *only* keep data of type `NSObject`, but keeps any object reference (using `id`).
#### Polymorphism
I think you have misunderstood the concept of polymorphism, it is *not* a contract... You are right that there is no string concatenation operator natively in Objective-C, which is an example of one of the forms of polymorphism, which is overloading of operators, which you have said already in the previous section of "Method overloading" is not supported, but there are many other forms of polymorphism e.g. the feature of having methods that have the same "signatures"/names in different classes, this is one supported form of polymorphism in Objective-C.
#### NSArray
`NSArray` does not only contain `NSObject` data but any reference to any type of data using `id`.
#### nil
An object does not need to be allocated, even unallocated objects are `nil`, this is done because it is dangerous to have pointers to old memory.
#### Primitive types
The primitive types in Objective-C are not inherited from `NSNumber`, they are inherited from C, `NSNumber` wraps the primitive types into `NSObject`s. Are you sure all the primitive types come in both signed and unsigned variants (what about BOOL and char)? BOOL can also use C's `true` and `false`, but you are right: `YES` and `NO` is mostly used.
#### Strong vs. weak pointers
Strong and weak "modifiers" can also be defined on other variables (not only on properties). In addition to what you are saying, references are also released from memory when they are no longer in scope. Garbage collection is actually a little different from ARC; ARC releases the memory right when the object is not needed anymore, in garbage collection an object is marked to be collected by the garbage collector, which will happen at some arbitrary point in the future.
#### Exceptions
Are you sure your Java and C# programs throw exceptions all the time? ;)
#### Enumerations
Are you sure that fast enumeration is not faster than iteration in a `for`-loop?
#### Blocks
Blocks do not have to be "anonymous", i.e. they can also have names, consider:

        void (^blockName)(void) = ^{
          NSLog(@"This is a test");
        };
        blockName();
Then they can also be called like any other function.
### Overall assessment
Your reflections on Objective-C are okay. The above comments would only perfect them. :)
