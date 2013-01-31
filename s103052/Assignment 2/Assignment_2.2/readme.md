Assignment 2.2 Reflections
==========================

The purpose with Assignment 2 Part 2 is to explorer the Objective-C language and its features. 
I have implementet a small set of classes to make experiments with the language and will compared it with Java.
OBS! Not all of the following reflections are implemented in the test classes, and not all reflection-questions are answered.


Foundation Framework
--------------------
Most of the classes in Objective-C framework "foundation.framework", are the same in Java's java.util package. Classes 
like Obejcts, Strings, Arrays are presented in  Objective-C as NSObject, NSStrings and NSArray / NSMuableArray.


Common Aliasing
---------------
Aliasing are avoided by making sure that situations where multiple pointers are pointing to the same memory location.


Alloc / Init Objects
--------------------
Normally in Java, we are just using the "new" keyword to create a new class. Java will then automatically make sure to
allocate and initailise it. In Objective-C, we have to make the allocation and initalisation our self by first call the methoh "alloc", which 
allocates the required memory for the object. Second, we are calling the instance method "init" which will initailise the object. 


Class Types
-----------
All kind of objects are always alloced on the heap, both in Objective-C and java, but in Objective-C, we needing
pointers to access them, compared to Java which just holds references to the objects and therefore accesses them in 
another way than Objective-C. References are fixed, where pointers can be manipulated with. 


Constructors & Factories
------------------------
Objective-C are using a init-method as contructor for a new object. This method has the following syntax:
	- (id) initWithParameter:(NSObject*)objectParameter
	{
		self = [super init];
		if (self)
		{
			_objectParameter = objectParameter;
		}
		return self;
	}

It's important that a object are calling it's super init as the first to check whether the init was successful, and if
not it will return a nil. Java are using contructors when it inits a new class.

Factories in Objective-C are a class-method, a (+) in front of the method instead of (-). This type of method can combine 
allocation and initialization in one step and return the object. 


Copying
-------
To copy a object in Objective-C we will have to use the copy-method in the NSObejcs's API however we can't use
this copy-method on just any object because it's not defind in the NSObejct class.  If a class is to support copy
we will have to implement the protocol NSCopying, otherwise we will get an exception.


Dynamic Typing of ID's
----------------------
Objective-C have the nice ability to use the dynamic "id" type for a variable which allows it to hold a pointer to any
kind of object. The "id" dynamic typing doesn't keep the information about what type of object you are using in runtime and therefore could
give some runtime errors. 

I'm not sure if Java are supporting dynamic typing as well. 


Field Hiding
------------
Instance variables are hidden as default in Objective-C and we don't have access to them from main classes. 
In Java it's possible to hide fields. If we want to access instance variables or fields from an object in Objective-C 
we will use properties. Properties are the only method where we have direct access to the instance variable. 
In Java we can just make the instance variable public. 


Inheritance
-----------
Objective-C and Java works almost the same with inheritance. Objective-C dont support muliple inheritance, but single like Java does.
When Inheritance between two objects, the subclasses inherit the fields and method of the superclass.


Logging
-------
In Objective-C we are using the "NSLog" to write to the console. In Java we are using "System.out.print".


Method Overloading
------------------
In Objective-C, Method Overloading is not support. Two methods of the same class can't have the same name.

	(void)methodWithParameter:(NSNumber*)numberForYou;
	(void)methodWithParameter:(NSString*)stringForYou; // Error!

In Java, you have the possibility to do method overloading.
We are though able to do the following, where we add a new parameter to the method.
	 
	(void)methodWithParameter:(NSString*)stringForYou and:(NSString*)stringForMe; // Works!
	
	
NSArrays
--------
NSArrays in Objective-C are quite different from the Array objects we know in Java. NSArray and NSMutableArray are
able to hold different types of objects at the same time compared to Java where you have to specify what kind of
object type you wanna allocate the array with. 

	
nil
---
The term "nil" refers to the object "zero". This means that the pointer/reference doesn't point to anything.
It's almost the same as Java's "null", the only difference is that we can send a message to nil in Objective-C, if
we do that in Java it will throw an exception. 


Primitive Types
---------------
Primitive types in Obejctive-C are the same as in C because of the fact that Objective-C is a subset of C. 
This includes the following: byte, char, short, float, double, int, long, bool. It's the same in Java.


Protocols
---------
Protocols in Objective-C is a collection of methods and properties (required or optional). If a class want to implement
a protocol, it must implement all the methods and properties that the protocol require. 
Protocols are almost the same as Java's interfaces except that you can't have optional methods in Java.


Strong vs Weak Pointers
-----------------------
Objective-C, the version that support ARC, have two different kinds of pointers, Strong and Weak. Pointers are always
Strong as default which means the object that it point to won't get deallocated. Weak pointers means that the pointer will be deallocated 
if no Strong pointer is pointing to it.

Java dont use pointers to obejcts.


Value Boxing and Unboxing
-------------------------
Value Boxing in Objective-C is done by using a factory class method like this:
	[NSNumber numberWithDouble:Value];
Unboxing in Objective-C is done by using a instance method on the object like this:
	[NSNumber Value];


Introspection
-------------
Introspection in Objective-C is used to check whether an object will respond to a certain method or examine an objects type.
Java have "reflection" which is the same as introspection. 


Blocks
------
Blocks in Objective-C is a segment of code that can be passed around methods as if it was a normal value. 
I'm not sure if Java have Blocks like Objective-C.