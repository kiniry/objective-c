**Instantions** 

init returns "id" type. This is different from both C# and Java, where constructors always implicitly return
static types. Also, allocation is completely hidden (automated) in C#.

The `self` pointer is manually assigned in an initializor. This is sort of an odd feature coming
from most other OO languages where `this`, `me`, or whatever the name, is simply always set and
available. To top it off, you actually return it from the initializor. An funny thing is that from a
static method, the `self` keyword points to the class. *See experiment*.


**Dynamic types** 

This makes you do dynamic language stuff like you can in Python. You can pass
around anything as "id" and the compiler won't complain as long as you only send messages to it that
exists _anywhere_. If you need to, you can cast it, which will crash if not possible however.

Obj-C really is based on these dynamic types, and all the statically typed stuff is "just" compile
time niceties. At run time it doesn't matter if you typed everything as id. A place where this
shines through is the @selector "function". It doesn't accept any types in the argument, just the
full method name.

Another interesting thing is that an objective-c message sent to a "nil" value will just do nothing,
meaning no crash or exceptions, just nothing. This is much different from C#, where, if you where to
call a method on, say, an object received as a parameter in a method, and that object was null,
you'd have to catch an exception or a crash would occur. It makes sense if you think about as
messages sent around. If you dispatch a message and no one recieves it, nothing will happen. On the
other hand if you try to turn a knob on something that does not have that knob, something undefined
will happen.


**Introspection** 

Reflection-like features through `isKindOfClass`, `isMemberOfClass` and `respondsToSelector`. Also
`conformsToProtocol`.

Java has a lot of functionality for reflection (read: not introspection), and can provide all the
information about a class and its members that you want.

Objective-C does not natively provide ways to access list of all methods/ivars/inherited
classes. See https://github.com/mikeash/MAObjCRuntime. However the testing framework SenTestingKit
_does_ do reflection (finding test* methods) somehow.


**Foundation Framework**

The foundation framework generally feels a little bit smaller, as in less features. A thing I miss
from .NET's System is LINQ.

Foundation framework uses a lot of factory methods to instantiate objects, which is nice. In C# you
wouldn't see something like List.NewWithObjects(IEnumerable objects). Even uses a factory method to
raise exceptions.  


**Enumeration**

During fast enumeration an iterator is generated during loop initialization. It is
_not_ safe to modify a mutable set during fast enumeration just as in C# and Java. *See experiment*.


**Immutable types**
In the case of strings, they are immutable as they are in C#. In C# there is the StringBuilder,
which lets you mutably create a string. 

Pros of immutability
 * Thread safe per se - an immutable type cannot be altered and therefore is immune to being
   returned as "half a value" as such thread mess ups.
 * Multiple objects with the same value can reference the same object in the heap. If objects were
   mutable this wouldn't be possible as a change to one would inflict changes to others.
 * Compiler optimizations can be done


**Exception handling**

There's no `throws` keyword in Obj-C like there is in Java. An `NSException` will bubble up until
caught, and if it isn't it will terminate execution. *See experiment*.


**Property Lists**

I don't like the property list format at all. The even-key odd-value principle just does not feel
robust, and is not very keen on the eyes (together with XML by nature having so much excess
text). It does however deserve some credit for it's extreme simplicity. But JSON on the other hand,
does this very cleanly too, still keeping the format very simple and portable.


**Method overloading** 

Due to Objective-C's very dynamic nature you cannot overload methods. Type checking is not performed
during runtime (except when introspecting). This is also one of the reasons that many methods are
very explicitly named including the types they use.

For instance
 
    - (void) doAnOperationOnString:(NSString*)theString andNumber:(NSNumber*)theNumber

has the method name
	
	doAnOperationOnString:andNumber:


**Arrays**

Monomorphic arrays dont exist by nature in Objective-C. You can, however, sort of fake it in an
NSMutableArray, by subclassing it and overriding the object insertion method, in which you then
check for the correct type (which you take in as a parameter during initialization).


**Value boxing**

C# does boxing and unboxing of primitives using the `object` type (and casts back to primitives to
unbox). Since LLVM 4.0 (but only with clang afaik, since gcc complains), object literals can be used
in Obj-C to box values, for instance `@42` to box an `int` to `NSNumber`. 

Normal boxing (without literals) is done through factory methods on the specific type,
e.g. `[NSNumber numberWithInt:42]` to box the answer to life the universe and everything in an
`NSNumber` and use methods like `[NSNumber intValue]` to unbox.

In clang you can also auto-box an array with the literal syntax, such as
`@[@"first", @"second"]` which compiles equally with `[NSArray arrayWithObject:@"first", @"second"]`.


**Blocks**
Blocks work almost just like C#'s lambdas. Lambdas create a closure only if they need to, that is,
if they are referencing local environment members, the generated method will have a reference to the
lexical scope, and if not, they are just plain static methods.

Blocks keep a strong reference to all things they reference outside their own scope, which is
something to look out for, and you want to use the `__weak` keyword where appropriate (if, for
instance you are referencing `self` in the block). 

Another cool feature about blocks is their ability to easily be posted on different threads and thus
executed asynchronously. *See experiment*


**random notes of interest**
Three kinds of dynamism are especially important for object-oriented design:
 * Dynamic typing, waiting until runtime to determine the class of an object
 * Dynamic binding, determining at runtime what method to invoke
 * Dynamic loading, adding new components to a program as it runs

