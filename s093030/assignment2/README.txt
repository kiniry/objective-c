2013-01-14, Søren Olofsson, s093030

INTRODUCTION:

Of all the given questions, some are used in code samples which
are documented and located in the Experiments folder.
The questions which are not related to any code samples are solely
elaborated on here.

Before reading this document it should be noted that before this course
I have never looked at or done anything with Objective-C.
My background knowledge of object oriented programming includes the
following languages: Java, C#, F#, VBA, Javascript, Typescript.
I am on the second semester of my master in Computer Science.

Comparisons between languages in this document will mainly involve C#
and Javascript.

REFLECTIONS:

---------- Foundation framework ----------
The core classes in the Foundation framework which I am familiar with
include NSString, NSArray, NSNumber, NSObject, NSMutableArray.

The most common design idiom in the Foundation framework is the abstract
factory design pattern where class methods are used to instantiate new
instances.
E.g.
// Create a new float value and store it in the wrapper object NSNumber
NSNumber *myNumber = [NSNumber numberWithFloat: 5.7]; 
// Create a new empty mutable array
NSMutableArray *myArray = [NSMutableArray array];
// Create a new immutable array
NSArray *myArray = @[@1, @2, @3, @"This is a string"];
// Create a new string
NSString *myString = @"This is a string";

Also it seems like many of the classes (except those named mutable) are
immutable. You can of course always change what an object reference
refers to but you cannot modify the actual string that a NSString instance
represents.

---------- Aliasing ----------
We use the following definition of aliasing: "One pointer is said to alias
another pointer when both refer to the same location or object:"

---------- Alloc/init pattern ----------
In Objective-C object instantiation are made by first allocating memory
for an object and then initializing it. E.g.
NoblePerson *god = [[NoblePerson alloc] init];
alloc returns an instance of NoblePerson and so does init, which means that
the one-liner could have been expanded into two lines:

NoblePerson *god = [NoblePerson alloc];
god = [god init]; // Or just: [god init];

It is possible however to shorten it further just by using the new-keyword:
NoblePerson *god = [NoblePerson new];

In this way however it is not possible to use custom initializers.

The corresponding pattern in C# is pretty much the same but the syntax
cannot be spread into multiple lines. In C# the above would be
NoblePerson god = new NoblePerson();

The new operator does essentially the same as alloc and init: it allocates
memory on the heap for the object and invokes the constructor.

In order to "overload the constructor", one just creates another method in
Objective-C which also has to the invoke the super class' init method
first, e.g.

-(id) initWithMother:(Citizen*) mother andFather:(Citizen*) father andSex:(BOOL) sex
{
    if (self = [super init])
    {
        ...
    }
    return self;
}

In C# it is also just a matter of creating another constructor:
e.g. NoblePerson(string name) { ... }

---------- Class types ----------
Class types in Objective-C must always adhere to an interface. This is a little
different than for example C#. To use a class type one only has to include the
header file (.h) file and not necessarily the implementation (.m) file. For design
purposes this is a rather good approach but it can sometimes also become
quite tedious as every single class requires an interface.

---------- Constructors and factories ----------
Another substantial difference between C# and Objective-C is the
use of the abstract factory pattern, which is not as much used
in C# as it is in Objective-C.

It is mostly used in C# when it comes to conversion methods,
which are either implemented as static utility methods like
int.TryParse(string s, out int result) or located in the
System.Convert class like System.Convert.ToBoolean with its 17 overloads.

In Objective-C however, factory methods are also used for basic
initialization like [NSNumber numberWithFloat: 5.7]. However, it seems like
that the factory pattern is mostly used for more simple types (int, array, etc.)
whereas homemade objects and the like uses the init alloc pattern
explained above.

---------- Copying and cloning of objects ----------
The NSCopying protocol makes it possible to perform deep copying of objects.
Classes from the Foundation Framework usually implement this protocol by
implementing the method -(id) copyWithZone: (NSZone *) zone;
In custom objects implementing the copyWithZone one has to perform a manual
property-by-property copy.
The actual copying is then done by invoking copy or mutableCopy. E.g.

NSString *myStringA = @"This is a string";
NSString *myStringB;
myStringB = [myStringA mutableCopy];

In custom objects that has properties of other custom types there are two
options:
- The other custom types also have to implement the NSCopying protocol.
The object being copied should then also call copy on its properties of custom
types.
- Or the "top object" could just instantiate new instances and set the
cloned object's properties of custom types to these new instances.

The first case, however, seems to be preferred because it is easier if
each object in the object graph, which is to be copied, is responsible of
copying itself.

C# has the exact same pattern with the ICloneable interface.

Another easy approach however is to serialize and then deserialize objects, this
however, can introduce a small performance overhead and requires objects
to be serializable. If, however, the objects are serializable and very
complex it might be worth it, instead of writing manual copy routines.

