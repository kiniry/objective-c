/**
 *
 * Assignment 4 
 * Created by Joachim Jensen
 *
 **/

############################
String manipulation
############################

Tests of heavy string concatination has been carried out using first NSString and then NSMutableString to compare their speed and memory.

For NSString, the test used a _total_ of 291mb memory and took 4.5s.

For NSMutableString, the test used a _total_ of 2mb memory and took 200ms.

Because NSString is not mutable, i.e. it cannot be altered when set, a new "dummy" object has to be created every time it has to be concatinated. Creating objects is time consuming which explains the high values in the test.

NSMutableString is by far superior in the test.

############################
Recursion
############################

In the test, a recursive method was called a high number of times. Recursion itself seemed not to be costly, but initiating a lot of variables could be because these are stored in the stack (except objects which are all stored in the heap). The stack is as "deep" as supported by the platform.

############################
Heap trashing and thrashing
############################

It is possible to trash and thrash the heap, but with ARC it is not recommended (might not even be possible?). Because all objects are stored in the heap, thrashing it could lead to unexpected behaviour of these.

############################
Method invocation costs
############################

In objective-c, method "addresses" are found in runtime and not in compiletime. Method resolution is dynamic-

 * method invocation costs
   How expensive is it to dynamically invoke a selector?  A class
   selector?  Invocation via NSObject's reflection/introspection
   methods?


############################
Enumerations and iteration
############################

In objective-c, (at least) three styles of iterations exist. The traditional for-loop (indexing), a foreach-loop (enumeration) and the special enumerateObjectsUsingBlock (enumeration).

In the test, a large NSArray containing NSIntegers is run through.

The traditional for-loop is the slowest, then enumerateObjectsUsingBlock and finally foreach is the fastest.

All three styles use the same _total_ of memory.

############################
Foundation's classes
############################

 * Foundation's classes
   What are the memory and computation complexities of the key methods
   of core classes in the Foundation framework?

############################
Blocks
############################

 * blocks
   How costly are blocks?  Does the size of the block or the number of
   variables bound by the block, declared within the block, or used
   from the block, matter?  Does the type of such bound and free
   variables matter?

############################
Protocols
############################

 * protocols
   How costly are protocols?  Does the size of the protocol or the
   number of protocols that a class implements matter?