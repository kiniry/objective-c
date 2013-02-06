/**
 * Assignment 3 - Programming in Objective-C
 *
 * Logging in objective-c applications
 * Kim Gad Thomsen (s072546)
 */
 
 
Going through the different types:

Assertions:
In objective-c applications when a developer want to use assertions as the means of handlin errors, NSAssertion is the way to go. As shown in the CitizenAssertion class it 
is given a truth condition to evaluate and then a message if that condition is no satisfied. If the program actually asserts, the program stops. The reason for this is
that the point of assertions is to check that values are as they are expected to be and if not, something terrible bad has happended and the program should end.

Defensive programming:
Defensive programming can also be said about assertions but in this case it means using exceptions. An exceptions works basicly the same as an assertion then creating on in the program (the code)
which means that instead of using nsassert the truth statement is evaluated with an IF statement and if this is not as expected the program throws an exception with. The idea behind exceptions is also
to make sure that variables contains correct types of values and maybe some logical statements regarding the active program so when this is wrong, the program must handle it. When working with 
exceptions it is usually to handle programmer errors and not for when a file-download fails, here the NSError pattern should be used. Example: CitizenDefensive

Logging:
The last example is using logging to tell if an error has occured. This means that instead of using language features to handle and throw errors the programmer needs to write the error handling code 
himself and thus being vunerable of errors in the errorsystem. This is also shown in the Citizen class


Cross-Compiling with GCC and CLANG:
I did not find any problems in compiling my solutions in this assigment with GCC or CLANG So I guess that the portablility is pretty neat when only working with basic stuff in obj-c.

Reflections:
When developing objective-c programs in the first steps of programming I would think that the logging approach will give the result for debugging most efficiently since everything is still being developed
and nothing is considered as done. Whenever parts of the system starts to be deemed done these parts would not be logging anything to the console since that would be stupid in a production software. In those
parts I would use Exceptions to handle minor errors and assertions to handle critical errors. I consider logging for development and the other two as something used to handle errors and maybe even quit the application.
One of the thins in Apps is that they dont give a reason for them to crash, the experience of a crashed app is clean and the user dont have to know why it crashed but only that its crashed and then the user can decide
to open the app again or not. This means that assertions or uncatched exceptions in not necessarily a bad thing in objective-c programs, if the error is unrecoverable.



