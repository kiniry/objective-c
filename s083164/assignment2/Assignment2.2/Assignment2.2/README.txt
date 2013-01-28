Assignment 2.2



Foundation framework
The Foundation framework provides several useful classes. Among these are the
NSObject, NSArray etc. As the name implies it forms the foundation of the
Objective-C language used for development on the Macintosh platform.

The Foundation framework is similar to Java's java.lang and java.util packages
and provides alot of the same functionality. They are both fundamental to the
programming languages.

Aliasing
One pointer is aliasing another when they point to the same memory location.

alloc/init
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

Object This both allocates
memory 

Class types

Constructors and factories

Copying and cloning

Dynamic typing og pointers

Expanded types

Field hiding

Imutability

Inheritance

Logging

Method overloading

Polymorphism

NSArray

Nil

Primitive types

Protocols

Singletons

Method resolution

Strong vs. Weak pointers

Variance

Exceptions

Value Boxing/Unboxing

Introspection

Enumerations

Property Lists

Blocks
