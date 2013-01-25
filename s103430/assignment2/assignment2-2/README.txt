/**
 *
 *
 * Assignment 2
 * Created by Joachim Jensen
 *
 */

##########################################
Foundation framework
##########################################

The Foundation framework pretty much contains the same features as java.util/java.lang, 
but there are some main differences.

In Foundation it is specified whether a certain type (for some types) is mutable or immutable, e.g.
NSString/NSMutableString, NSArray/NSMutableArray, where this is not the case in java. In fact, 
to create an immutable array, one has to use a method in the List class. String is immutable, too.

Also, Foundation has some new names for certain primitive types and values, such as BOOL and nil.
As of now, BOOL can be both YES/NO and true/false and nil === null, but if anything changes in the
future for BOOL and nil, their primitive "siblings" will still be there.

##########################################
Aliasing
##########################################


##########################################
Initiation
##########################################

In objective-c there are no real constructors, but rather initiators. A class will automatically contain
an "init" method behind the curtain, but it is possible to add other initiators with specific parameters.

When creating an object, the following pattern is used:
[[Object alloc] init]
[[Object alloc] initSomeMethod:var]
alloc creates a space for the object in the heap while init fills up this space.

This is unlike the normal pattern for creating objects in e.g. Java and PHP. Here, the following is used
instead:

new Object()

Here a constructor is called on the object initiation.

There are some shorthand methods to create an object for a variable in objective c:

[Object object]

###########################################
Classes
###########################################

 - ... how class types are used with those in the OTLTYAFW.


 - ... how copying and cloning of objects works (see NSObject's API)
   as compared to the OTLTYAFW.  (Hint: Deep vs. shallow copies,
   twinning, cloning, mutability of iterations, etc.)

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


######################################
Inheritance
######################################

 - ... how inheritance works as compared to the OTLTYAFW.  (Hint:
   Consider single vs. multiple inheritance and behavioral vs. code
   inheritance.  How does class inheritance work and how does type
   inheritance work?)

######################################
Logging
######################################

NSLog(NSString*);

######################################
Polymorphism and method overloading
######################################

Objective-c is weakly typed, thus a variable does not have to be of a certain type.
To do this, the type "id" is used.

Method overloading is not supported in objective c.

######################################
nil
######################################

In the source of objective-c, it can be seen that nil === null.

Unlike Java and PHP where one gets a NullPointerException or
"Trying to get property of non-object" error when calling a method/
property on a null object, it is entirely possible to send a message
to nil/call a method on a nil object in objective c.

######################################
Primitive, fundamental and immutable types
######################################

Objective c is fully compatible with c and therefore contains all 
primitive types from here, and because java has pretty much borrowed
the same type definitions from c, the following types are much alike in
java and objective-c:

int,float,char,boolean,array

As mentioned, in the Foundation framework mutable and immutable types
are specified directly (normally NS-types are immutable), whereas in java
one has to figure it out by yourself. E.g. one would think that String in java
is mutable, but this is not the case - NSString is not mutable either, but 
obviously NSMutableString is.

NSArray is not mutable like ArrayList in java but acts more like the primitive
array type with some nice features on top. NSMutableArray is more like ArrayList.

######################################
Protocols
######################################

 - ... how do protocols work and how do they compare with the
   semi-equivalent construct in the OTLTYAFW.  (Hint: Consider classes
   that implement multiple protocols and how protocols and class &
   type inheritance work.)

######################################
Singletons
######################################

 - ... how are singletons defined and used as compared with the
   OTLTYAFW.  (Hint: Do the patterns for defining and using singletons
   maps to/from your other language(s)?)

######################################
Method resolution
######################################

 - ... how does (static and dynamic) method resolution work as
   compared to the OTLTYAFW.  (Hint: In Java and C# the compiler knows
   exactly which method will be called, just not which *version* of
   that method will be called at runtime.)

######################################
Pointers
######################################

 - ... how do strong vs. weak pointers work as compared with
   semi-equivalent construct in the OTLTYAFW.  (Hint: Look into
   java.lang.ref and .Net's System.WeakReference if you have never
   done so before.)

######################################
Variance
######################################

 - ... how does variance work as compared with the OTLTYAFW.  (Hint:
   If you have never heard of method covariance, contravariance, and
   invariance, you have some fun reading to do.  E.g., Consider how return
   types in method definitions can change wrt inheritance.)

######################################
Exceptions
######################################

 - ... how do exceptions work as compared with the OTLTYAFW.  (Hint:
   What do method declarations look like with regards to exceptional
   behavior?)

######################################
Value boxing
######################################

 - ... how does value boxing and unboxing work as compared to the
   OTLTYAFW.  (Hint: Note that I did not just say *primitive* value
   boxing.)

######################################
Introspection
######################################

 - ... how introspection in Objective-C compares to built-in support
   for dynamic type checking (e.g., Java's instanceof keyword) and
   reflection in the OTLTYAFW.  (Consider the types id and SEL as
   compared to java.lang.reflect and .Net's reflective types in the
   System namespace.)

######################################
Enumeration
######################################

 - ... how do enumerations work as compared with the OTLTYAFW.  (Hint:
   Compare Objective-C's fast enumerations with those of the
   language(s) you know.  How do immutability and exceptions work with
   regards to enumerations?)

######################################
Properly Lists
######################################

 - ... how do Properly Lists look as compared to the semi-equivalent
   construct in the OTLTYAFW.  (Hint: Think about Java's
   java.util.ResourceBundle and java.util.Properties and the similar
   classes in .Net.  Also think about JSON, if you know it.)

######################################
Blocks
######################################

 - ... how do Blocks compare with the semi-equivalent
   construct in the OTLTYAFW.  (Hint: Think about Java's anonymous
   classes and C#'s lambdas.)