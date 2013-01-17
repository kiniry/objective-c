README FOR ASSIGNMENT 2.2
=========================

Below here are reflections and a comparison between the two object oriented programming laguages that i know: java and objective-c.
Most of the topics below has examples in the main file using instances of the other classes in the directory.

Foundation Framework
--------------------
Most of the familiar classes from Java (java.util) are also present in Objective-C (foundation.framework). Examples of the most used would be: Objects (NSObject), Strings (NSString), Arrays (NSArray/NSMutableArray), Numbers (NSNumber).

Example with NSArray & NSString in main

Aliasing
--------
The term aliasing refers to the situation where two or more pointers er pointing to the same memory location and therefore also same object.

Object allocation and initialisation
------------------------------------
In Objective C the object allocation and intialisation consists of two steps: First the class method (+ alloc) is called, and this allocates the required free memory to hold the object, and returns a pointer to this space, second the instance method (- init) is called which returns a pointer to the initialised object. These two methods are always used nested when creating an instance of an object.
In Java we just use the "new" keyword which does allocation and initalisation automatically.

Example in both Objective-C and Java in main

Class types
-----------
In Objective-C all objects are allocted on the heap, and therefore we need pointers to access them.

In Java we don't use pointers to the objects, Java keeps references to the objects in another way. The objects are still allocated on the heap though.

Constructors and factories
--------------------------
In Objective-C we use the init-methods as constructors for objects. The correct way to define the designated initializer would be the following:

	- (id) initWithStringParameter:(NSString *)stringParameter{
		self = [super init];
		if (self){
			_stringParameter = stringParameter;
		}
		return self;
	}
	
In Objective-C it is important that your object calls its super init method first and checks whether this init was successful. If nil is returned the childs init should return nil as well.

In java we would use the constructor when using the new keyword.

In Objective-C factories can be used for creating new instances of an object:
A class-method (+) is used to create a new instance of the class and setting its properties according to the parameter values that are passed in.
I have never seen this way of creating new instances of objects in Java. In Java I've always created an instance of a class by using a constructor for the class.

Copying and cloning of objects
------------------------------
In Objective-C when we set a pointer-variable equal to a another pointer-variable that points at an object, we will not copy the intire object to the new pointervariable. Instead the new pointervariable will contain a reference to the object. 

If we wish to copy the object instead, we could use the copy-method that a lot of the methods in the Foundation framework implements. For an object to be able to copy itself its class must implement the protocol NSCopying. We can't use the copy-method on just any object since it is not defined in the NSObject class. Trying til do so will result in an exception.

This is all tested and described in the main.

Dynamic typing
--------------

Dynamic typing of ID's
----------------------
In Objective-C you have the ability to use the "id" type for a variable that allows that variable to hold a pointer to any kind of Objective-C object, whitout knowing what kind of object it is. This approach is called dynamic typing. 
This can be used f.x. in sitations where you aren't interested in what type of object you're given since you don't have to modify it. Often you are using some method in method to check what kind of object you are passed before you do anything. This is usually done with the isKindOfClass-method.
I'm not familiar with any other OO programming languages that supports dynamic typing in a special type ofvariable. The same approach is not possible in Java.

The problem with dynamic typing using id's is that you lose information about the type of the object and you won't know what type of object you have during runtime. If you're not careful about this you might end up calling a method that doesn't exist for the object and that will result in a runtime error -> program will definately crash.

Expanded types
--------------

Field hiding
------------
In Objective-C the instance variables are hidden as default, and therefore we don't have access to them from the main class, and methods are public. In Objective-C we always want to access the the instance variables/fields of the objects using only accessor methods: setter and getter. These accessor methods will be synthesized automatically unless you define your own accessor methods. The accessor methods are the only methods that have direct access to the instance variables in the object. This is at least the common practice when programming in Objective-C. You can use dot notation to access properties via accessors. This notation "hides" the fact that you are actually using these methods. For example you could write:

	personInstance.Name = @"Peter";

In Java you don't have to use accessor methods to access the fields/instance variables by default if you declare your instance variables as public. You can change their values directly from the main class. If you declare them private you have to use accessors. The main difference is that in Java you have to declare the field either public or private. If you want to use your setter accessor in Java you could for example write:

	personInstance.setName("Peter");

Examples on field hiding in main class.

Immutability
------------
In Objective-C most of the most used classes such as NSString, NSArray, NSSet and so on have both an immutabel and a mutable version. The immutable version has a fixed size when allocated, and the content can't change. If you want to add or change an element you have to allocate a new object of the type and copy all the elements to the new location. The mutable arrays can append new objects or change its contents without allocating new memory, but are far more complex. The mutable versions inherit most of their methods from the inmutable versions and add some extra methods to take care of the mutability. But normally you want to use immutable objects where you can since these classes are often faster and safer (thread-safe) to perform operations on. You always have to wrap primitives in objects before inserting them into a collection method.

In Java you normally only use immutable strings and arrays. You have the option to use arrayLists though that is a kind of mutable array. The thing about arrayLists though is that you are not able to add primitive types to an arrayList. Here you would have to wrap the primitive in an object first. If you want to change the content of in immutable collection you have to allocate a new object first and then copy the old objects to this. In Java you could use for example the StringBuilder class to create mutable strings.

