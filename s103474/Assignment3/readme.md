# Reflections on assignment 3

In this assignment, we expanded upon part 1 of assignment 2 in order to make the code more robust in terms of certain inputs given that can create postcondition and (especially) precondition fails. Thus, whereever it is relevant amongst the objects created in assignment 2 part 1, measures were added to all the methods which take input where it is crucial that the input satisfy a certain condition (this is the "condition" mentioned in the "pre"- and "postconditions").

As a result of this, it was only needed to add these measures to two different (state-changing) methods in the Citizen class. These measures were added in three different manners: (1) Defensive programming, (2) Logging, (3) Asserting. Because of this, three subclasses of Citizen were created, corresponding to these three different techniques. The techniques are described below:

## Robustification methods

### (1) Defensive programming
Arguably my favourite out of the three. This method throws an exception if the condition is not satisfied. This is also the most often seen in many applications that already exist, or even *not* seen. This is because it's relatively easy for an application to handle an exception in a predictable manner, whatever that may be. Perhaps by warning the user or undoing the last X steps which lead to the error. This method might also be best in an environment where it does not disrupt more than one user if the application crashes because of an unhandled exception; thus, I'd say this method is best for personal devices such as a phone or a PC.

### (2) Logging
This method is the least disruptive out of the three because it never actually stops the application from performing an operation that does not satisfy the condition. It only tells the log, if the debug switch is on. From this perspective, it might be the most stable solution. However, I'm convinced that the conditions are there for a reason. If they are ignored, it could lead to an unstable database and data that you cannot count on. Of course, your database can always be set to handle this, or a simple if-statement could be used instead. In any case, this is probably the best method to use on a server application, as it leads to less exceptions than the above method, which is good, as crashes resulting from unhandled exceptions will affect a lot of users instead of just one.

### (3) Asserting
This method is the most simple to add to your application, as you simply input the condition and the message to output if it fails. However, if it fails, it throws your application out of the window just like an unhandled exception would. In my opinion, this solution is not very portable and is best only in a test environment, in order to iron out what can (and should) be ironed out in a product in development, before it reaches the virtual store shelves.

## Compilation

We were asked to compile this application on the command line, using both `clang` (the default used by Xcode) and `gcc` (used by GNUstep).

### clang
This compiler (Clang/LLVM) is used by Xcode by default. To compile a simple Foundation application with only one main.m file (found in the current directory), the following command is used (with "assignment3clang" as the output program name):

	clang -fobjc-arc -framework Foundation main.m -o assignment3clang

However, in this case, there is more than one .m file. We could simply list all the .m files in the space where the main.m is placed above, separated by space. However, we could also use a little bit of Unix command trickery to achieve an automatic list of all .m files in the current directory, and go with that:

	clang -fobjc-arc -framework Foundation `find . -name '*.m' | xargs echo` -o assignment3clang

Which results in a binary, ready to be run in the Mac Terminal.app. It is working as expected:

	andy$ ./assignment3clang 
	2013-01-22 13:29:12.875 assignment3clang[13382:707] All classes imported successfully.

NOTE: The Frameworks folder is required to be in your system's PATH when using the above commands. It can be added with the following command:

	PATH=$PATH:/System/Library/Frameworks

### gcc

This method is more of a challenge to get working, because Foundation is strictly not a part of GNUstep, which has its own foundation classes (rid of all NS references). However, it is possible to reference Foundation, in a command like the below:

	gcc -o assignment3gcc -Wall -std=c99 main.m -framework Foundation -lobjc
	
(note that this references C99 instead of the old implementation of C that Objective-C is built upon.)

However, even with this improvement, the GCC compiler does not permit the use of Automatic Reference Counting (ARC), which is a compile-level feature so far only found in LLVM/Clang. This is such an important feature central to the way we've learned Objective-C in this class (with special focus on *Modern Objective-C*), that I did not find it to make sense to go out of my way to add calls to `release`, `drain` and `retain` (methods that I haven't learned too much about), just in order to see this compile and run. Now I know how to do it, should I ever need it.

## Conclusion

While this has been a healthy experiment in the barebones of the Objective-C language, and while especially part 1 of the assignment will be good knowledge in the future, in the practical world all compilation will happen through Xcode, which is much easier and actually encompasses much more than the simple compiler level does.

Yes, the simple compilers (like those seen in part 2) are sufficient for command-line utilities and it is good to know how they work, but for graphical apps (such as those made for OS X or iOS), there is more to an app than the binary. Many resources are consolidated and packaged along with the binary code in order to create a complete application. Thus I know I will be sticking with Xcode for compilation and packaging from now on.
