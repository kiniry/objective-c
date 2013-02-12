Assignment2-2 Reflections 
------------------------- 
 
Reflect upon... 
 
**Foundation Framework** 
 The Foundation Framework contain an OO API, extending the predecessor 
 C. This means that you can port original C programs directly into 
 Objective-C. 
 Java and Objective-C are similar in the way that all objects in fx. Java inherit 
 from the super-class Object, as all Objective-C objects inherits from 
 NSObject. 
 
**Aliasing** 
 Aliasing is when several pointers reference the same location (object). 
 
**Instantiation** 
 Alloc/init is the standard way of initializing new variables in 
 Objective-C. Here the alloc is a class method that returns and 
 uninitialized instance of the chosen object, and init, which is a 
 instance method, initializes it. It is common to override init as a 
 kind of constructor. As instance variable they are initialized to 0. 
 As a local variable they are initialized to an undefined value. 
 
**Constructors and factories** 
 As I have come to learn, the best practice when it comes to 
 constructors in Objective-C, is to override the init instance 
 method, as mentioned above. Here you declare the selectors instance 
 as a initialization of the super-class, set the instance variables 
 (to 0, if not else specified), and return the instance. Which is 
 usually passed to alloc, that stores it in the heap. 
 Factories are static methods, commonly used by the framework. 
 
**Class types** 
 In both Object-C and Java objects are allocated on the heap. The 
 difference is the way the are referenced to. Objective-C uses 
 pointers, where the values can be manipulated directly, while Java 
 uses referencing and cannot be directly referenced. 
 
**Copying and cloning** 
 For an object in Object-C to be copyable it must implement the the 
 NSCopying or NSMutableCopyting protocol. First then can the NSObject's 
 copy and mutableCopy be used to create a shallow copy (without getting 
 an exception, anyway). Most Objective-C classes conform NSCopying. 
 
**Dynamic typing** 
 As mentioned elsewhere in this readme, Objective-C implements an 
 object type called 'id', which is a random object of a random class. 
 This creates the use for introspection. At run time all objects are 
 ids; the classes we are familiar with are just for the programmer. 
 Objects of type id can be cast to whatever, possibly resulting in a 
 crash. 
 
**Encapsulation** 
 The point of encapsulation is hiding sertain information and thereby 
 insulating the programmer from inadvertent access of unintentional 
 actions. Therefor an interface must encapsulate the 
 implementation—that is, hide it from other parts of the program. 
 With this intention, it is always advised to use properties whenever 
 possible, thereby forcing you to use getter and setters. 
 Java has similar conventions, but it is possible to access fields 
 directly through public instance variables, though it is seen as bad practice. 
 
**Immutability** 
 In Objective-C, objects are by default mutable, meaning you could 
 change an object's value after it first have being set. When an object 
 is immutable, this is not possible. Firstly this would seem 
 impractical, as classes with instance variables are required to be 
 mutable, but actually it has many advantages. Firstly it safer, as 
 multiple threads can't change it at the same time, resulting in a 
 partial value. Secondly, multiple pointer may reference the same 
 value, saving resources. This can't be done with a mutable variable, 
 as the value could be changed by one thread, messing things up for 
 another thread. Lastly, immutability creates a big potential for 
 compiler optimization. 
 NSString, a part of the Foundation framework, are immutable. 
 
**Inheritance** 
 Objects in Java and Objective-C work in a similar way. Objects are 
 instances of Classes, and can extend a maximum of one super-class. 
 
**Logging** 
 Objective-C does not use C's printf() function, but implements it's 
 own NSLog method, found in the Foundation framework. This is usually 
 used with a formatted NSString, with '@' as identifier. 
 
**Polymorphism** 
 Objective-C implements polymorphism of method names, which means 
 the ability to present the same interface for differing underlying forms. 
 
**Overloading** 
 Objective-C does not implement parameter or operator overloading. 
 Though, Objective-C takes use of the id type, which is a pointer to 
 a arbitrary type. id can therefore be used with introspection, 
 removing the need for overloading. 
 
**Arrays** 
 Like most OO languages the NSArray, which is a part of the 
 Foundation framework, is a immutable, ordered set of elements. In 
 Java fx., an array i declared with a content object type, where it 
 only can contain elements of this type. In Objective-C, elements 
 are always return as id type. 
 
**Nil-reference** 
 When referencing nil/null-values in Java, a NullPointerException is 
 thrown. In Objective-C this is not looked upon as an error, rather 
 it is the default value of a pointer. This is commonly looked at as 
 an advantage. If you reference a method with a nil argument, you 
 would simply get nil in return. 
 
