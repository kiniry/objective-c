/**
 *
 * Assignment 3
 * Copyright Joachim Jensen 
 *
 *
 */

Though Objective-C can be compiled cross platform, all implementations make use of Foundation which requires Apple SDK. It can be imitated by GNUstep on windows/unix but this has some limitations as mentioned in assignment 2.

This assignment introduces the 3 classes CitizenAssert, CitizenLog and CitizenDefensive that all extend Citizen and will implement the methods from this superclass in their respective ways.

###########################
Assertion
###########################

If an assertion, i.e. a conditional logical statement, is false, the application will halt/crash. Assertions are here made by NSAssert() (that actually throws an exception).

Usually it is bad to let a program crash (especially user experience vice), but if the reason of the crash is severe (i.e. the program can behave incorrectly afterwards or become corrupted entirely) it is a good idea.

Conclusion: assertions should be used after deployment in cases where the program under any circumstance must not continue for a certain error

###########################
Logging
###########################

If something is not right, it will be logged in the console, but the program will continue.

(External) logging combined with analytic tools is a great method to monitor the behaviour of a program (and its users) when it has been launched. However, (internally) logging an error without doing anything about it is bad practice and _will_ eventually lead to unexpected behaviour in the program.

An application should also never print log messages to the screen on any platform. What should the user make of those anyway? Such log messages are for debug purposes only and should be handled and removed before launch. As said, (external) logging behind the curtain is fine because it can give statistical data about how the program is used, but this kind of logging is different from debug logging. Thus, debug logging should not be used to take care of errors of any kind.

Conclusion: debug logging should be used in initial development and for testing. external logging can be used to monitor program behaviour (and thus errors).

###########################
Defensive
###########################

The defensive implementation is almost like the assertion implementation except the developer is meant to catch any exceptions thrown and then tell the program what to do thereafter, i.e. defend the program against them.

Such implementation is great for smaller isolated errors such as file i/o.

Conclusion: should be used after deployment in cases where the program can continue in a different path for a certain error
