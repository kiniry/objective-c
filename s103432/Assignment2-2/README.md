# David Harboe s103432 Assignment2-2  

I use Java to compare with Objective-C (Objc). 

>... the Foundation framework with the core classes of the
   language(s) that you are familiar with? (abbreviated henceforth as
   OTLTYAFW) (Hint: Compare the classes in Foundation, and in
   particular their fundamental design idioms, with classes in
   `java.lang/java.util` and .Net's System namespace.)
   
When declaring a string, a number and printing these are the difference: First Objc then Java

	NSString *aString = @"Hejsa";
	String aString = "Hejsa";

	NSNumber *tenPointTwo = @10.2F;
	double tenPointTwo = 3.6;

	NSLog(@"%@ how are you?", str);
	System.out.print(aString + " how are you");

>... the alloc/init pattern of object instantiation with how objects
   are constructed in the OTLTYAFW.  (Hint: What are best practices
   for constructors in the language of your choice.)

In Java instead of using `new`, `alloc` which allocate memory and `init` which initialises the instance is used in Objc 

	Calculator *calculator = [[Calculator alloc] init];
	Calculator calculator = new Calculator();

>... how copying and cloning of objects works (see NSObject's API)
   as compared to the OTLTYAFW.  (Hint: Deep vs. shallow copies,
   twinning, cloning, mutability of iterations, etc.)
   
Coping two strings in both Objc and Java
   
	NSString *firstString = @"This is the correct string";
	NSString *secondString;
	secondString = [firstString mutableCopy];

	String firstString = "This is the correct string";
	String secondString = firstString;

Here we have to make a mutableCopy in Objc. A shallow copy is a copy where the instance variables points to the same memory location where a deep copy is a copy where also a copy of the instance variables is made. Deep copy is better.

>... how dynamic typing of ids compare with the OTLTYAFW.  Is there
   a comparable construct in your other language(s)?  (Hint: When/how
   is type information lost?)
   
	id a = @"Hejsa";

	NSLog(@"The length of "%@" is %lu", a, [a length]);

The special id type in Objc is able to be a pointer to any variable. This is useful when you expect to get a class of that original class then you do have to chose which one.

>... how does field hiding work as compared with the OTLTYAFW.
   (Hint: Does hiding/shadowing work, is it a good practice, do the
   types matter?)

The biggest different from Objc and Jave is that the properties are only allow to be accessed by the getters and the setters. Ex
   
	[calculator setOperation: @"+"];
	calculator.setOperation("+");

>... the built-in methods for logging as compared to the OTLTYAFW.
   (Hint: There is more to the world than printf in logging and
   debugging.)
   
I haven't really used other than the print function to log in Java which is described at the top.

>... how NSArray compared with (typically monomorphic) arrays in the
   OTLTYAFW.  (Hint: Look up monomorphic and consider the typical
   anti-patterns for array use.)
   
The only difference I found is that the type of the array is not allow to be specified and that if it is a NSArray of objects then the type is id.

>... how does nil work as compared to the semi-equivalent construct
   in the OTLTYAFW.  (Hint: What are the programming errors relating
   to such?  Can one call methods on/send messages to nil/null/0?)

Nil in Objc is 0 and is able to be return. It is the default value of a pointer. Other that then is it the same as null in Java.

>... how do the primitive types look in Objective-C as compared to
   the OTLTYAFW.  (Hint: Consider those types that are fundamental and
   part of the language definition and those that are actually deemed
   "primitive".)

This is the primitive type I could find:

`BOOL`, `char`, `short`, `int`, `long`, `long long`, `unsigned short`, `unsigned int`, `unsigned char`, `unsigned long`, `unsigned long long`, `float`, `double`

No different from Java. `NSString` and `String` are objects.

>... how do strong vs. weak pointers work as compared with
   semi-equivalent construct in the OTLTYAFW.  (Hint: Look into
   java.lang.ref and .Net's System.WeakReference if you have never
   done so before.)

Pointers can be strong and weak in Objc. Strong pointer to an object means that the object should under no circumstances be released from the heap until the pointer is set to nil or manually released. When the pointer is strong to an object it means that the object can only be released when to pointer is nil is told otherwise. When the pointer is weak it is in the heap until something is pointed strong to it. It is set to nil if it is removed from the heap.

Garbage collection is not something that I have used a lot in Java. It is done automatic and it seems very complex.