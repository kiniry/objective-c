Assingment 2
============

Foundation framework
----------
The Foundation framework contains all the core data types
used in Objective-C, which spans from handling of raw data
(NSData) and dates (NSDate) to strings (NSString), arrays
(NSArray), dictionaries (NSDictionary) web requests
(NSURLRequest).

The base object of Foundation, which all other objects
inherit from is 'NSObject', just like 'Object' in Java and
C#.


---------- Aliasing ----------
Aliasing is when two or more pointers refer to the same
memory location (object).


---------- alloc/init ----------
The alloc init pattern is the equivalent to constructors in
other languages like Java and C#, i.e. using the 'new'
keyword. The NSObject class method, 'alloc', simply
allocates new memory for the object to be instantiated,
including its instance variables. The 'alloc' method returns
an anonymous object of type 'id', which will be explained
later.
When memory is allocated for the new object, its instance
variables can be instantiated, either by using the plain
'init' class method, which can set instance variable to
default values, or by using custom initializers, setting
instance variables to specific values.
All 'init' methods should always call its corresponding
super init method. If this fails and returns nil, so should
this object. If not, proper instantiation can be performed. 


---------- Constructors and factories ----------
Using the abstract factory pattern for constructing new
instances of objects is quite unique to Objective-C in the
scale of usage.
Using a class method for constructing a new instance of an
object could for example by the old method of constructing
an array:
NSArray *newArray = [NSArray arrayWithObjects:@"Object1",
@"Object", nil];
However, this method has recently been replaced by the
literal @[], but under the hood, the same thing is
happening.
Factory constructors in other OO languages like C# are
mostly used for conversion like bool.TryParse() and
System.Convert.ToBoolean().


---------- Copying and cloning ----------
In C# the ICloneable interface makes it possible to
implement copying and cloning to custom objects.
In Objective-C the correspondent is the NSCopying protocol
from NSObject. This can be implemented in any custom
subclass of NSObject, and defines the method 'copyWithZone'.
All of this, however, is only shallow copying - deep copying
would have to be implemented manually, just like in Java. 


---------- Dynamic typing of ids ----------
Dynamic typing of ids is when a variable point to an object,
whose type is not checked at compile time. For this, the
'id' type is used to indicate dynamic types.
For instance NSArrays only contain objects of type 'id',
i.e. the type of each object is independent of each other
and not checked at compile time. This also means that type
information about the objects is lost, when put into the
array. In this case introspection can be used to check
types.
A laguange like C# is statically typed, but using the
'dynamic' type can give some of the same effects as
Objective-C


---------- Field hiding ----------
In Objective-C field or properties are generally either public or private with nothing in between. At least this design choice pretty much enforces the programmer to think about his model in this way when designing the software.
However, something like a public getter and a private setter can be achieved simply by stating that the public property is 'readonly'. This way, the outside world cannot wirte to it. But internally, the corresponding instance variable is still read/write, which means that the private implementation can indeed write to the property.
In C# one would simply write:
int age { get; private set; }


---------- Immutability ----------
All of the base collection types of the Foundation framework
are immutable, like NSArray and NSDictionary. This means
that obejcts cannot be removed or added after
initialization.
However, their mutable counterparts like NSMutableArray and
NSMutableDictionary all inherit from the immutable
collection types, making the conversion painless.
When 'giving away' a mutable object (as being a public
property) good practice is to return a copy of the internal
mutable abject in order not to risk any data getting
overriden from the outside:

return [someMutableArray copy];

Or if an ordinary array is to be returned in a mutable form:

return [someImmutableArray mutableCopy];


---------- Logging ----------
Logging in Objective-C is done with the utility function
'NSLog()' and uses the 'NSString' formatting scheme with the
'%' sign as marker.
In Java you use 'System.out.println()', which does not use
any formatting by default. As goes with 'Console.WriteLine()
in C#.
Formatting can be achieved, though, using the static method
'format()' of the String objects in both languages.


---------- Method overloading ----------
Method overloading does not work in the same way as many
other OO languages.
For instance in C# the same method can be overloaded in the
following way:

public static string AppendToString(string originalString,
string something) { }
public static string AppendToString(string originalString,
int something) { }

However, in Objective-C one cannot have the method
declarations:

+ (NSString)appendToString:(NSString *)originalString
something:(NSString *)something;
+ (NSString)appendToString:(NSString *)originalString
something:(int)something;

This would give a 'Duplicate declaration of method:
appendToString

Instead different signatures should be used:

+ (NSString)appendToString:(NSString *)originalString
anotherString:(NSString *)something;
+ (NSString)appendToString:(NSString *)originalString
anInteger:(int)something;


---------- NSArray ----------
Found in the Foundation framework, this object represents an
ordered collection of objects, which is immutable as soon as
it is created, i.e. objects cannot be added or removed -
just like other OO languages.
One difference, however, is that the contents of the array,
i.e. the type, cannot be specified like in Java or C#. An
object in an NSArray will always be of type 'id' when
retrieved.


---------- nil ----------
'nil' is the default value of a pointer, which does not
point to anything, just like primitive types always default
to zero. In fact it is zero behind the scenes. Therefore it
can be tested in an 'if' statement like a 'BOOL' value,
since nil = NO = 0.
Sending messages to a 'nil' value will mostly not result in
a crash - it will just return nil.
'nil' is comparable to the 'null' literal in Java and C#,
which also represents a reference that does not refer to any
object. Thus, one has to be very aware of this design choice
and maybe use introspection to be completely sure.


