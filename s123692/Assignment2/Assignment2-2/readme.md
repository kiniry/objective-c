Assignment2-2 Reflections
-------------------------

Reflect upon...

**Foundation Framework**
 The Foundation Framework contain an OO API, extending the predecessor
 C. This means that you can port original C programs directly into
 Objective-C.
 Java and Objective-C are simular in the way that all objects in fx. Java inherit
 from the super-class Object, as all Objective-C objects inherits from
 NSObject.

**Aliasing**
 Aliasing is when several pointers reference the same location (object).

**Instantiation**
 Alloc/init is the standard way of initializing new varibles in
 Objective-C. Here the alloc is a class method that returns and
 uninitialized instance of the chosen object, and init, which is a
 instance method, initializes it. It is common to override init as a
 kind of constructor.

**Constructors and factories**
 As I have come to learn, the best practive when it comes to
 contructors in Objective-C, is to override the init instance
 method, as mentioned above. Here you declare the selectors instance
 as a initialization of the super-class, set the instance variables
 (to 0, if not else specified), and return the instance. Which is
 usually passed to alloc, that stores it in the heap.
 Factories are static methods, commonly used by the framework.

**Class types**
 * ... how class types are used with those in the OTLTYAFW.

**Copying and cloning**
 * ... how copying and cloning of objects works (see NSObject's API)
   as compared to the OTLTYAFW.
 * (Hint: Deep vs. shallow copies,
   twinning, cloning, mutability of iterations, etc.)

**Dynamic typing**
 * ... how dynamic typing of pointers compare with the OTLTYAFW.
 * (Hint: When/how is type information lost?)
 * ... how dynamic typing of ids compare with the OTLTYAFW.  Is there
   a comparable construct in your other language(s)?
 * (Hint: When/how is type information lost?)

**Expanded types**
 * ... how expanded types are declared and used with the OTLTYAFW.
 * (Hint: Can you alias expanded types?  Can user*defined types be
   expanded?)

**Encapsulation**
 * ... how does field hiding work as compared with the OTLTYAFW.
 * (Hint: Does hiding/shadowing work, is it a good practice, do the
   types matter?)

**Immutability**
 * ... how is immutability used and why as compared with the
   OTLTYAFW.
 * (Hint: What are the immutable base types in your other
   languages(s)?  Are they *really* immutable?  What good are
   immutable data types?)

**Inheritance**
 Objects in Java and Objective-C work in a simular way. Objects are
 instances of Classes, and can extend a maximum of one super-class.

**Logging**
 Objective-C does not use C's printf() function, but implements it's
 own NSLog method, found in the Foundation framework. This is usually
 used with a formatted NSString, with '%' as identifier.

**Polymorphism**
 Objective-C implements polymorphism of method names, which means
 that classes can have mothods with the same name.

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
 and means that the refered object is kept on the heap til it is no
 more refered to (i.e. the pointer is set to nil), or it is manually
 released.
 A 'weak' pointer's purpose is to avoid retain cycles. This is when
 an object becomes obsolete and should be released, but is kept in
 the heap because an also obsolete child is referencing it. Therefor
 the child should have a weak pointer to its parent, thus being
 being released when it's parent is being released (technically,
 before so it can't reference something that's not there).

**Variance**
 * ... how does variance work as compared with the OTLTYAFW.
 * (Hint: If you have never heard of method covariance, contravariance, and
   invariance, you have some fun reading to do.  E.g., Consider how return
   types in method definitions can change wrt inheritance.)

**Excpeptions**
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
 * ... how does value boxing and unboxing work as compared to the
   OTLTYAFW.
 * (Hint: Note that I did not just say *primitive* value boxing.)

**Introspection**
 Objective-C implements the data type id, which is actually a
 reference to a random object, of a random class. This is what makes
 the need for introspection. A method can recieve an object of a
 unknown class, and self deciede what to with it, depending on the
 object's class. (Mentioned earlier regarding overloading)

**Enumeration**
 Enumeration in Objective-C is often expensive and inefficient as
 new variables are allocated room for, initiatied, done something
 with, and released, over and over. Fast enumeration is essentially
 Objective-C's implementation of the common for-each, which is much
 more efficient and recommended over regular enumeration everywhere
 it is possible.
 During fast enumeration it is unsafe to modify mutable sets, as
 some other method can modify it behing our backs, creating
 unpredictable results/effects (e.g. partially implemented values or
 crash).
 (See example in source code)

**Property lists**
 * ... how do Properly Lists look as compared to the semi-equivalent
   construct in the OTLTYAFW.
 * (Hint: Think about Java's java.util.ResourceBundle and
   java.util.Properties and the similar classes in .Net.  Also think
   about JSON, if you know it.)

**Blocks**
 * ... how do Blocks compare with the semi-equivalent
   construct in the OTLTYAFW.
 * (Hint: Think about Java's anonymous classes and C#'s lambdas.)
