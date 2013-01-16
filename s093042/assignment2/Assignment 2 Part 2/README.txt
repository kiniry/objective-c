//
//  README.txt
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

Experiments are found in the folder Assignment 2 Part 2, in this directory...

All experiments are invoked in the main.m file...

The following are elaborations on the comments found in the source code and some comparisons to other languages, mostly C# and Java. The experiments in the source code are named like each section in this document, with the word "experiments" appended.

// Foundation framework
The experiments showed some uses of the NSString class and the NSArray class, the operations done using the objects showed some of the capabilities of the classes and showed how the Foundation framework makes it easier for the developer to use commonly used operations on common objects easier by providing them in a framework.

The Foundation framework is much like the classes and methods found in the C# namespace System, and Java's java.lang.* and java.util.*.
The main class that all other objects inherent from is the NSObject class, much like the Object class from java.lang in Java, and the Object class from System in C#. This class is the base class that all other classes is built on.

// Aliasing
-

// Object instantiation
The experiments showed how in Objective-C one has to allocate memory and then initialize an object before it can be used. An object can have multiple initializers, best practice is to make initializer build upon one initializer that will call the initializer from the super and setup the most basic properties etc., this initializer is called the designated initializer.
The 'description' method was also first shown in this experiment, this method is basically the 'toString' method known from Java and C#. The method is called when the caller whats to get a string representation of the object.

Allocation of memory and initialization is a little different from, what is known from languages like C# and Java, where constructors are mostly used, for the initialization of objects and the system will usually take care of allocating memory for the object, when using the 'new' keyword.
Constructors in Java and C# does not need to call the constructor of the super class, but it is necessary in Objective-C because we need to get the object at set it to 'self' (which 'this', known from Java and C#). The multiple initializers translates well to the concept of multiple constructors, however because initializers can have different names and does not depend on the method signature, one can have many different initializers e.g. with no parameters, where this is not possible in Java or C#.

// Class types
Like primitive types have their types put in front of a declaration, objects also use their class names as their type, this is the same as in C# and Java.
In Objective-C class types are reference types and primitive types are value types, this is just like in C# and Java. A value type is a type which contains its value, whereas a reference type, uses references to the object, this e.g. means that an object can have multiple references and, changing something using one reference will change the object for all references. In Objective-C it is made very clear when a type is a reference type because of the '*' (pointer) after the type name (or when using the 'id' type, which is also a reference type).

// Factories
The experiments showed some best practices for factory class methods. Factories are used to allocate memory and initialize an object, before returning it to the caller, who can then use it immediately afterwards.

The way factories are used and realized in Objective-C is pretty much the same as in Java and C#. When using factories we do not want the caller to bother about how to initialize an object, maybe because there are a lot of options for the initializers. So what a factory does is to make "helper" methods that creates (allocates the memory) and initializes the objects for the caller, so the caller only has to know how to use the object and not how to initialize it (maybe we do not even want consumers of the object to be able to initialize it themselves). In Java and C#, we create a new object, invoke the constructor, maybe we set some additional properties, and we return the newly created object to the caller. In Objective-C we allocate memory for a new object and calls the initializer, and maybe we set some additional properties and returns the newly created object to the caller.
It is important to remember that the factory does not "own" the object, i.e. it is the callers responsibility to release the memory, when the object is not used any more.

// Copy and cloning of objects
In Objective-C the NSObject uses the NSCopying protocol, to provide the methods that a subclass will have to implement to be able to use the 'copy' method. The NSObject does not implement this method, when calling the 'copy' method on a subclass of NSObject, the method calls the 'copyWithZone' method that the subclass must implement.
In Java copying an object using 'clone' will just give an address copy, i.e. a new reference to the same memory location. If "deep" copying is needed, one has to implement this themselves, just like in Objective-C.

// Dynamic typing for pointers
-

// Dynamic typing for 'id's
The experiments showed that the type information was lost when using 'id', one could still call the getter of a property using '[]' (bracket calls), but dot-syntax was unavailable until the reference was casted back to the original type.

'id' is comparable to 'var' in C#, they are usually used for the same purposes, e.g. to allow implicit typing for collections of data. But they can also hold any type of data (reference type data).
In C# the compiler will determine and assign the most appropriate type later, this is also why 'var' cannot be used for fields in classes. In Objective-C 'id' will stay as a reference to memory.

// Expanded types
-

// Field hiding
The experiments showed how field hiding is done in Objective-C.

// Immutability
The experiments showed two types of the same concept one was immutable and the other was mutable.
One best practice is to hold mutable objects in one's data structure and give immutable objects to callers, who wants to inspect the data.
C# does not have any immutable types, instead the keyword 'readonly' can be used to make types "act" like immutable types.

// Inheritance
The experiments used inheritance, and showed how this is done in Objective-C.
Type inheritance works by allowing super classes to hold subclasses (e.g. used for object boxing).

