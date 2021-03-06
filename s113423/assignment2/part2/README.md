### Foundation framework
 - ... the Foundation framework with the core classes of the
   language(s) that you are familiar with? (abbreviated henceforth as
   OTLTYAFW) (Hint: Compare the classes in Foundation, and in
   particular their fundamental design idioms, with classes in
   java.lang/java.util and .Net's System namespace.)

### Aliasing

- ... how common aliasing is and how it is avoided compared to the
   OTLTYAFW.  (Hint: The keyword here is "ownership".)

### Object instantiation

To instantiate an object in Objective-C,
you first call the method alloc on the class
and then one of its initializer methods (e.g. init) on the result.

    MyClass* object = [[MyClass alloc] initWithNumber:123];

This allocates the memory for the object on the heap,
initializes the object, and returns a pointer to it.
It's strongly discouraged to call alloc without an initializer method in the same statement.

In Java you use the new keyword along with the class name.
This allocates memory for the object on the heap
and invokes the constructor.

    MyClass object = new MyClass(123);

It's considered bad practice to have the constructor do too much work other than initializing fields.

### Class types

In Objective-C, all objects are alloced on the heap
and referenced to using pointers (e.g. NSString* name).

Java objects are also allocated on the heap,
but Java doesn't have a concept of pointers
and uses references to objects instead.
The difference is that pointers can be directly manipulated
whereas references cannot.

### Constructors and factories
The initializer methods used in Objective-C acts as constructors for objects.
Every class have what's called a designated initializer (simply documented as so, there's no special syntax).

The established convention is the following;
from inside your designated initializer,
you call the designated initializer of the superclass
and assign the result to the variable self,
ensure self isn't nil and initialize your own class,
and finally return self.
You are allowed to return nil,
given that you are unable to put the object into a valid state.
Other potential initializers must all make a call to your designated initializer.

    - (id)initWithName:(NSString*)name {
       self = [super init];
       if (self) {
          _name = name;
       }
       return self;
    }

Another approach common in Objective-C,
is to use lazy instantiation,
where fields are initialized the first time its getter is called.

    - (NSString*)name {
      if (!_name) _name = @"Whatever";
      return _name;
    }

It's also common to have a class method as a factories.
Here's an example from NSString:

    NSString* string = [NSString stringWithFormat@"Hello %@!", @"World"];

In Java, a constructor is always invoked when using the new keyword.
If the class has no custom constructors,
then Java will provide a default constructor
that calls the constructor with no arguments of the superclass
and sets all fields to 0.

...factories in Java...

### Copying
The class NSObject provides the methods copy and mutableCopy,
however, these method simply raise an exception.
If a class is to support copy and/or mutableCopy,
then it must conform to the protocols NSCopying and NSMutableCopying respectively.
To do so you need to implement the methods copyWithZone: and mutableCopyWithZone:.

Most built-in classes of Objective-C conform to NSCopying,
and those with a mutable counterpart also conform to NSMutableCopying.
The copy methods of the built-in collections (NSArray, NSSet..) perform a shallow copy.

Java has a similar pattern where classes that support the clone() method
implement the Clonable interface and provide the clone() method.
Another approach is to implement a copy constructor,
where you pass the object to the constructor of the same class
and get a new object.


### Dynamic typing of pointers
- ... how dynamic typing of pointers compare with the OTLTYAFW.
   (Hint: When/how is type information lost?)


### Dynamic typing of ids
- ... how dynamic typing of ids compare with the OTLTYAFW.  Is there
   a comparable construct in your other language(s)?  (Hint: When/how
   is type information lost?)


### Expanded types
 - ... how expanded types are declared and used with the OTLTYAFW.
   (Hint: Can you alias expanded types?  Can user-defined types be
   expanded?)


