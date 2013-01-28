#Reflection on Asserting, Logging and Defensive

All the different variants do the same: preventing or alerting the program from doing something that it is not allowed to do. 

##Asserting 

If `NSSAssert` fails the program crashes and says "hey" something is wrong here. It throws an exception and the programmer should give it maksimum attention when it does. Normally asserting is used in unit testing and thereby test-driven development where I personally would use it. If the first assert fails then is still goes throw the others, but it will not compile. This can be useful when multiple asserts fails then you can look at all of them at the same time.

##Logging

When logging the program does not throw an exception but gives the programmer information with error message. This is very useful to have in the program when it is released, because if a user comes back to report a crash or bug you are able to get information about that crash with the log file. But this is unfortunately not the case with iPhone app because log files are not generated. Instead one can log to the service and thereby get the log file.

When a log message is triggered it not always a bad sign. The programmer can use it to get information when testing. Log message should be used when it is not critial to get the right input but instead want the information.

##Defensive

The case where the program throws an exception as with asserting is the same with defensive. You are not able to move on before you handle that exception. The biggest different is that when using defensive programming the code is more readable. It is easier for the code reader to see that an exception is comming because it says `NSException` verus `NSSAssert`.

##Conclusion 

Eventhough I am a big fan of defensive because it stops the programmer and tell him what to do, and it is readable I would personally think that logging is the best in my program. It is not highly crucial that a married person gets married agian (overwrite) or that a person gets divorce eventhough one is not married.

Crucial things would be to prevent the program from bugs or even crash and that is where defensive makes sense. Defensive is used when to check if methods gets the right type of input but not exactly what it gets. 