**Primitive dataypes** 
 Java contains small set of primitive data types, which the compiled 
 treats explicitly. Objective-C inherits all C's types. Some details 
 are: 
 * C only defines the minimum range for a type. 
 * A short in Java is always 16 bit, while a short in C is usually 16 bits. 
 * An int in Java is always 32 bit, while an int in C is 16, 32 or 64 
   bits on today's platforms. Usually the 32 bits platform you'll use 
   with Objective-C. 
 
**Protocols** 
 Protocols are the Objective-C equivalent to Java's interfaces; they 
 declare interfaces which other classes can implement, thus creating 
 a communication link through the given protocol. 
 
**Singletons** 
 ... how are singletons defined and used as compared with the 
 OTLTYAFW. (Hint: Do the patterns for defining and using singletons maps 
 to/from your other language(s)?) 
 
**Method resolution (Dynamism)** 
 ... how does (static and dynamic) method resolution work as 
 compared to the OTLTYAFW.  (Hint: In Java and C# the compiler knows 
 exactly which method will be called, just not which *version* of 
 that method will be called at runtime.) 
 
**Strong vs. Weak Pointers (ARC)** 
 Automatic Reference Counting (ARC), which was introduced in Xcode 
 4.2, is a memory management enhancement where the burden of keeping 
 track of an object's reference count is lifted from the programmer 
 to the compiler. The keywords 'strong' and 'weak' helps ARC keeping 
 track of just this. 
 A 'strong' pointer is the default, if nothing else is specified, 
 and means that the referred object is kept on the heap till it is no 
 more referred to (i.e. the pointer is set to nil), or it is manually 
 released. 
 A 'weak' pointer's purpose is to avoid retain cycles. This is when 
 an object becomes obsolete and should be released, but is kept in 
 the heap because an also obsolete child is referencing it. Therefor 
 the child should have a weak pointer to its parent, thus being 
 being released when it's parent is being released (technically, 
 before so it can't reference something that's not there). 
 
**Exceptions** 
 Formerly Objective-C inherited the functions setjmp() and longjmp() 
 from C. These were very expensive and supported no cleanup. Newer 
 implementations use C++ GNU's zero-cost exception model. Here you 
 can enter @try blocks, without cost, but throwing is still very 
 expensive. 
 In Java, exceptions are used frequently as a good practice, but in 
 Objective-C it is advisable to only use them in special cases. 
 An common Objective-C alternative is to pass a pointer to an 
 NSError object, in as an extra argument to methods that are likely 
 to fail. 
 
**Value boxing** 
 Boxing is the process as sending values of a given type 'boxed' as another 
 type. E.g. NSLog takes a NSString as its argument, but we normally 
 just type @"something". The '@' represents the process of boxing with 
 the use of literals. We can therefor use a primitive data type where 
 the Framework can them use them for its collection of classes. 
 NSNumber can box several primitive C types, e.g. string, double, 
 float, BOOL, int, etc. 
 Java implements automatic boxing of data types. 
 
**Introspection** 
 Objective-C implements the data type id, which is actually a 
 reference to a random object, of a random class. This is what makes 
 the need for introspection. A method can receive an object of a 
 unknown class, and self decide what to with it, depending on the 
 object's class. (Mentioned earlier regarding overloading) 
 
**Enumeration** 
 Enumeration in Objective-C is often expensive and inefficient as 
 new variables are allocated room for, initiated, done something 
 with, and released, over and over. Fast enumeration is essentially 
 Objective-C's implementation of the common for-each, which is much 
 more efficient and recommended over regular enumeration everywhere 
 it is possible. 
 During fast enumeration it is unsafe to modify mutable sets, as 
 some other method can modify it behind our backs, creating 
 unpredictable results/effects (e.g. partially implemented values or 
 crash). 
 (See example in source code) 
 
**Property lists** 
 Property lists are a unordered collection of named values of 
 different types. This is normally implemented through Objective-C's 
 NSDictionary. 
 
**Blocks** 
 Blocks work as an inline function that can be passed around. This 
 is a very powerful feature, but also presents itself with some 
 challenges. E.g. you have to be careful to avoid retain cycles with 
 using the '__weak' prefix, and you must use '__block' when editing 
 local values in a block which is becomes run at a later time. 
 A prominent feature is the Grand Dispatch Central (GDC), which is a C 
 API. Here you can create new 'queues' which run aside from the 'main 
 queue', where all UIKit commands are run. If you have multiple 
 cpu/cores's your app can run multithreaded. 
