Reflextions:

 - ... the Foundation framework with the core classes of the
   language(s) that you are familiar with? (abbreviated henceforth as
   OTLTYAFW) (Hint: Compare the classes in Foundation, and in
   particular their fundamental design idioms, with classes in
   java.lang/java.util and .Net's System namespace.)

/ - ... how common aliasing is and how it is avoided compared to the
   OTLTYAFW.  (Hint: The keyword here is "ownership".)
   Aliasing can easily  become an issue in objective-C unless the programmer 
   himself keeps track of the pointers and makes sure that no two pointers point to the same object
   or memory.
   However, in the other language that I know of (Java), this seems to not be an issue, as
   Java does not use pointers - instead, it uses references, which makes it much easier to
   keep track of every single object reference.

/ - ... the alloc/init pattern of object instantiation with how objects are constructed in the OTLTYAFW.  (Hint: What are best practices for constructors in the language of your choice.)
	The alloc/init pattern is a part of objective-C's memory management philosophy. First, +Alloc is called which is a class method that returns an uninitiated instance of the object, after which -init is called which actually initialises.
	Java, on the other hand, does both of these with it's "new" keyword, and there is no equivalent in objective-C - one can send a +new message, but that's still just a class method that calls +alloc/-init

 - ... how class types are used with those in the OTLTYAFW.

 - ... how constructors and factories are realized as compared to the
   OTLTYAFW.  (Hint: Compare best practices in factories.)

/ - ... how copying and cloning of objects works (see NSObject's API)
   as compared to the OTLTYAFW.  (Hint: Deep vs. shallow copies,
   twinning, cloning, mutability of iterations, etc.)
   When copying, Java uses shallow copying per standard, which means that Java just copies the
   adress, rather than the whole object. Objective-C on the other hand has two standard functions,
   one that copies the adress like Java, and one that copies the whole object.

 - ... how dynamic typing of pointers compare with the OTLTYAFW.
   (Hint: When/how is type information lost?)

 - ... how dynamic typing of ids compare with the OTLTYAFW.  Is there
   a comparable construct in your other language(s)?  (Hint: When/how
   is type information lost?)

 - ... how expanded types are declared and used with the OTLTYAFW.
   (Hint: Can you alias expanded types?  Can user-defined types be
   expanded?)

 - ... how does field hiding work as compared with the OTLTYAFW.
   (Hint: Does hiding/shadowing work, is it a good practice, do the
   types matter?)

/ - ... how is immutability used and why as compared with the
   OTLTYAFW.  (Hint: What are the immutable base types in your other
   languages(s)?  Are they *really* immutable?  What good are
   immutable data types?)
	Immutability is the ability to lock an object, making sure that the state cannot change after the construction of the object. In objective-C, you create one such by, for instance, calling "NSImmuteableArray" or "NSImmuteableString".
	In Java, one can accomplish the same thing through the "Final" statement.

 - ... how inheritance works as compared to the OTLTYAFW.  (Hint:
   Consider single vs. multiple inheritance and behavioral vs. code
   inheritance.  How does class inheritance work and how does type
   inheritance work?)

 - ... the built-in methods for logging as compared to the OTLTYAFW.
   (Hint: There is more to the world than printf in logging and
   debugging.)
	For logging, Apple has generally just used NSLog for some time, but at 10.4, they decided they could do one better and introduced ASL - Apple System Logger. Generally, it's a logging API with all the capabilities of syslog(3) (void syslog(int priority, const char *format, ...) is the format for syslog(3)) 

 - ... how method overloading works (or doesn't) as compared to the
   OTLTYAFW.  (Hint: Is overloading permitted?  Is it a best practice?
   What are the pros and cons?)
	Objective-C does not support method overloading, whereas Java does support having two or more methods within the same class that share the same name - so long as their parameters are different.

 - ... how polymorphism works (or doesn't) as compared to the
   OTLTYAFW.  (Hint: Note that I did not say what *kind* of
   polymorphism.)
	Java and Objective-C works in the same way here.

 - ... how NSArray compared with (typically monomorphic) arrays in the
   OTLTYAFW.  (Hint: Look up monomorphic and consider the typical
   anti-patterns for array use.)

 - ... how does nil work as compared to the semi-equivalent construct
   in the OTLTYAFW.  (Hint: What are the programming errors relating
   to such?  Can one call methods on/send messages to nil/null/0?)

/ - ... how do the primitive types look in Objective-C as compared to
   the OTLTYAFW.  (Hint: Consider those types that are fundamental and
   part of the language definition and those that are actually deemed
   "primitive".)
   The primitive types of objective C are almost the same as that of C,
   which is quite natural, seeing that it is an overlay of C. Furthermore,
   they also seems to be identical to that of Java's primitive classes

 - ... how do protocols work and how do they compare with the
   semi-equivalent construct in the OTLTYAFW.  (Hint: Consider classes
   that implement multiple protocols and how protocols and class &
   type inheritance work.)

 - ... how are singletons defined and used as compared with the
   OTLTYAFW.  (Hint: Do the patterns for defining and using singletons
   maps to/from your other language(s)?)

 - ... how does (static and dynamic) method resolution work as
   compared to the OTLTYAFW.  (Hint: In Java and C# the compiler knows
   exactly which method will be called, just not which *version* of
   that method will be called at runtime.)

 - ... how do strong vs. weak pointers work as compared with
   semi-equivalent construct in the OTLTYAFW.  (Hint: Look into
   java.lang.ref and .Net's System.WeakReference if you have never
   done so before.)

 - ... how does variance work as compared with the OTLTYAFW.  (Hint:
   If you have never heard of method covariance, contravariance, and
   invariance, you have some fun reading to do.  E.g., Consider how return
   types in method definitions can change wrt inheritance.)

 - ... how do exceptions work as compared with the OTLTYAFW.  (Hint:
   What do method declarations look like with regards to exceptional
   behavior?)

 - ... how does value boxing and unboxing work as compared to the
   OTLTYAFW.  (Hint: Note that I did not just say *primitive* value
   boxing.)

 - ... how introspection in Objective-C compares to built-in support
   for dynamic type checking (e.g., Java's instanceof keyword) and
   reflection in the OTLTYAFW.  (Consider the types id and SEL as
   compared to java.lang.reflect and .Net's reflective types in the
   System namespace.)

 - ... how do enumerations work as compared with the OTLTYAFW.  (Hint:
   Compare Objective-C's fast enumerations with those of the
   language(s) you know.  How do immutability and exceptions work with
   regards to enumerations?)

 - ... how do Properly Lists look as compared to the semi-equivalent
   construct in the OTLTYAFW.  (Hint: Think about Java's
   java.util.ResourceBundle and java.util.Properties and the similar
   classes in .Net.  Also think about JSON, if you know it.)

 - ... how do Blocks compare with the semi-equivalent
   construct in the OTLTYAFW.  (Hint: Think about Java's anonymous
   classes and C#'s lambdas.)
