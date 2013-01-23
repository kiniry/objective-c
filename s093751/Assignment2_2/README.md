Assignment 2 - Part 2 -- Carsten Nilsson - s093751
==================================================

INTRODUCTION
------------

As part of the second half of the assignment, we were asked to reflect upon a number of different concepts of programming in OO-languages. 
It should be noted that my background knowledge with OO-programming consists primarily of Javaa and C#. Therefore these will be the languages I will use for comparison.
The reflections has been evaluated from my own research and experiments.

REFLECTIONS
===========

The Foundation Framework
------------------------
- ... the Foundation framework with the core classes of the
   language(s) that you are familiar with? (abbreviated henceforth as
   OTLTYAFW) (Hint: Compare the classes in Foundation, and in
   particular their fundamental design idioms, with classes in
   java.lang/java.util and .Net's System namespace.)

Some of the Core Foundation framework are `NSString, NSArray, NSMutableArray, NSNumber, NSObject, NSDictionary` etc.

In Objective-C everything is instantiated as a instance of these core classes and most of them are not mutable, hence a mutable version has been made for some e.g. `NSMutableString` and `NSMutableArray`.

In C# most of these frameworks' capabilities can be found in the library `System` and in Java they are found in `java.lang` or `java.util`. 

However, they do all have one thing in common and that is that almost all of their core classes and types inherits from a "Master" object class, name the `Object` or `NSObject` classes.

Aliasing
----------
- ... how common aliasing is and how it is avoided compared to the
   OTLTYAFW.  (Hint: The keyword here is "ownership".)

Aliasing is when two or more pointers (e.g. references in C# and Java) refer to the same location or object.

The design of Objective-C has been made in such a way that the programmer often has to make sure to refer to the correct pointers/objects, otherwise the code will crash. In Java and C# these sort of references are usually not a problem, since pointers and such is not used as much.

Alloc/init
----------
- ... the alloc/init pattern of object instantiation with how objects
   are constructed in the OTLTYAFW.  (Hint: What are best practices
   for constructors in the language of your choice.)

The alloc/init pattern is very similar to constructor pattern of C# and Java. Both of these patterns is used to allocate memory and instantiate the object with most of the basic properties.

In C# and Java is is done with the keyword `new` and the properties set afterwards. Example:

		One objOne = new One(3);

Here, an object of type `One` is created and a property has been set to 3.

The allocation of memory itself is done manually in Objective-C when the `alloc` method is used. It is done automatically in C# and Java when the `new` is used for constructing objects.

The new `description` method that is used to give a string representation of the object is also found in C# and Java, where it is called `toString`, which will also return a string with all its properties.

Class types
------------
- ... how class types are used with those in the OTLTYAFW.

The **.h** header file can consists of the class types `@interface` and `@protocol`, where `@protocol` is more or less similar to the `interface` of C# and Java. The interface is used to make properties and methods *public*, whereas if they are not in the header file, then they are regarded as *private*.
Then there is the implementation files called **.m** in Objective-C and they are required to implement an header file. This has it its ups and downs. It makes the code easier to understand, but it also requires even things to keep track of when coding, which can become quite tedious.
In C# and Java it is only required to followed the structure of a given interface or protocol if they *extend/implement* them.

Factories
--------------------------
- ... how constructors and factories are realized as compared to the
   OTLTYAFW.  (Hint: Compare best practices in factories.)

 A factory is used to allocate memory and initialize an object, so that the invoker/caller can use it immediately. 
 
 A factory in Objective-C uses to *class methods*, since it not instantiated to invoke *instance methods*. This is very similar to C# and Java, where a class can be called only using its **static** methods. This approach makes it somewhat easier to use an object, because the invoker/caller does not need to instantiate the object properly.
 
 A typical usage of these factories is for conversion in C# and Java:
 C#: `bool.tryParse()` and Java: `System.Convert.ToBoolean()`.	

Copying and cloning
-------------------
- ... how copying and cloning of objects works (see NSObject's API)
   as compared to the OTLTYAFW.  (Hint: Deep vs. shallow copies,
   twinning, cloning, mutability of iterations, etc.)

In Objective-C the `NSObject` uses the `NSCopying` protocol that requires the object to implement a `copy` method. Many of the Core Foundation Frameworks has some of these methods already implemented e.g. `NSString` has the method `mutableCopy` that return a `NSMutableString`. 
To be able to clone/copy any other given object, it was required to implement these, just like in C# and Java. In C# and Java it is possible to `clone` an object, but it only clones the references and not the object itself i.e. memory allocation and instantiation of variables. If this is not done properly it could create cases of aliased objects.
   
Dynamic typing
--------------
- ... how dynamic typing of pointers compare with the OTLTYAFW.
   (Hint: When/how is type information lost?)


   
Dynamic typing of ids
-----------------------  
- ... how dynamic typing of ids compare with the OTLTYAFW.  Is there a comparable construct in your other language(s)?  (Hint: When/how is type information lost?)
   
`id` is a pointer to a basic struct of the Objective-C language, that is inherited from C. The compiler will not give warning, since it is a weakly typred variable and it assumes the programmer knows what he or she is doing. This seem very scary! So it is often recommended to use a strong type whenever possible. 

An example of usage is `NSArray` that only contains objects of type `id`. This means that when an object is inserted into the array, it loses its type.

However, it does provide some dynamic in the language. It works almost like the `var` keyword in C# and it can also be used as a *return-type*, just like `Object` can be used in C#.
   
Expanded types
------------------
- ... how expanded types are declared and used with the OTLTYAFW.(Hint: Can you alias expanded types? Can user-defined types be expanded?)
 
No answer yet.

Field hiding
------------
- ... how does field hiding work as compared with the OTLTYAFW.(Hint: Does hiding/shadowing work, is it a good practice, do the types matter?)
 
In Objective-C all the public properties are specified in the header file and everything else is private. This means that everything inside the implementation, that is not in the header, is hidden. Its possible to add a "settings" to the properties e.g. `readonly` will make the property readable, but not writable by the invoker/caller. In C# this can be done with: 
	
	int assets { get; private set; }
	
Which essentially is a read-only setting.

Immutability
-------------
- ... how is immutability used and why as compared with the OTLTYAFW.  (Hint: What are the immutable base types in your other languages(s)?  Are they *really* immutable?  What good are immutable data types?)

Mutability is when an objet can be edited and modified, just like normal, and immutability is the quite opposite, meaning that it cannot be modified and is rather *static* (locked).

An example of this is `NSArray` that contains data of the type `NSObject`, that cannot be modified, once it has been pushed into the array. However, if the object `NSMutableArray` is used instead, then it is possible to modify the objects while they are in the array.

Inheritance
-----------
- ... how inheritance works as compared to the OTLTYAFW. (Hint: Consider single vs. multiple inheritance and behavioral vs. code inheritance.  How does class inheritance work and how does type inheritance work?)

Inheritance is delared in the header file instead of the class file in C# and Java. Multiple inheritance is not supported, nor is it supported in C#. So instead single inheritance is used to implement objects from some super class. 

Logging
-------
- ... the built-in methods for logging as compared to the OTLTYAFW.(Hint: There is more to the world than printf in logging and debugging.)

One of the Core Foundation Frameworks is the ``NSLog` that can be used to write out messages into the console, that could be used for debugging. Very much similar to the `System.out.println` from Java and `Console.Write` from C#. 
However, there are also other ways of logging. In C# it is also possible to use the library `log4net` that offers messages to be stored in a configurable and safe way. 
Objective-C also has this capablity in some of its other frameworks e.g Apple has a framework called *Apple System Logger* (ASL), that is somewhat similar to `log4net`.
   
Method overloading
------------------
- ... how method overloading works (or doesn't) as compared to the OTLTYAFW.  (Hint: Is overloading permitted? Is it a best practice? What are the pros and cons?)

Overloading in Objective-C is not permitted. The compiler will return an error that look like

	Duplicate declaration of method: methodName
	
The method name consists of the names of each parameter, called the signatures. If the programmer wishes to create something overload alike methods, then he or she muist change the signature names instead.

In other OO-languages such as C# and Java is it quite easily to create overloads for methods, you just simply create a method with the same name and change the parameters in any way you wish. For instance there could be the methods

	methodName(int number);
	methodName(int number, string name);
	methodName(int number, string name, bool check);

Polymorphism
------------
- ... how polymorphism works (or doesn't) as compared to the OTLTYAFW. (Hint: Note that I did not say what *kind* of polymorphism.)

Polymorphism is a special expression of a *contract* that allows certain data types to take advantage of e.g. in C# two strings can be concatenated by using the **+** addition symbol i.e. it combines two different string objects into one.

It is not supported in Objective-C.
 
NSArray
-----------
- ... how NSArray compared with (typically monomorphic) arrays in the OTLTYAFW.  (Hint: Look up monomorphic and consider the typical anti-patterns for array use.)

The `NSArray` allowes all data types that inherits from `NSObject`, meaning almost all data types in Objective-C. As opposed to C# and Java that only allows an array with the same type of content e.g. `List<string> list = new List<string>();` only allows `string` objects as its contents.

The `NSArray` is also immutable just like in Java, meaning once the objects has been pushed into the array, they cannot be modified or changed.

nil
----------
- ... how does nil work as compared to the semi-equivalent construct in the OTLTYAFW. (Hint: What are the programming errors relating to such?  Can one call methods on/send messages to nil/null/0?)

`nil` is very similar to `null` in C# and Java. Whenever an object is allocated it is set to `nil` until it has been initialized, very much similar to the other OO-languages. However, one peculiar difference is that Objective-C's compiler will not crash the program if an object is set to `nil` , it will simple just ignore it. As opposed to C# and Java that will crash and return an `NullPointerException`.

Primitive types
---------------
- ... how do the primitive types look in Objective-C as compared to the OTLTYAFW.  (Hint: Consider those types that are fundamental and part of the language definition and those that are actually deemed   "primitive".)

The primitive types in Objective-C is inherited from `NSNumber`, which are the following: `BOOL, char, double, float, int, long, short`. Of which all of them come in unsigned and signed varieties (by adding a 'u' infront e.g. `uint`). The `BOOL` type is a tad different from C# and Java, that has the values `true` and `false`, because this struct uses `YES` and `NO` instead. 

Some might think that the `string` object of C# and Java is a primitive type, but it is actually an object (array of chars), which is the same case with `NSString`.

Protocols
-----------
- ... how do protocols work and how do they compare with the semi-equivalent construct in the OTLTYAFW.  (Hint: Consider classes that implement multiple protocols and how protocols and class & type inheritance work.)

A `protocol` is very similar to an `interface` of OO-languages -- it basically states what fields and methods should be created, whereas an `@interface` in Objective-C serves the purpose of defining what methods should be *public*.
A protocol can also be used when other objects wants to communicate with an object, because they follow the same *"orders"*, so it is very much similar to the `interface` from C# and Java.

Singletons
------------
- ... how are singletons defined and used as compared with the OTLTYAFW.  (Hint: Do the patterns for defining and using singletons maps to/from your other language(s)?)

Not answer yet.

Method resolution
-----------------
- ... how does (static and dynamic) method resolution work as compared to the OTLTYAFW.  (Hint: In Java and C# the compiler knows exactly which method will be called, just not which *version* of that method will be called at runtime.)

No answer yet.

Strong vs. weak pointers
------------------------
- ... how do strong vs. weak pointers work as compared with semi-equivalent construct in the OTLTYAFW. (Hint: Look into java.lang.ref and .Net's System.WeakReference if you have never done so before.)

The `strong` and `weak` pointers are declared in the `@property` to help the Automatic Reference Counting (ARC), that keep track of what objects to retain and/or release.

If an object has been assigned to `strong`, when it will never be released automatically, but must instead be set to `nil` in code, whenever it should be released.
A `weak` assignment of the pointer mean that as long as the object is not in use by anything, then the ARC can release the object to save memory i.e. it gets set to `nil` automatically.

In C# and Java this is called garbage collection and is done automatically. This will clean (set to `null`) all up all objects that is out of scope.

Variance
----------
- ... how does variance work as compared with the OTLTYAFW. (Hint: If you have never heard of method covariance, contravariance, and invariance, you have some fun reading to do.  E.g., Consider how return types in method definitions can change wrt inheritance.)

No answer yet.

Exceptions
------------
- ... how do exceptions work as compared with the OTLTYAFW.  (Hint: What do method declarations look like with regards to exceptional behavior?)

Since `nil` does not return any exceptions in Objective-C, they have been decided to not be used as much as in C# and Java, which throws an exception all the time.

An exception can be thrown with the Foundation `NSException` Framework, which looks like:

`@try {

    NSException *e = [NSException
        exceptionWithName:@"FileNotFoundException"
		
        reason:@"File Not Found on System"
		
        userInfo:nil];
    @throw e;
}
@catch(NSException *e) {
    @throw; // rethrows e implicitly
}`

And similar to C# and Java, a try-n-catch will be used.

Value boxing
-------------
- ... how does value boxing and unboxing work as compared to the OTLTYAFW.  (Hint: Note that I did not just say *primitive* value boxing.)



Introspection
--------------
- ... how introspection in Objective-C compares to built-in support for dynamic type checking (e.g., Java's instanceof keyword) and reflection in the OTLTYAFW.  (Consider the types id and SEL as compared to java.lang.reflect and .Net's reflective types in the System namespace.)


Enumerations
--------------
- ... how do enumerations work as compared with the OTLTYAFW.  (Hint: Compare Objective-C's fast enumerations with those of the language(s) you know.  How do immutability and exceptions work with    regards to enumerations?)



Property lists
---------------
- ... how do Properly Lists look as compared to the semi-equivalent construct in the OTLTYAFW.  (Hint: Think about Java's java.util.ResourceBundle and java.util.Properties and the similar classes in .Net. Also think about JSON, if you know it.)



Blocks
--------
- ... how do Blocks compare with the semi-equivalent construct in the OTLTYAFW.  (Hint: Think about Java's anonymous   classes and C#'s lambdas.)

