Experiments are found in the folder Assignment 2 Part 2, in this directory...

All experiments are invoked in the main.m file...

The following are elaborations on the comments found in the source code and some comparisons to other languages, mostly C# and Java.

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