Inheritance
-----------
In Objective-C we can declare classes that inherit from other classes just like in other OO programming languages.
Objective-C only supports single inheritance, just like Java. 
When an object is inheriting from another object it inherits all of the parent class' methods and properties.

Logging methods
---------------
I haven't used that many logging methods yet so I don't really have a lot of knowledge on this topic. In Java I've always used the System.out.print for communicating strings to the console. You can do the same thing using NSLog in Objective-C.

An example is given in main.

Method overloading
------------------
Objective-C doesn't support method overloading. This means that unlike Java a class is not able to have two or more methods with the same name and different parameters. For example we can't have:

	(void)doSomethingWithInput:(NSString *)string;
	(void)doSomethingWithInput:(NSNumber *)number; //This will give an error

Different returntypes will result in an error as well:
	
	(NSString *)returnSomething;
	(NSNumber *)returnSomething;	//This will give an error
	
We are though able to do the following:
	 
	(void)doSomethingWithInput:(NSString *)string andOtherInput:(NSString *)otherString
 
An example is given in main using some material from the [irony] best singer in the world [/irony].

If we do things like this we are able to implements two or more methods with the same name since in Objective-C the method name corresponds to the argument names as well. We can only have one method with only one parameter though. Like shown above. We are not able to make two methods each with only one argument were these two arguments are different.

The reason we can still do some kind of overloading is that in Objective-C the two working methods from above will have different signatures: 
	
	doSomethingWithInput:
	doSomethingWithInput:andOtherInput:

Polymorphism
------------
In Objective-C it is just like in Java possible to declare two different methods with the same name for a super class and a sub class. For example the Person instance Hans gives a different version of the sayHello method than Peter who is an instance of a Boy. 
As a result the sayHello method for a Boy instance overwrites the sayHello method for a Person instance. This is polymorphism.

An example of this kind of polymorphism is to be found in the main

Arrays
------
The array types in Objective-C: NSArray & NSMutableArray are quite different from the Array objects in Java. The reason is that both NSArray & NSMutableArray are able to hold different types of objects at the same time. F.x. the same NSArray can hold both an NSNumber object and an NSString object at the same time.
This is not possible in Java, where you specify the object types when allocating the array.

What is nil?
------------
In Objective-C the term 'nil' refers to the object zero. It's much like the 'null' in Java.
The difference between Java and Objective-C when it comes to nil/null is that in Objective-C it is okay to send a message to nil, the program won't crash because of that, just nothing will happens.
In Java though you will get a NullPointerException that will stop the program.

Primitive types
---------------
In Objective-C the primitive types are the following: char, double, float, int, long, short, BOOL. All these types can be wrapped in a NSNumber object.
        
In Java the primitive types are the following: byte, short, int, long, float, double, boolean, char
        
So the primitive types in Objective-C and Java matches pretty well. Normally when passing primitives around in Objective-C, they are first wrapped inside a NSNumber object. This is because primitive types are inherited from C and primitive types are passed by value and not reference.

Protocols
---------
In Objective-C a protocol is a collection of methods and properties (these can be set either as required or optional). The optional methods are primarily for documentation. The key thing here is that a protocol doesn't have an implementation of them. If a class wishes to implement a protocol it must implement all the methods and properties that are required by the protocol. Protocols are nice if you want to make sure that you implement the same methods in different classes but with these methods beeing different for the different classes.

In Java we have interfaces instead of protocols. They are just like protocols in Objective-C except that you can't have any optional methods in Java.

Singletons
----------

Standard and dynamic method resolution
--------------------------------------

Strong vs weak pointers
-----------------------
In Objective-C there are two different kinds of pointers: Strong and Weak. These are featured in the modern version of Objective-C that features ARC (Automatic Reference Counting) to take care of memory management.

Declaring a pointer as 'Strong' means that the object should not be released from the heap until the the pointer is set to 'nil' or is manually released.
Declaring a pointer as 'Weak' means that the object is only kept in the heap as long as another object points strongly to it. When the object gets removed from the heap the weak pointer is set to 'nil' automatically (to prevent dangling pointers). 

As you don't use pointers to objects in Java, you don't have any pointers to objects to declare as weak or strong.

Variance
--------

Exceptions
----------

Value boxing and unboxing
-------------------------

Introspection
-------------
In Objective-C introspection is used to examine an object's type and also to find out whether an object will respond to a certain method call. This is often used in Objective-C since you have the ability to declare objects as the id type. Therefore you often need to examine an object with type id before calling any non-existing methods on it that could lead to a program crash.

In the main class are som examples of the use of two of the most used methods related to the topic introspection.

In Java you have reflection which is the same as introspection in Objective-C. 

Enumarations
------------

In Objective-C you can use fast enumarations for most of the collections like NSArray, NSSet and so on. You can use fast enumartion if the class implements the protocol NSFastEnumaration. A Fast Enumaration on  a collection object would look like:

	id item;
	for(id item in myCollectionOfObjects)
	{
		NSLog(@"This is an item: %@",item);
	}
	
In Java you are able to do the same thing by using a for each loop.  

Examples in main.

Property Lists
--------------

Blocks
------
