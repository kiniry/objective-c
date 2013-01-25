Assignment3 - Programming approaches
====================================

In this Assignment3 folder exists 3 different project-folders each containing 3 different approaches on the check of preconditions and postconditions of the civil class program written in Assignment 2.1. The 3 different styles of condition-checking has been split into 3 different projects to clarify the differences between them. The three different approaches are: Defensive variant, Assertion variant & Logging variant. More info about these programming approaches below:

Defensive
---------
The defensive approach uses if-else statements to check whether different preconditions are met. If the constraint aren't met an exception is thrown. When an exception is thrown the program execution will halt execution and display the exception:

	NSException *exceptionName = [NSException exceptionWithName:someTypeOfException reason:@"You have violated a constraint" userInfo:nil]

I have added some extra preconditions to make sure that a Citizen is allocated and instantiated with meaningful properties. By this i refer to the fact that i doesn't make much sense to instantiate a Citizen with no name, a Citizen who isn't either Male or Female or a Citizen who hasn't got an age which is defined by a positive integer. Other than that I have mostly tried to implement just the preconditions from the BON method specification.

The defensive approach seems like the strongest approach when it comes to stability and making sure that the constraints are not violated. If exceptions are combined with try/catch statements it will make it much more user-friendly program. The defensive programming style is strong in the way that following statements will only be executed if the exception-checks are not violated. In terms of app development the defensive programming style can lead to a massive amount of crashes if the app-programmer haven't focused on how to handle the exception errors that might rise during program execution. It is always important to take this into mind when designed good stable applications. The use of exceptions can be a good thing since it can take care of errors and maybe return the program to a stable state if possible. But most important: it will help prevent inconsistencies in your program.

Assertion
---------
The assertion approach uses the NSAssert macro to check whether certain specified constraints are met. Usually assertions are used in the beginning and end of a method declaration or before and after a complex block of code. They are used to check whether the preconditions and postconditions of the code are violated or not. If the checks are violated an exception gets raised and a user defined description of the violation is shown in the console. The assertions have the following syntax:

	NSAssert(booleanStatementThatShouldAlwaysBeTrue,@"descriptionMessageIfBooleanCheckEvaluatesFalse")
	
Assertions are a good tool when you are in the development phase. They are good for testing your code since it will force the program to crash or do something other to handle the error if something is specified, when some constraint have been violated. In that way if some other programmer fucks up some of your complex code before an assertion it might lead to an assertion beeing violated and therefore a program crash. In this way assertions will always test your methods and thereby making sure that both your preconditions and postconditions are never violated without an exception or other kind of warning if specified. Assertions are a stronger tool in the testing phase than logging since your program will crash if some assertions are violation that you haven't though about as a programmer, instead of just giving you a message in the log. The assertion style is somewhat different than the logging and the defensive way since you can leave out many of the if-else statements which makes it much easier to see exactly which statements must be true at certain places in your code. The bad thing though is that you loose your if-else structures that sometimes helps improving the understanding of the code for what is supposed to happen if some if-statement fails.

Logging
-------
The logging approach is to send error messages to the log when some constraints are violated. This is done using the normal way of communicating to the console - NSLog:

	if(SomeConstraintIsViolated){
		NSLog(@"You have violated this constraint");
	} else {
		doWhatYouAreSupposedToDo...
	}

Like with assertions the logging approach checks for both precondition and postcondition violations. The difference is that the program wont crash or halt if a constraint is violated, instead an error message is printed to the console explaining the error but that doesn't prevent the user from actually violating the constraints. Also logging error messages to the console doesn't fix the error - it only explains it. Posting a lot of error messages to the console wont help the user fixing the error and might confuse more than help, this is also the case with my logging variant of the civil status program. This can be helped by implementing a variable that can be used to toggle these error messages on and off like in our program. That beeing said, sometimes logging can be a good thing to make sure that different aspects of your code is functionning well while implementing them. It is often the easiest way to make sure that different parts of the method that you are writing just now are functionning as expected. But since it doesn't prevent you from violating the constraints it might lead to inconsistencies in your program. In some situations error logs might be preferable to program crashes.

Assignment3 - Compilers
=======================

For this assignment we were supposed to use both the clang compiler (the one that Xcode is using by default) and the gcc compiler to see whether our program were compatible with different environments:

Clang
-----
The Clang/LLVM is the compiler which is used by Xcode by default. To compile an objective-c main file together with the files it include we can just use the built in compiler in Xcode. If we want to use the terminal though, we can write the following command:

	clang -fobjc-arc -framework Foundation main.m Citizen.m NoblePerson.m -o Assignment3-CLANG
	
This will create a binary file which can be run through the terminal in OSX.

I compiled all three approaches in clang and all of them worked fine when running the binary files created.

Gcc
---
The Gcc compiler is able to compile for different platforms including OSX, Windows and Linux. This compiler is a bit more tricky than Clang since it doesn't support many of the quick implementation stuff/shorter syntax that you have in modern objective-c. And you have to use allocate and init an instance of the NSAutoreleasePool object in the beginning of the main file and use [pool drain] in the end, this is done automatically in clang. I also found some problems when trying to compile my assertion variant in gcc, and after some tries I gave up. The two other variants compiled successfully after some modifications (mostly by changing the declarations of the properties and also by synthesizing all the properties before using them).

To compile with gcc in command line, use the following command:

	gcc -framework Foundation main.m Citizen.m NoblePerson.m -o Assignment3-GCC

Conclusion
----------
The defensive programming approach seems like the most preferable to me. The logging approach might be a good idea for temporary use when implementing the program, assertion might be a good idea to make sure that other programmers wont be able to destroy your code and violate preconditions and postconditions without getting a warning and a program crash, and also for testing purposes. But defensive programming combined with methods for error handling when an exception is thrown will lead to the most reliable programs and apps, since you wont be able to cause inconsistency in your methods and classes. Which one of the programming styles you should use is always a question about protection against inconsistency vs avoiding crashes. The defensive style is most used in desktop and mobile environments where a system crash caused by a violated constraint wont have consequences for a lot of users at the same time. Often exceptions are handled in the back without the user ever finding out. Logging might be a better approach for some server-systems where you aren't interested in many program crashes that will effect many users at the same time. But this still depends on how critical it will be for the system to get its constraints violated. Assertions should mostly be used for testing purposes. Regarding the two different compilers i found out that gcc can be a bit tricky sometimes since it requires a much more strict syntax (The good thing though is that things can be compiled and run on different platforms compared to clang), and since our main purpose of learning and using the objective-C language is for designing and implementing apps for iOS devices i find the clang compiler to be the best and easiest to use for this purpose. 