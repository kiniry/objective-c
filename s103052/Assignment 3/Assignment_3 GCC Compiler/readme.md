Assignment 3 Reflections
========================


The purpose with Assignment 3 is to experiment with three different ways to check preconditions and 
postconditions of the "Civil Service" class program (BON) from Assignment 2.1. 
The three different approaches are Defensive Programming, use of Assertions, and Logging system.

I have so far only used the GCC compiler since I don't have a MAC and haven't been able to get Clang to work in GNUstep.  
Generally, I think the GCC are a fast and good cross compiler and it can be used on all UNIX platforms. The only bad thing
with the GCC compiler is that it doesn't support some of the quick implementation stuff that the newest modern version of Objective-C have.
These features can only be found in the newest version of Xcode with the Clang compiler. For exsample the GCC doesn't
support the use of ARC (Automatic Reference Counting).


Logging System
--------------
The logging system are a simple approach which check both pre- and postconditions and if they are not satisfied it will
send an error message to the log, saying what went wrong. 
The logging system are using a simple DEBUG (BOOL) flag to control whether it should send out log messages or not, and using
the		NSLog(@"Error Description");

The speciel thing with the logging system compared to Assertions and Defensive programming is that it wont halt the program if
an error occur but only print out a error message, explaining what went wrong.

That beeing said, logging can be a good approach to just simply check if your functions are working correctly, but for
error handling it's not as good as assertions and defensive programming approach.


Assertions
----------
When we are dealing with the Assertion approach are we using the NSAssert marco to check whether a 
certain statement are true or false. 
The NSAssert marco have following syntax:	NSAssert(BOOLStatement,@"descriptionMsg");

Use of assertions are best in the development phase. For error and bug testing, the assertions can be a great 
help to the developer since the asserions force the program to crach on bugs and errors and therefore force 
the developer to handle thees errors. In complex code it can be very hard to just read out where the errors might 
be in the testing phase, so by making assertions on both preconditions and postconditions will help a lot compared 
to the use of logging, which doesn't force the program to crach, but just leave a error message in the log. 
A bad thing with asssertions are the loose of if-statments in the code that makes it possible to handle the errors.


Defensive Programming
---------------------
The Defensive programming approach uses the NSException marco to throw out exceptions whether different
preconditions are met. An exception forces the program to halt execution and display an exception error 
message on with exception that was thrown.
The NSException marco have following syntax:	NSException *exceptionName = [NSException exceptionWithName:TypeOfException reason:@"Exception Description" userInfo:nil];
	
The Defensive programming approach, like Asserions, is more useful in the development phase than logging, 
since it also crach the program on errors. Since the exceptions are using if-statements to check the preconditions 
the programmer have the posibility to handle the error so the exit will be more graceful for the user, even without the user will find out.


Conclusion
----------
Overall, I think all three solutions can be good in the debugging process to catch and find bugs in the program. 
If I should point out the worst and the best of these different solusions in this example, I would say that the logging approach are the most 
useless. First of all it needs a debug flag to be set before it logging error messages and second it will not stop 
executing the program if we are in an invalid state. 
Due to the fact that the system don't crash might make this approach better for server-systems where there might be a lot of individual users 
and you aren't intereste in a single program crach will effect other users on the server.
The defensive approach seems to me like it's stronger than assertions since it can catch exceptions and the programmer then have the posibility to handle the error directly. 
Assertions might be useful if the programmer want to be sure that no change in the code will violate the pre- and postconditions without sending out a warning and exit program execution. 
Because of this, Assertions are normally used only in the develop phase for testing.
Since the defensive approach have the possibility to handle the exceptions, even without the user will discover it, it can used in both mobile apps, and desktop programs. 
A crach will also not have any consequence for other users.

