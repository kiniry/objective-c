Assignment 3
Some of the "Civil Service" method implementations from assignment 2.1 has been rewritten using the three approaches defensive programming, logging and assertions.
To show these different approaches three new classes has been implemented. In all three techniques certain constraints are tested.

Defensive programming
When using defensive programming exceptions are thrown when certain constraints are not met. See CitizenDefensive.m for implementation details.

Logging
The logging technique is the simplest of the three. When the pre- or postconditions fail appropriate messages are written to the log. See CitizenLogging.m for implementation details. 

Assertions
Again the pre- and postconditions are tested. This time using the NSAssert objects. Again see CitizenAssertion.m for implementation details.

GCC
Compiling with GCC was not possible. I'm using a lot of the new features introduced in Xcode 4.4 such as ARC, autoreleasepool. GCC doesnt support these and in order to use GCC I would have to rewrite the program and take care of all the memory management. If I were to rewrite the program it could be compiled using GCC with the following command:
gcc -framework Foundation main.m -o prog