In Javascript you can also do JSON serialization and deserialization in order
to deep clone objects like this:

obj = JSON.decode(JSON.encode(o));

The preferred way however is to use implement a copy routing yourself or use 
a Javascript library like jQuery and then use either of the following:

// Shallow copy
var newObject = $.extend({}, oldObject);

// Deep copy
var newObject = $.extend(true, {}, oldObject);

The deep copy library function performs a recursive copy of the entire 
object graph passed in.

---------- Dynamic typing of pointers ----------


---------- Dynamic typing of ids ----------
First a definition from the Apple Cocoa inline documentation:
"A variable is dynamically typed when the type of the object it points
to is not checked at compile time. Objective-C uses the id data type to
represent a variable that is an object without specifying what sort of
object it is. This is referred to as dynamic typing."

Type information is lost when you loop through an array, either the 
standard way or by using fast enumeration:

for (id item in myArray)
{
    [item namedMethodCallIsNotGuaranteedToWorkWithoutTypeCast];
}

for (index = 0; index < myArray.count; index++) {
    id item = [myArray objectAtIndex:index];
    [item namedMethodCallIsNotGuaranteedToWorkWithoutTypeCast];
}

In these cases a type cast would be necessary in order to ensure that named
methods are invoked on the proper object because an NSArray can hold objects
of mixed type. For example the isKindOfClass-method could be used to make
sure that objects are type-casted properly. The method calls above will
not fail with an exception, however. An example of method resolution is
provided in the ExperimentMethodResolution.m file.

In Javascript everything is dynamically typed as opposed to C# which
is (mostly) statically typed. If method resolution in Javascript fails
however an exception is thrown and the execution context is halted. As a
note here, there is a new type called dynamic which was introduced in
C# 4.0 which is actually dynamically typed:

dynamic d = new object();
d.SomeMethodWhichDoesNotExist();

The above method-call to SomeMethodWhichDoesNotExist will cause a run-time
exception but not a compile-time error. Type information is obviously
not present when working with dynamics. Dynamics are heavily used in the
MVC 4 Framework to pass information from Controllers to Views via the
Viewbag-object which encapsulates a dictionary which was previously used in
the MVC 3 Framework.

It should be noted that there also exists an implicit var type which is however
strongly typed. The type is determined by the compiler using type inference.

---------- Expanded Types ----------

---------- Field hiding, shadowing and overriding ----------
It is possible to hide/redefine properties by declaring
an interface with a (possibly empty) category inside the .m file that
represents the corresponding interface implementation.
Normally it is not considered good practice but it can be useful to
implement for example a public getter and a private setter. This is 
shown in the Citizen.m file with the spouse having a public getter
and private setter. This is because we want anyone to be able to ask
a Citizen what its current spouse is, but we only want to change the spouse
in a certain way from "the outside" (i.e. through the marry and divorce
methods). The Citizen class however needs to change the spouse
property internally, which means that we need to allow a private setter.
This is in order to prevent us from accessing the instance variable directly
from other methods than the getter and setter as mentioned by Paul Hegarty.

When it comes to public getter and private setter in C# it is a bit easier
because we do not need to use field hiding, and we can just type:

string myProperty { get; private set; }

to achieve the same thing.

When it comes to shadowing in C# the new keyword can be used (again!
Notice it is not only an operator to make new objects but can also be
used as a modifier to shadow properties). To override properties the
override keyword is used.

It should be noted that the above description of redefining an interface
in Objective-C is just "hiding" the setter. This is not shadowing in the
real sense. If a subclass in C# shadows a property and the subclass is
being casted into its superclass and then the method which the subclass
has shadowed is invoked, it will actually invoke the super class method.
This means that the type does matter in C#. An example is:

class A
{
   public string Hello(){ return "Hello A";}
   public virtual string Hi(){return "Hi A";}
}
class B : A
{
   public new string Hello() { return "Hello B"; } // Shadowing method
   public override string Hi() { return "Hi B"; } // Overriding method
}

A a = new A();
B b = new B();

Console.WriteLine(a.Hello()); 		// Prints Hello A
Console.WriteLine(a.Hi()); 			// Prints Hi A
Console.WriteLine(b.Hello()); 		// Prints Hello B
Console.WriteLine(b.Hi()); 			// Prints Hi B

// The following prints Hello A as a result of shadowing.
// This is kinda suprising because b is really an instance
// of B and not A
Console.WriteLine(((A)b).Hello());

// The following prints Hi B as a result of overriding
// This is more intuitive than the shadowing behaviour
Console.WriteLine(((A)b).Hi());