---------- Primitive types ----------
Objective-C contains signed and unsigned versions of the
following primitives - all of which can be contained in
NSNumber:
BOOL, char, double, float, int, long, short.

Just like in Java, String is not a primitive type, but an
object (NSString).


---------- Protocols ----------
Protocols are somewhat like interfaces in other OO
languages. They declare an interface that someone else
should implement, thus making those two objects capable of
communication with each other through the specified
protocol.
Protocols are mostly used for delegation and data sourcing
(which is basically just a specific form of delegation),
where some object declares a protocol through which it
wishes to communication with a delegate object. The
declaring object then specifies that its delegate property
must implement the protocol using the angle brackets
notation:

@property (strong) id <SomeDeclaredProcol> *delegate;


---------- Singletons ----------
Singeltons in Objective-C are very similar to other OO
languages. An example implementation in Objective-C could
be:

+ (MySingleton *)sharedSingleton;

+ (MySingleton *)sharedSingleton
{
	static MySingleton *sharedSingleton;

	@synchronized(self)
	{
		if (!sharedSingleton)
			sharedSingleton = [[MySingleton alloc] init];

		return sharedSingleton;
	}
}

Source: http://stackoverflow.com/a/145164/746968


---------- Strong vs. weak ----------
The 'strong' and 'weak' pointers help the Automatic
Reference Counting (ARC) keeping track of retain/release
counts. 
A 'strong' pointer to an object means that the object should
under no circumstances be released from the heap until the
pointer is set to 'nil' or manually released.
A 'weak' pointer means that the object is only kept in the
heap as long as someone else points strongly to it. If it
gets removed from the heap, the weak pointer is
automatically set to 'nil'.
Weak and strong references also exist in garbage collecting
languages like C#. Unless explicitly declaring a 'weak'
reference in C#, all references are strong. A weakly
referenced object in C# can be collected at any time by the
garbage collector, even though there still is a reference to
it. This can for instance be used for big pieces of data,
that should not be unnecessarily allocated in the heap. In
this case, if it has been removed when a new query to the
data occurs, the data is just read into a 'weak' reference
again.


---------- Variance ----------
Returning 'id' loses type information


---------- Exceptions ----------
Exceptions are not as commonly used in Objective-C as in
other OO languages. Lanuguages like Java and C# very much
uses the concept of throwing exceptions in library methods,
forcing the upper layers of the execution to handle
(try/catch) these exceptions.
They are used in Objective-C, however, but mostly when the
program has reached a very bad state. Exceptions can be
thrown in two ways:

[NSException raise:@"Some exception description"];

NSException* exception = [NSException
        exceptionWithName:@"InternalInconsistencyException"
        reason:@"Something went completely wrong"
        userInfo:nil];
@throw exception;

The 'try/catch' also excists, but is rarely used:

@try {
	...
}
@catch(Exception ex){
	...
}
@finally{
	...
}


---------- Value boxing ----------
Value boxing and unboxing is very similar to other OO
languages.
For instance, the following works just fine in Objective-C:

NoblePerson *yoda = [[NoblePerson alloc] init];
Citizen *quigon = yoda; // Boxing
NoblePerson *obiwan = quigon; // Unboxing


---------- Introspection ----------
Introspection is the equivalent of reflection in Java and
C#, which allows for an object to examine itself, i.e. "look
inward" as the name suggests. This means that the type of
the object can be revealed as well as weather the object
responds to a certain selector, like follows:

NoblePerson *yoda = [[NoblePerson alloc] init];
if ([yoda isKindOfClass:[Citizen class]]) // returns YES

if ([yoda respondsToSelector:@selector(marryToCitizen:)]) //
returns YES


---------- Enumerations ----------
There are two types of enumeration in Objective-C:

Normal looping:
for (int i = 0; i < someArray.count; i++) {
	id someObject = someArray[i];
	// Do something with someObject
}

Fast enumeration:
for (id someObject in someArray) {
	// Do something with someObject
}

The fast enumeration only works for collections conforming
to the NSFastEnumeration protocol.

The above procedures are the same in other OO languages, but
not performance wise. Fast enumeration is indeed faster in
Objective-C than ordinary looping, while it would cause
overhead in many other OO languages.


---------- Property lists ----------
Reminiscent of JavaScript Object Notation (JSON), i.e. a
graph of objects, typically consisting of dictionaries and
arrays at the top levels.


---------- Blocks ----------
A 'block' is simply a block of code (sequence of
statements), which can be assigned to variables and be
passed around as arguments to methods.
One cool feature of blocks is that locally declared
variables, declared before the declaration of the block, can
be read within the block, even though it might be passed
into a different method with a very different scope. The
readonly aspect, however, can be circumvented by using the
'__block' attribute, making the variable read/write from
within the block.
Blocks are very reminiscent of lambda expressions in C# -
also regarding to syntax, where '^' declares a blocks in
Objective C and '=>' a lambda expression in C#.
Lambdas in C# are often used to transform so called LINQ
(Language-Integrated Query) statements into equivalent
lambda expressions before performing the actual query.


