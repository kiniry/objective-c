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

Allocation of memory and initialization is a little different from, what is known from languages like C# and Java, where constructors are mostly used, for the initialization of objects and the system will usually take care of allocating memory for the object.
Constructors in Java and C# does not need to call the constructor of the super class, but it is necessary in Objective-C because we need to get the object at set it to 'self' (which 'this', known from Java and C#). The multiple initializers translates well to the concept of multiple constructors, however because initializers can have different names and does not depend on the method signature, one can have many different initializers e.g. with no parameters, where this is not possible in Java or C#.

// Class types