Shadowing in Objective-C however is not really possible because the type
does not matter, i.e. the messages are handled dynamically at run-time.
This means that the compiler does not really care about the kind of object
which a message is sent to, it just tries to sent that message to the
object. This means that if a subclass reimplements a method, a message to
the subclass will invoke that method instead of the superclass' method
- no matter if the subclass is casted into the superclass or not.
This is because in Objective-C the overriding of properties/methods happen
automatically in subclasses which declare a property of the same name
and type. See for example the method -(BOOL) marry:(Citizen*) fiancée
in the NoblePerson.m file.

Operator overloading is not possible either in Objective C.

---------- Immutability ----------
Immutability is often used in context with array properties. Best practice
is to use a mutable array internally of a class and then when "outsiders"
ask for the array they are given a mutable copy.

Simple types are always immutable.

---------- Inheritance ----------
Inheritance in Objective-C works a little different when it comes to the
declaration, since inheritance is declared in the header file and not in
the implementation file. Examples of inheritance is given in the Citizen
and NoblePerson header files.

An important note is that if a class wants to invoke a class method it
can do so in two ways:

[[self class] myMethod];

or

[ClassType myMethod];

The subtle difference is that the former approach supports inheritance,
i.e. a subclass will have its implementation of myMethod invoked.
The latter approach will always invoke the class method on ClassType
disregarding any subtypes implementation.

---------- Logging ----------
The Foundation framework has a NSLog-method which prints debug messages to
the console. It corresponds to C#'s System.Diagnostics.Debug.WriteLine-, 
System.Console.WriteLine-, and Javascript's console.log-method.
Usually however frameworks like log4net is used in larger C# applications.
This framework provides scalability, configurability and thread safety.

---------- Polymorphism ----------

Polymorphism can be several things:

Ad-hoc polymorphism or overloading is used to describe the ability
to use the same syntax for different types. E.g. + for strings means
concatenation whereas + for integers means addition in Javascript and C#.
This is not possible in Objective C however.

Parametric polymorphism is a concept which allows a function or data type
to be written generically, thus also referred to as generics in for example
C#. This is not supported by Objective-C

Subtype polymorphism is a concept which follows the Liskov substitution principle,
e.g. a function that accepts a Citizen can also accept a NoblePerson.
This is supported by Objective-C (and most other OOP-languages).

---------- NSArray ----------
NSArray (and NSMutableArray) differs a lot from other strongly typed languages
because they can contain mixed types of objects. This is for exampled utilized
in Paul Hegarty's Calculator example.
Usually this is not allowed in for example C#'s List. This is usually ensured by
utilizing generic parametrized types, e.g.

List<string> listOfStrings = new List<string>();

C# however also has an ArrayList class which can do this. Furthermore
the type safety of List can be "broken" by just declaring a List<object>
variable.

In Javascript which is also object-oriented (some argue it is not, but
that is another discussion), arrays can also contain different kinds of
objects:

var myArray = new Array();
myArray.push({ foo: 'bar' });
myArray.push(1337);

In this way it becomes the responsibility of the programmer rather than 
the language to ensure the types of objects that is put into the array.

---------- Primitive types ----------
The primitive types in Objective-C include the following:
char, double, float, int, long, short, BOOL (scalar type). Plus all their
unsigned variants. NSNumber can hold any of these types.

Like most languages string is not a primitive type. That is, you can have
char* (which points to an array of characters, which is logically a
"string") in Objective-C, but it is not the same as NSString *someThing
which is a pointer to an object. You can however get the char* by invoking:
NSString *foo = @"This is a string";
const char *bar = [foo UTF8String];

As a comparison the primitive types in C# are pretty much the same:
Boolean, Byte, SByte, Int16, UInt16, Int32, UInt32, Int64, UInt64,
IntPtr, UIntPtr, Char, Double, and Single.
Source:
http://msdn.microsoft.com/en-us/library/system.type.isprimitive.aspx

---------- Protocols ----------
Protocols allow static typing on "unknown objects" using the dynamic id
type. This is done by defining that an object conforms to a protocol
using the following syntax:

id <Foo> obj = [[MyClass alloc] init];

where Foo is a protocol.
A protocol is declared in a header file using the following syntax:

@protocol Foo<Other, NSObject>
-(void)doSomething;
@optional
... // Everything here is optional
@required
... // Everything here is required
@property (nonatomic, strong) NSString *fooProp;
@end

For an example, see the ExperimentProtocol.m and .h files.

---------- Singletons ----------
Singletons in Objective-C and C# are pretty much the same. In C# the class
would expose a single static method (usually called Instance), which returns
an instance of the class. This instance could either be lazy instantiated
(probably preferred) or created in a static constructor. In Objective-C the
pattern using lazy instantiation would look like this:

static MyGlobalSingletonClass *gInstance;

