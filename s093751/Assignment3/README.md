Assignment 3 - Carsten Nilsson - s093751
==================================================

There are three ways of handling errors with illegal arguments:

Defensive
---------
The term Defensive Programming is used when programmers are paranoid about others using their code. Exceptions is used as a warning to the external programmer. In other programming languages exceptions should only be used when it is a critical error and the same consensus holds in this environment. If the error is not that severe, then one of the other variants of error handling should be used.

Exceptions like these are most often seen with the core foundation e.g. if a ´BOOL´is set to ´5´, then an exception will be thrown. Exceptions is most often used in the lowest layers of applications in almost any OO-language.

However, try having a try-n-catch block the exceptions can be managed in a beneficial manner, especially when programming applications with multiple threads e.g. when a given thread is terminated and the applications is supposed to treat that situation.

Logging
---------
Logging is the most often used variant, since programmers can look in any given log and see what has happend when a system crashes (If done detailed enough). It is used in debug-mode and can be saved to a file. It is also this type of variant that is most commonly used in mobile Apps and desktop Apps, since when the program crashes, it will send a crash report consisting of the logging data to the developers.

Assertion
---------
The assertion variant is a way of ensuring that the arguments/input is valid and making sure that variable has been correctly set afterwards. Assertions will only be used in debug-mode and will cause the program to crash if any arguments are invalid. It is somewhat of a combination of the two other variants, since it will both give a message and it will also cause the application to crash. 
However, it will not be included in the release-build (only in the debug-build for development).


Conclusion
----------
By using these three variants of handlings errors and mistakes, it guarantees the developers robust software system, that can be fixed quickly (if a bug is found). It is important for the programmer to know which variant is appropriate for the situation.
