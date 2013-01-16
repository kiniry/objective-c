---------- Foundation framework ---------- The Foundation
framework contains all the core data types used in
Objective-C, which spans from handling of raw data (NSData)
and dates (NSDate) to strings (NSString), arrays (NSArray),
dictionaries (NSDictionary) web requests (NSURLRequest). The
base object of Foundation, which all other objects inherit
from is 'NSObject', just like 'Object' in Java and C#.


---------- Aliasing ---------- Aliasing is when two or more
pointers refer to the same memory location (object).


---------- alloc/init ---------- The alloc init pattern is
the equivalent to constructors in other languages like Java
and C#, i.e. using the 'new' keyword. The NSObject class
method, 'alloc', simply allocates new memory for the object
to be instantiated, including its instance variables. The
'alloc' method returns an anonymous object of type 'id',
which will be explained later. When memory is allocated for
the new object, its instance variables can be instantiated,
either by using the plain 'init' class method, which can set
instance variable to default values, or by using custom
initializers, setting instance variables to specific values.
All 'init' methods should always call its corresponding
super init method. If this fails and returns nil, so should
this object. If not, proper instantiation can be performed.


---------- Class types ----------



---------- Constructors and factories ----------



---------- Copying and cloning ----------



---------- Dynamic typing of pointers ---------- Dynamic
typing


---------- Dynamic typing of ids ----------



---------- Expanded types ----------



---------- Field hiding ----------



---------- Immutability ----------



---------- Inheritance ----------



---------- Logging ---------- Logging in Objective-C is done
with the utility function 'NSLog()' and uses the 'NSString'
formatting scheme with the '%' sign as marker. In Java you
use 'System.out.println()', which does not use any
formatting by default. As goes with 'Console.WriteLine() in
C#. Formatting can be achieved, though, using the static
method 'format()' of the String objects in both languages.


---------- Method overloading ----------



---------- Polymorphismn ----------



---------- NSArray ---------- Found in the Foundation
framework, this object represents an ordered collection of
objects, which is immutable as soon as it is created, i.e.
objects cannot be added or removed - just like other OO
languages. One difference, however, is that the contents of
the array, i.e. the type, cannot be specified like in Java
or C#. An object in an NSArray will always be of type 'id'
when retrieved.


---------- nil ---------- 'nil' is the default value of a
pointer, which does not point to anything, just like
primitive types always default to zero. In fact it is zero
behind the scenes. Therefore it can be tested in an 'if'
statement like a 'BOOL' value, since nil = NO = 0. Sending
messages to a 'nil' value will mostly not result in a crash
- it will just return nil. 'nil' is comparable to the 'null'
literal in Java and C#, which also represents a reference
that does not refer to any object. Thus, one has to be very
aware of this design choice and maybe use introspection to
be completely sure.


---------- Primitive types ----------



---------- Protocols ---------- Protocols are somewhat like
interfaces in other OO languages. They declare an interface
that someone else should implement, thus making those two
objects capable of communication with each other through the
specified protocol. Protocols are mostly used for delegation
and data sourcing (which is basically just a specific form
of delegation), where some object declares a protocol
through which it wishes to communication with a delegate
object. The declaring object then specifies that its
delegate property must implement the protocol using the
angle brackets notation: @property (strong) id
<SomeDeclaredProcol> *delegate;

---------- Singletons ----------



---------- Method resolution ----------



---------- Strong vs. weak ---------- The 'strong' and
'weak' pointers help the Automatic Reference Counting (ARC)
keeping track of retain/release counts. A 'strong' pointer
to an object means that the object should under no
circumstances be released from the heap until the pointer is
set to 'nil' or manually released. A 'weak' pointer means
that the object is only kept in the heap as long as someone
else points strongly to it. If it gets removed from the
heap, the weak pointer is automatically set to 'nil'. Weak
and strong references also exist in garbage collecting
languages like C#. Unless explicitly declaring a 'weak'
reference in C#, all references are strong. A weakly
referenced object in C# can be collected at any time by the
garbage collector, even though there still is a reference to
it. This can for instance be used for big pieces of data,
that should not be unnecessarily allocated in the heap. In
this case, if it has been removed when a new query to the
data occurs, the data is just read into a 'weak' reference
again.


---------- Variance ---------- Returning 'id' loses type
information


---------- Exceptions ----------



---------- Value boxing ---------- Value boxing and unboxing
is very similar to other OO languages. For instance, the
following works just fine in Objective-C:

NoblePerson *yoda = [[NoblePerson alloc] init]; Citizen
*quigon = yoda; // Boxing NoblePerson *obiwan = quigon; //
Unboxing


---------- Introspection ---------- Introspection is the
equivalent of reflection in Java and C#, which allows for an
object to examine itself, i.e. "look inward" as the name
suggests. This means that the type of the object can be
revealed as well as weather the object responds to a certain
selector, like follows:

NoblePerson *yoda = [[NoblePerson alloc] init]; if ([yoda
isKindOfClass:[Citizen class]]) // returns YES

if ([yoda respondsToSelector:@selector(marryToCitizen:)]) //
returns YES


---------- Enumerations ----------



---------- Property lists ---------- Reminiscent of
JavaScript Object Notation (JSON), i.e. a graph of objects,
typically consisting of dictionaries and arrays at the top
levels.


---------- Blocks ---------- A 'block' is simply a block of
code (sequence of statements), which can be assigned to
variables and be passed around as arguments to methods. One
cool feature of blocks is that locally declared variables,
declared before the declaration of the block, can be read
within the block, even though it might be passed into a
different method with a very different scope. The readonly
aspect, however, can be circumvented by using the '__block'
attribute, making the variable read/write from within the
block. Blocks are very reminiscent of lambda expressions in
C# - also regarding to syntax, where '^' declares a blocks
in Objective C and '=>' a lambda expression in C#. Lambdas
in C# are often used to transform so called LINQ
(Language-Integrated Query) statements into equivalent
lambda expressions before performing the actual query.


