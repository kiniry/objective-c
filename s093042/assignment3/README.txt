Assignment 3 - README.txt - Sivanujann Selliah - s093042 - 16/01/13

Three variants of the Civil Service program are given in the three projects in this directory.

// THE THREE VARIANTS
The three variants focus on different ways of assuring and logging "correct behavior" of a program. One focuses on defensive programming, where every input and output is sanity checked and it is made sure that if something is not right an exception is thrown. Another focuses on logging, where if an input or output is not correct a line describing the error is saved in a log. The last one focuses on setting assertions on inputs and outputs. In addition to checking the input and output (called pre- and post-conditions, respectively), program invariants are also checked, these should however ideally be checked after every action that changes the state of the program.

The pre- and post-conditions and the program invariants implemented are those specified in the BON-specification.

// QUICK GUIDE FOR SWITCHING BETWEEN VARIANTS
It is actually easy to switch between the three variants, when implementing the three different kinds of strategies. The hard part is to make sure that the pre- and post-conditions and the invariants are correct, and conform to what one expects of the program. But after that one can switch between implementations by:

From Assertion to Logging variant:
A 'NSAssert' can be replaced with 'if(_DEBUG && !' and ', ' replaced with ') NSLog('. Add the line '#define _DEBUG true' somewhere in a header file.

From Logging variant to Defensive programming:
Replace 'NSLog' with '@throw [NSException exceptionWithName:@"Precondition does not hold" reason:' and at the end of the string, one has to remember to add the rest of the message that is sent to the factory, i.e. ' userInfo:nil];'. If string formatting was used in 'NSLog's, one should remember to get the formatted string from a 'NSString' object.

The replaced text can be reversed convert to another strategy.

WARNING: One should however still make sure that all the conditions (pre- and post-conditions) and the invariant is still correctly stated!

// REFLECTION ON COMPILING AND PORTABILITY
Compiling the projects were successful using clang and Xcode on Mac.

Compiling the projects using GCC, was not so successful on Mac or Windows, it seems like there are some problems in using the macros used in the projects, and ARC does not seem to be supported in the same way as in clang.

It does not seem like code developed on in Xcode on a Mac is very portable to other environments, because of the additional "features" available on the Mac clang compiler. Or at least some work is needed to port a version from one environment to another.

// REFLECTION ON IMPLEMENTATION
During implementation, the hardest part was to setup the initial conditions pre- and post-, and the invariants. Once these were set up, switching between the three styles were done using the technique shown in the quick guide above. The conditions were of cause verified during the switch to ensure that the proper "meaning" of the conditions were still held.

One issue during implementation was how to make sure that the method 'checkInvariant' was going to be invoked, after every action that would change the state of the program. An issue that kept arising was what to do during initialization, where the invariant were definitely not going to hold, because how can one initialize two people without initializing four other people that are the two first persons' parents?

// REFLECTION ON TESTING
Testing the three variants of the program was pretty straight forward, as long as the conditions and invariants were held. But when e.g. the invariant did not hold because of initialization, the only variant of the program that was able to test the other parts of the program was the logging variant, the other two variants, would throw an exception that would terminate the complete program, this is of cause what is expected, because it does not make sense to continue running a program where the invariants or pre- or post-conditions do not hold.

Making invariants and pre- and post-conditions is actually a good way to start development, this is very similar to test-driven development, this way one can make sure that the program actually does what is intended, one should however be very clear about how the conditions and invariants are stated, so that the program actually does, what was intended.

// REFLECTION ON DEPLOYED APPLICATIONS
Since the conditions and invariants are typically something we want the program should hold at every point of execution, it makes sense that we would like to terminate the program, so an error won't propagate through the rest of the program execution, unless we can get back to a "safe" state of the program, where the conditions and invariants hold.

Logging messages should not be emitted all the time, unless it is for debugging purposes, but logging would be a preferable way to document a error on a deployed application.

Terminating an application that is running on a server (which might be critical), is not a good way to handle errors, because the administrator of the server should get an alert before an unexpected termination is put into action, so that the administrator is able to keep the (critical) system running.

On a desktop, applications that unexpectedly terminates, would annoy the user at some point, this is not very good UX, so this should be handled differently that just terminating the application, maybe one could give the user options to restore to a "safe" state of the program.

One very important issue about unexpected terminations of applications is that one should never write bad data to storage, this would corrupt user data; and recovery is sometimes very hard and expensive!
