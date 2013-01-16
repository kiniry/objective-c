Assignment2-2 Reflections.
==========================

Reflect upon...

** Foundation Framework **
 * ... the Foundation framework with the core classes of OTLTYAFW.
 * (Hint: Compare the classes in Foundation, and in particular their fundamental design idioms, with classes in java.lang/java.util and .Net's System namespace.)


** Aliasing **
 * ... how common aliasing is and how it is avoided compared to the
   OTLTYAFW.
 * (Hint: The keyword here is "ownership".)

** Instantiation **
 * ... the alloc/init pattern of object instantiation with how objects
   are constructed in the OTLTYAFW.
 * (Hint: What are best practices
   for constructors in the language of your choice.)

** Class types **
 * ... how class types are used with those in the OTLTYAFW.

** Constructors and factories **
 * ... how constructors and factories are realized as compared to the
   OTLTYAFW.
 * (Hint: Compare best practices in factories.)

** Copying and cloning **
 * ... how copying and cloning of objects works (see NSObject's API)
   as compared to the OTLTYAFW.
 * (Hint: Deep vs. shallow copies,
   twinning, cloning, mutability of iterations, etc.)

** Dynamic typing **
 * ... how dynamic typing of pointers compare with the OTLTYAFW.
 * (Hint: When/how is type information lost?)
 * ... how dynamic typing of ids compare with the OTLTYAFW.  Is there
   a comparable construct in your other language(s)?
 * (Hint: When/how is type information lost?)

** Expanded types **
 * ... how expanded types are declared and used with the OTLTYAFW.
 * (Hint: Can you alias expanded types?  Can user*defined types be
   expanded?)

** Encapsulation **
 * ... how does field hiding work as compared with the OTLTYAFW.
 * (Hint: Does hiding/shadowing work, is it a good practice, do the
   types matter?)

** Immutability **
 * ... how is immutability used and why as compared with the
   OTLTYAFW.
 * (Hint: What are the immutable base types in your other
   languages(s)?  Are they *really* immutable?  What good are
   immutable data types?)

** Inheritance **
 * ... how inheritance works as compared to the OTLTYAFW.
 * (Hint: Consider single vs. multiple inheritance and behavioral vs. code
   inheritance.  How does class inheritance work and how does type
   inheritance work?)
 * Objects in Java and Objective-C work in a simular way. Objects are
   instances of Classes, and can extend a maximum of one super-class.

** Logging **
 * ... the built-in methods for logging as compared to the OTLTYAFW.
 * (Hint: There is more to the world than printf in logging and
   debugging.)

** Polymorphism **
 * ... how polymorphism works (or doesn't) as compared to the
   OTLTYAFW.
 * (Hint: Note that I did not say what *kind* of
   polymorphism.)
 * Objective-C implements polymorphism of method names, which means
   that classes can have mothods with the same name.

** Overloading **
 * ... how method overloading works (or doesn't) as compared to the
   OTLTYAFW.
 * (Hint: Is overloading permitted? Is it a best practice? What are
   the pros and cons?)
 * Objective-C does not implement parameter or operator overloading.
   Though, Objective-C takes use of the id type, which is a pointer to
   a arbitrary type. id can therefore be used with introspection,
   removing the need for overloading.

** Arrays **
 * ... how NSArray compared with (typically monomorphic) arrays in the
   OTLTYAFW.
 * (Hint: Look up monomorphic and consider the typical
   anti-patterns for array use.)

** Nil-reference **
 * ... how does nil work as compared to the semi-equivalent construct
   in the OTLTYAFW.
 * (Hint: What are the programming errors relating
   to such?  Can one call methods on/send messages to nil/null/0?)
 * When referencing nil/null-values in Java, a NullPointerException is
   thrown. In Objective-C this is not looked upon as an error, on the
   contrary it's used to it's advantage. You would simply get nil in
   return. (Example in source code)

** Primitive dataypes **
 * ... how do the primitive types look in Objective-C as compared to
   the OTLTYAFW.
 * (Hint: Consider those types that are fundamental and part of the
   language definition and those that are actually deemed
   "primitive".)
 * Java contains small set of primitive data types, which the compiled
   treats explicitly. Objective-C inherits all C's types.

** Protocols **
 * ... how do protocols work and how do they compare with the
   semi*equivalent construct in the OTLTYAFW.
 * (Hint: Consider classes that implement multiple protocols and how
   protocols and class & type inheritance work.)

** Singletons **
 * ... how are singletons defined and used as compared with the
   OTLTYAFW.
 * (Hint: Do the patterns for defining and using singletons maps
   to/from your other language(s)?)

** Method resolution (Dynamism) **
 * ... how does (static and dynamic) method resolution work as
   compared to the OTLTYAFW.  (Hint: In Java and C# the compiler knows
   exactly which method will be called, just not which *version* of
   that method will be called at runtime.)

** Strong vs. Weak Pointers **
 * ... how do strong vs. weak pointers work as compared with
   semiequivalent construct in the OTLTYAFW.
 * (Hint: Look into java.lang.ref and .Net's System.WeakReference if you have never
   done so before.)

** Variance **
 * ... how does variance work as compared with the OTLTYAFW.
 * (Hint: If you have never heard of method covariance, contravariance, and
   invariance, you have some fun reading to do.  E.g., Consider how return
   types in method definitions can change wrt inheritance.)

** Excpeptions **
 * ... how do exceptions work as compared with the OTLTYAFW.
 * (Hint: What do method declarations look like with regards to exceptional
   behavior?)
 * Formerly Objective-C inherited the functions setjmp() and longjmp()
   from C. These were very expensive and supported no cleanup. Newer
   implementations use C++ GNU's zero-cost exception model. Here you
   can enter @try blocks, without cost, but throwing is still very
   expensive.
   In Java, exceptions are used frequently as a good practice, but in
   Objective-C it is advisable to only use them in special cases.
   An common Objective-C alternative is to pass a pointer to an
   NSError object, in as an extra argument to methods that are likely
   to fail.

** Value boxing **
 * ... how does value boxing and unboxing work as compared to the
   OTLTYAFW.
 * (Hint: Note that I did not just say *primitive* value boxing.)

** Introspection **
 * ... how introspection in Objective-C compares to built-in support
   for dynamic type checking (e.g., Java's instanceof keyword) and
   reflection in the OTLTYAFW.
 * (Consider the types id and SEL as compared to java.lang.reflect and
   .Net's reflective types in the System namespace.)

** Enumeration **
 * ... how do enumerations work as compared with the OTLTYAFW.  (Hint:
   Compare Objective-C's fast enumerations with those of the
   language(s) you know.  How do immutability and exceptions work with
   regards to enumerations?)

** Property lists **
 * ... how do Properly Lists look as compared to the semi-equivalent
   construct in the OTLTYAFW.
 * (Hint: Think about Java's java.util.ResourceBundle and
   java.util.Properties and the similar classes in .Net.  Also think
   about JSON, if you know it.)

** Blocks **
 * ... how do Blocks compare with the semi-equivalent
   construct in the OTLTYAFW.
 * (Hint: Think about Java's anonymous classes and C#'s lambdas.)