### Field hiding
It's possible to declare instance variables directly
and have one hide another (type doesn't matter), however,
you're supposed to use properties instead
and only access the instance variables directly inside initializer methods,
custom accessors, and dealloc (not used with ARC).

Declaring the same property with the same type in a subclass essentially does nothing,
it simply reuses the instance variable.

It's possible to hide fields in Java,
but it's bad practice as it makes the code harder to read.


### Immutability
 - ... how is immutability used and why as compared with the
   OTLTYAFW.  (Hint: What are the immutable base types in your other
   languages(s)?  Are they *really* immutable?  What good are
   immutable data types?)


### Inheritance
Neither Objective-C or Java support multiple inheritance.
Inheritance works much like in Java,
where subclasses inherit the fields and method of the superclass.
In Java, you have specify the access level of fields and methods as
private, package-private (default), protected, public.
Private fields and methods are not inherited by subclasses.

Methods in Objective-C have no access level modifiers.
One way to have a "private" implementation specific method
is to declare it in a class extension in the implementation file (.m).
Although this does not prevent the method from being overriden in a subclass.


### Logging
 - ... the built-in methods for logging as compared to the OTLTYAFW.
   (Hint: There is more to the world than printf in logging and
   debugging.)

### Method overloading
Method overloading is not supported in Objective-C.
Two methods of a class can't have the same name,
where the name includes semicolons, but not parameter names.

    - (NSString *)hello;
    - (NSNumber *)hello; // error: duplicate declaration of method 'hello'
    - (void)sendMessage:(NSString *)message;
    - (void)sendMessage:(NSString *)message toPerson:(Person *)recipient; // works: method name is 'sendMessage:toPerson:'
    - (void)sendMessage:(NSData *)data; // error: duplicate declaration of method 'sendMessage:'

It's possible to overload methods in Java.
Methods are differentiated by their method signature (name and number of parameters and their types).
However, return types are not considered, so you can't have two methods with the same signature but different return type.

### Polymorphism
- ... how polymorphism works (or doesn't) as compared to the
   OTLTYAFW.  (Hint: Note that I did not say what *kind* of
   polymorphism.)


### NSArray
- ... how NSArray compared with (typically monomorphic) arrays in the
   OTLTYAFW.  (Hint: Look up monomorphic and consider the typical
   anti-patterns for array use.)

### nil
In both Objective-C and Java fields/instance variables are
intialized to nil/null by default.
This simply means that the pointer/reference doesn't
point to anything.

If you attempt to call a method on a null reference in Java,
then the exception NullPointerException is thrown
and the program crashes.

If you send a message to nil in Objective-C,
then nothing happens and the call returns nil.
This can sometimes help to simplify code
in places where you'd extensively check for nil.


### Primitive types

Objective-C is a subset of C,
which means that all the primitive types in C are available in Objective-C as well.
These include int, unsigned int, float, double, char, long, long long, and so on.
Java has eight primitive types; byte, short, int, long, float, double, boolean, and char.

The sizes of primtives in Java are well defined,
whereas they depend on the architecture in C (and Objective-C).


### Protocols
Protocols declare a collection methods and properties (as required or optional) without their implementation.
A class conforming to a protocol must implement all required methods in that protocol.
A protocol can extend multiple protocols, and classes can conform to multiple protocol.

Protocols in Objective-C a very similiar to interfaces in Java,
with the exception of optional methods.
Optional methods in protocols are really only for documentation,
as you'd have to use introspection anyway to make sure that the object responds to the given selector.

    if ([object respondsToSelector:@selector(doSomething)]) {
       [object doSomething];
    }

You usally have protocols extend the NSObject protocol,
as all classes should inherit from the NSObject class anyway.
It's possible to have an object with type id that conforms to a protocol.

    id <SomeProtocol> unknownObject;


### Singletons
 - ... how are singletons defined and used as compared with the
   OTLTYAFW.  (Hint: Do the patterns for defining and using singletons
   maps to/from your other language(s)?)


### Method resolution
 - ... how does (static and dynamic) method resolution work as
   compared to the OTLTYAFW.  (Hint: In Java and C# the compiler knows
   exactly which method will be called, just not which *version* of
   that method will be called at runtime.)


### Strong vs. weak pointers
In Objective-C,
strong and weak pointers are used with Automatic Reference Counting (ARC).
Pointers are strong by default,
which means that the object it points to
won't be deallocated.
If there's only weak pointers pointing to an object,
then it might be deallocated and set to nil.
The reason you'd want to use weak pointers
is to avoid what's called a strong reference cycle,
where objects with strong pointers form a cycle,
which makes it impossible for ARC to deallocate the objects.
Properties are strong by default (they retain the object passed to the setter),
but can be changed to weak with the ```weak`` attribute.

In Java,
all references are strong by default as well.
This means that the garbage collector won't
suddenly deallocate the objects referenced to.
It's also possible to have weak references
with different levels of *weakness*
using ```WeakReference<T>``` and ```SoftReference<T>``` of java.lang.ref.


### Variance
Objective-C doesn't impose any restrictions on
variance of return and argument types of overriden methods.
It's up to oneself to not break the Liskov substitution principle,
which states that return types should be covariant and argument types contravariant.
The type of overriden properties, however, must be covariant.

The return type of an overriden method in Java (since 1.5) must be covariant,
while the argument types are invariant (method is overloaded, not overriden).


### Exceptions
 - ... how do exceptions work as compared with the OTLTYAFW.  (Hint:
   What do method declarations look like with regards to exceptional
   behavior?)


### Value boxing
 - ... how does value boxing and unboxing work as compared to the
   OTLTYAFW.  (Hint: Note that I did not just say *primitive* value
   boxing.)

The Foundation framework provides the class NSNumber
that can wrap around the numberic C types (int, float, double, ...),
so that they can fit in the Foundation collection classes.
In Java you have the classes Integer, Double, Float and so on,
again used to store primitives in collections.

Java supports automatic boxing and unboxing of the numeric types,
whereas in Objective-C you have to create a new object and call the getter to unbox.
You can however use the NSNumber literal (e.g. NSNumber* n = @123;) to easily create new NSNumber objects.


### Introspection
 - ... how introspection in Objective-C compares to built-in support
   for dynamic type checking (e.g., Java's instanceof keyword) and
   reflection in the OTLTYAFW.  (Consider the types id and SEL as
   compared to java.lang.reflect and .Net's reflective types in the
   System namespace.)

### Enumerations
Objective-C supports for-in enumerations on classes that conform to the NSFastEnumeration protocol.
Most of the built-in collections (NSArray, NSSet, ...) conform to this protocol.
In Java you similarly implement the parameterized interface Iterable<T> and use the for-each statement.

It's not possible to modify the enumeration variable
and you're not allowed to mutate collections inside a fast enumeration,
the latter will raise an exception.

### Property Lists
 - ... how do Properly Lists look as compared to the semi-equivalent
   construct in the OTLTYAFW.  (Hint: Think about Java's
   java.util.ResourceBundle and java.util.Properties and the similar
   classes in .Net.  Also think about JSON, if you know it.)

### Blocks
Blocks can be used to pass around functions as variables,
which is useful for callbacks,
running code on a different thread at some point in time,
and appling the same piece of code to every element of a collection.

It's possible to achieve something similar in Java using an anonymous inner class with a rather verbose syntax.
I believe the latest version of Java supports lambdas,
but I haven't used them.