// Logging
The experiments showed how 'NSLog' was used, to format strings that was written to the output in the "Debug area" view. The formatting of string could be used to implicitly invoking the 'description' method of an object.
In C# the 'System.Diagnostics.Debug' and 'System.Diagnostics.Trace' classes provides multiple options to provide feedback to the developer/debugger. There are also ways to interact directly with the Windows event log using the 'System.Diagnostics.EventLog' class.
In Java the 'java.util.logging.Logger' class can be used.

// Method overloading
Method overloading is not permitted in Objective-C, it is allowed in Java and C#.
Method overloading is declaring a method with the same name but with different method signatures (e.g. different input parameter types), since method signatures are not used the same way in Objective-C, where "selectors" are used instead, makes it impossible to make sure to match the type, like it is done in Java and C#.
Having method overloading makes it possible to call the same methods, with different kinds of data types, without "bothering" to lookup a specific method for a specific data type.

// Polymorphism
-

// NSArray and monomorphic arrays
In the experiments it was shown how a 'NSArray' can have different types of data contained in the array. This is usually not allowed in languages like C# and Java, unless one puts all the data in a container (value boxing).

// Nil
'nil' in Objective-C is very comparable to the construct 'null' in Java and C#.
But there is a subtle difference as shown in the experiments, one can call and invoke methods on an object that is 'nil', without the program crashing, without compile-time or run-time error and without raising a 'NullReferenceException' or a 'NullPointerException' like C# or Java would do, respectively.

// Primitive types
As it is stated in the experiments, the primitive types of Objective-C is mostly the same found in C, these include: '_Bool', 'char', 'short', 'int', 'long', 'long long', 'float', 'double' and 'long double', most of these types can be unsigned or signed as well. In addition to the types from C, Objective-C has introduced another primitive type: 'BOOL', which uses YES and NO as its literals.

Other languages have pretty much the same list of primitive types. C# has the following "simple types": 'sbyte', 'byte', 'short', 'ushort', 'int', 'uint', 'long', 'ulong', 'char', 'float', 'double', 'bool' and 'decimal'.

// Protocols
As seen in the experiments protocols offers the ability to make "data contracts", and make sure that a subclass implementing a protocol has the required methods and properties, and can have optional methods and properties. The 'NSCopying' referred to earlier is a protocol, that requires subclass that implement it, to have a 'copyWithZone' method implemented (as seen in the NSObject.h file).
Protocols are also used for delegation. Also as seen in the experiments, when using protocols the type can be 'id' and we still have all the type information, because of the protocol.
A comparable structure in C# and Java is 'interface'. Which can be used the same way as protocols in Objective-C.

// Singletons
-

// Method resolution
-

// Strong vs. weak pointers
As it is described in the experiments, because of ARC, we have to know whether a pointer/reference is strong or weak. When using a strong pointer we declare that we are "owning" the object, and when we discard the object it should be released from the memory. When we use weak pointers, we are not "owning" the object and as long as there is a reference to the object, it should be kept in the memory.
In C# when all references to an object is out of scope, the CLR will mark the object for the garbage collector, which will release object from the memory, at some time afterwards.

// Variance
-

// Exception
The experiments show how to handle exceptions using a try-catch-finally "block", and how to throw a new exception.
This type of try-catch-finally is comparable to the ones used in Java and C# (only using a slightly different syntax).
According to Apple exceptions are however not recommended to use in a regular program flow, like it is in languages as C# and Java. And should only be used for actual exceptional cases.

// Value boxing and unboxing
As seen in the experiments boxing and unboxing of values of both primitive types and class types, are done just like it is done in C# and Java.
A value can be put into a container object (called value boxing), and be cast back to the original object (called value unboxing).
For class types, the container must be a superclass.

// Introspection
How introspection is done in Objective-C can be seen in the experiments.
The methods that are invoked for introspection are: 'isKindOfClass' and 'isMemberOfClass' for classes (and for 'id' referenced objects) and 'respondsToSelector' for checking whether a selector can be used on an object (the selector could be stored using a 'SEL' type).
In Java the 'instanceof' operator is comparable to the 'isKindOfClass' method.

// Enumerations
How fast enumeration is used in Objective-C can be seen in the experiments.
Fast enumeration is comparable to foreach in C#:
[C# code]
foreach(var someValue in someArray)
    // Do something with someValue
[/C# code]
In Java it can be done using:
[Java code]
for(Object someValue : someArray)
    // Do something with someValue
[/Java code]

// Property lists
-

// Blocks
The experiments show how one can use Blocks.
Blocks are comparable to anonymous classes in Java, and lambda expressions in C#.
Blocks are usually used, for declaring a function to be passed as an argument to a method call, this way the "block" of statements that one, wants to execute are declared in the same place as the invoked method, and not in some other class.

