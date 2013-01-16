README FOR ASSIGNMENT 2.2
=========================

BELOW HERE ARE REFLECTIONS AND A COMPARISON BETWEEN THE TWO OBJECT ORIENTED PROGRAMMING LAGUAGES THAT I KNOW: JAVA AND OBJECTIVE-C.
MOST OF THE TOPICS BELOW HAS EXAMPLES IN THE MAIN FILE USING INSTANCES OF THE OTHER CLASSES IN THE DIRECTORY.

Foundation Framework
--------------------
Most of the familiar classes from Java (java.util) are also present in Objective-C (foundation.framework). Examples of the most used would be: Objects (NSObject), Strings (NSString), Arrays (NSArray/NSMutableArray), Numbers (NSNumber).

Example with NSArray & NSString in main

Aliasing
--------


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
	
In java we would use the constructor when using the new keyword.

In Objective-C factories can be used for creating new instances of an object:
A class-method (+) is used to create a new instance of the class and setting its properties according to the parameter values that are passed in.
I have never seen this way of creating new instances of objects in Java. In Java I've always created an instance of a class by using a constructor for the class.

Copying and cloning of objects
------------------------------
In Objective-C when we set a pointer-variable equal to a another pointer-variable that points at an object, we will not copy the intire object to the new pointervariable. Instead the new pointervariable will contain a reference to the object. If we wish to instead copy the object to the new pointer-variable we could define the property for the instance of the object to @property(copy)...

Dynamic typing
--------------

Dynamic typing of ID's
----------------------
In Objective-C you have the ability to use the "id" type for a variable that allows that variable to hold a pointer to any kind of Objective-C object, whitout knowing what kind of object it is. This approach is called dynamic typing. 
This can be used f.x. in sitations where you aren't interested in what type of object you're given since you don't have to modify it.
I'm not familiar with any other OO programming languages that supports dynamic typing in a special type ofvariable. The same approach is not possible in Java.

The problem with dynamic typing using id's is that you lose information about the type of the object and you won't know what type of object you have during runtime. If you're not careful about this you might end up calling a method that doesn't exist for the object and that will result in a runtime error -> program will definately crash.

Expanded types
--------------

Field hiding
------------

Immutability
------------

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
Objective-C doesn't support method overloading. This means that unlike Java a class is not able to have two or more methods with the same name and different parameters. 
We are though able to 

An example is given in main using some material from the [irony] best singer in the world [/irony].

If we do things like this we are able to implements two or more methods with the same name since in Objective-C the method name corresponds to the argument names as well. We can only have one method with only one parameter though.
We are not able to make two methods each with only one argument were these two arguments are different.

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

Variance
--------

Exceptions
----------

Value boxing and unboxing
-------------------------

Introspection
-------------

Enumarations
------------

Property Lists
--------------

Blocks
------
