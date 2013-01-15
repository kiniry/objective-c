2013-01-14, Søren Olofsson, s093030

INTRODUCTION:

Of all the given questions, some are used in code samples which
are documented and located in the Experiments folder.
The questions which are not related to any code samples are solely
elaborated on here.

Before reading this document it should be noted that before this course
I have never looked at or done anything with Objective-C.
My background knowledge of object oriented programming include the
following languages: Java, C#, F#, VBA, Javascript, Typescript.
I am on the second semester of my master in Computer Science.

Comparisons between languages in this document will mainly involve C#.

REFLECTIONS:

---------- Foundation framework ----------
The core classes in the Foundation framework which I am familiar
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

Also it seems like many of the classes (which are not named mutable) are
immutable. You can of course always change what the object references
refer to but you cannot change the actual string that a NSString instance
represent.

---------- Aliasing ----------

---------- Alloc/init pattern ----------
In Objective-C object instantiation are made by first allocating memory
for an object and then initializing it. E.g.
NoblePerson *god = [[NoblePerson alloc] init];
alloc returns an instance of NoblePerson and so does init, which means that
the one-liner could have been expanded into two lines:

NoblePerson *god = [NoblePerson alloc];
god = [god init]; // Or just: [god init];

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

---------- Dynamic typing of pointers ----------

---------- Dynamic typing of ids ----------

---------- Expanded Types ----------

---------- Field hiding, shadowing and overriding ----------
It is possible to hide/redefine properties by declaring
an interface with a (possibly empty) category inside the .m file that
represents the corresponding interface implementation.
Normally it is not considered good practice but it can be useful to
implement for example a public getter and a private setter. This is 
shown in the Citizen.m file with the spouse having a public getter
and private setter. This is because we want anyone to be able to ask
a Citizen what its current spouse is but we only want to change the spouse
in a certain way from the outside (i.e. through the marry and divorce
methods). The Citizen class however needs to change the spouse
property internally which means that we need to allow a private setter.

When it comes to public getter and private setter in C# it is a bit easier
because we do not need to use field hiding, and we can just type:
string myProperty { get; private set; }
to achieve the same thing.

When it comes to shadowing in C# the new keyword can be used (again)
(notice it is not only an operator to make new objects but can also be
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

Console.WriteLine(a.Hello()); // Prints Hello A
Console.WriteLine(a.Hi()); // Prints Hi A
Console.WriteLine(b.Hello()); // output Hello B
Console.WriteLine(b.Hi()); // Prints Hi B

// The following prints Hello A, which is kinda suprising
Console.WriteLine(((A)b).Hello());

Console.WriteLine(((A)b).Hi()); // Prints Hi B

Shadowing in Objective-C however is not really possible because the type
does not matter, i.e. the messages are handled dynamically at run-time.
This means that the compiler does not really care about the kind of object
which a message is sent to, it just tries to sent that message to the
object. This means that if a subclass reimplements a method, a message to
the subclass will invoke that method instead of the superclass' method
- no matter if the subclass is casted into the superclass or not.
This is because in Objective-C the overriding of properties/methods happen
automatically in subclasses which declare a property of the same name
and type. See for example the method -(BOOL) marry:(Citizen*) fiancee
in the  NoblePerson.m file.

Operator overloading is not possible either in Objective C.

---------- Immutability ----------
Immutability is often used in context with array properties. Best practice
is to use a mutable array internally of a class and then when "outsiders"
ask for the array they are given a mutable copy.

---------- Inheritance ----------


---------- Logging ----------
The Foundation framework has NSLog-method which prints debug messages to
the console. It corresponds to C#'s System.Diagnostics.Debug.WriteLine-, 
System.Console.WriteLine-, and Javascript's console.log-method.
Usually however frameworks like log4net is used in larger C# applications.
This framework provides scalability, configurability and thread safety.

---------- Polymorphism ----------

Polymorphism can be several things.

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
NSArray (and NSMutableArray) differs a lot from other strongly typed languages because 
they can contain mixed types of objects. This is for exampled utilized in
Paul Hegarty's Calculator example.
Usually this is not allowed in for example C#'s List. This is usually
ensured by utilizing generic parameterized types, e.g.
List<string> listOfStrings = new List<string>();

C# however also has an ArrayList class which can do this. Furthermore
the type safety of List can be "broken" by just declaring a List<object>
type.

In Javascript which is also object-oriented (some argue it is not, but
that is another discussion), arrays can also contain different kinds of
objects:
var myArray = new Array();
myArray.push({ foo: 'bar' });
myArray.push(1337);

In this way it becomes the responsibility of the programmer rather than 
the language to ensure the types of objects that is put into the array.

---------- Primitive types ----------

---------- Protocols ----------

---------- Singletons ----------

---------- Strong vs weak pointers ----------
Automatic Reference Counting (ARC) was a feature introduced in 2011 by 
Apple. It is supported by  Xcode 4.2 or later,
Mac OS X 10.6 Snow Leopard or later, and iOS 4.0 or later.

It is a memory management system which makes concepts such as
retain, release, retainCount, autorelease, or dealloc deprecated.

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
to the parent which you then give up, the OS would automatically destroy
the children also because there is no strong reference chain to them.

---------- Variance ----------

---------- Exceptions ----------

---------- Boxing ----------

---------- Introspection ----------

---------- Enumeration ----------

---------- Property lists ----------

---------- Blocks ----------