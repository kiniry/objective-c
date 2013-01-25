Assignment 3
--------

Defensive (NSException)
----
It is encouraged by Apple, to reserve NSExceptions for programming errors and unexpected runtime errors, e.g. out-of-bounds collection access and such. It is often used in APIs to indicate invalid arguments. Therefore it is not so custom to handle a lot of exceptions in your code as exceptions often is a sign of misuse of methods and these problems is usually to be taken care of when creating a program rather than at runtime.
In Java the equivalent to NSException is unchecked exceptions e.g. RuntimeException and Error and their subclasses. 
For errors that are expected to happen during runtime, it is encouraged to use NSError. Examples of such errors are file system errors and network errors ect. This is not to be confused with Java Error class (which is an unchecked exception), but can be compared to Java's checked classes.
It is preferred to return NO or nil when an error occur and then provide an optionally NSError object to describe the error.

Assertion (NSAssert)
----
Assertions are very handy to make sanity checks on input arguments (on own methods), checking pre/post conditions, assumptions and more. NSAssert gives a descriptive line of code, with a condition and a string describing what a fail indicates. This makes the source code very easy to read, but also makes it very easy to understand why an assert failed when debugging. NSAssert will throw an exceptions when failing, but it is not very common to catch these exceptions. In Objective-C assertions can optionally be excluded when building the final program, and in this way only be used as a debugging tool when developing. Alternatively Assertions can be included in a final program for termination of the program if any assertions fails. Leaving assertions in production code can be useful if you want your program to fail if assertions does not hold true. An example could be stateless programs running on a server, here you want to terminate if something goes wrong and make the client ask again. On a phone crashes is not appreciated, instead catching exceptions and errors is preferred to prevent reaching a bad state.
To me assertions seems most useful for debugging applications, and I prefer assertions to exceptions in objective-c for all debug related checks.

Logging (NSLog)
----
Logging errors does not solve an issue but merely gives information to what went wrong. Other means for dealing with errors is therefore necessary. Details of errors after they occurred can be very helpful when fixing bugs after the program is taken in production. This could be on a server or on a clients machine. On servers logging is often used to provide a history of the states the program have been in. This can provide system administrators with helpful information on how well the program is running if it needs more resources ect. Users of consumer products (phones, laptop ect.) often have very little benefit of logs, so for these applications logging would only be for crash reports the user can send to the developer.