+(MyGlobalSingletonClass *)instance
{
    @synchronized(self)
    {
        if (!gInstance) gInstance = [[self alloc] init];
    }

    return gInstance;
}

---------- Strong vs weak pointers ----------
Automatic Reference Counting (ARC) was a feature introduced in 2011 by 
Apple. It is supported by  Xcode 4.2 or later, Mac OS X 10.6 Snow Leopard
or later, and iOS 4.0 or later.

It is a memory management system which makes concepts such as
retain, release, retainCount, autorelease, or dealloc kinda deprecated.

Instead it has introduced the strong and weak keywords.

A strong reference (defaults) creates an owner relationship and
prevents an object from being deallocated. This implies that
it is retained for the lifetime of its current scope.

A weak reference does not create an owner relationship and means
that the object should only live on as long as at least on other object
holds a strong reference to it. It is used to avoid retain cycles in for
example parent/child relationships. In this case you would want the parent
to have a strong relationship to the children and the children to have
a weak relationship to their parent. Assuming you have a strong reference
to the parent from you program, and you then give up this reference, the
OS would automatically destroy the children also because there is no strong
reference chain to them.

---------- Variance ----------
First some definitions:
- Covariance is about converting from a smaller type to a larger type.
- Contravariance is about converting from a general type to a smaller type.

This can effect return types in derived subclasses if they inherit from a
class but then override a method but change the return type to a subtype
of the type that the super class' method returns.

For an example of this effect on return types see the ExperimentVariance.m
file in the Experiments folder.

---------- Exceptions ----------
Exceptions can be thrown in two ways:

[NSException raise:@"Invalid value"];

NSException* e = [NSException
        exceptionWithName:@"IndexOutOfBoundsException"
        reason:@"You went out of bounds"
        userInfo:nil];
@throw e;

They are handled the following way:
@try {
	...
}
@catch(ExceptionTypeA e){
	...
}
@finally{
	...
}

Throwing exceptions are strongly discouraged in Objective-C as they are likely
to cause memory leaks. This is because they bypass ARC. Instead the documentation
states that: "You should not use exceptions for general flow-control, or simply to
signify errors. Instead you should use the return value of a method or
function to indicate that an error has occurred, and provide information
about the problem in an error object."

A difference to Java (but a similarity to C#) is that Objective-C does
not use the throws keyword in method declarations if a method is likely to
throw an exception. This makes sense since exceptions in general are
discouraged as opposed to Java and C#.

---------- Boxing ----------
Value boxing and unboxing works alot the same way in Objective-C as C#.
As an example you can do:

NoblePerson *god = [[NoblePerson alloc] init];
Citizen *cain = god; // Boxing
NoblePerson *abel = (NoblePerson*) cain; // Unboxing

---------- Introspection ----------
Objective-C provided two methods of NSObject to perform dynamic type
checking:

- isKindOfClass: returns true if the receiver is an instance or subclass
of the specified class.
- isMemberOfClass: returns true if the receiver is an instance of the
specified class. This excludes subclasses.

In C# there are the corresponding two methods:
- The is-operator which corresponds exactly to isKindOfClass.
- The typeof-operator which corresponds exactly to isMemberOfClass.

These introspection methods can be used to make sure that a typecast
of dynamic types to static types will succeed in order to achieve strong
typing.

---------- Enumeration ----------
Enumeration of arrays can be done in two ways:

// Fast enumeration feature of Objective-C 2.0
for (id item in myArray)
{
}
// Normal looping
for (index = 0; index < myArray.count; index++) {
    id item = [myArray objectAtIndex:index];
}

For the fast enumeration to work, the collection has to conform to the
NSFastEnumeration protocol. The technique basically uses pointer arithmetic
to loop through the collection.

A "Collection was mutated while being enumerated"-exception will be thrown
if one tries to change a collection that is being enumerated.

This behaviour is the same in C#.

Performance-wise the comparison to C# is different. One might think that
a foreach loop is comparable to fast enumeration and the for loops are
the same. Actually it is the opposite performance-wise. When the C#
foreach loop is compiled to Intermediate Language (IL) code the foreach 
loop uses some extra instructions thus resulting in a little performance
over-head.

---------- Property lists ----------

---------- Blocks ----------
Blocks are directly comparable to C# lambdas, i.e. they are anonymous
methods which can be stored in a variable and passed around as a parameter
to other functions. Their parameter list is strongly typed.

When using blocks one should make sure not create memory cycles, where
the block has a strong reference to the instance containing the block.
The cycle can occur because the containing class also has a strong
reference to the block, which it contains.

As in C#, blocks are usually used to map on to collections by enumerating
the collection and invoke the block on each element. Also they are used as
delegates.

See the ExperimentBlocks.m file for an example using blocks.