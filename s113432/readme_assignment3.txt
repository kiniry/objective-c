Reflection upon argument throwing:
Exceptions are usually used in a release build (mostly libraires and interfaces) where some arguments are invalid, or the call to you have been made incorrectly. Therefore, the program throws an exception and stops.
One way to avoid stopping is to catch the error and do something with that, but this is very costly and usually not standard practice.

Reflection upon logging:
Possibly the most important thing to be said about logging is that the resource cost is negligent compared to running the rest of the program, and at the same time, it enables a developper to find out why a program suddenly might crash and thus fix the bug.

Reflection upon assertions:
Assertions in such a program is generally for the purpose of the programmer himself, to make sure he follows the rules, conventions and assumptions that he himself has specified earlier in the programming process.
Furthermore, these assertions can be opted to not be compiled, too, so they do not become a part of the actual program and thus does not take up resources; however, in such a case, that also means that they can only be used for debugging and ensuring that you follow the rules etc. specified.

Also, if a test fails, it throws an exception and that means that the app will crash if the error aren't caught, and try/catch sentences are expensive, resource-wise, and thus, one should keep the assertions out of the compilation of the program.




Reflections upon the styles during app development:
Initial implementation and testing:
During initial implementation, assertions are generally your way to go here, as they keeps  your hand in check when you program, making sure you follow the rules and conventions you yourself specified.
If you've done these assertions corrrect, there is generally no point in logging during this phase, as the assertions should be checking the same things that the logging will do and throw an exception if you do something you shouldn't have.
Exceptions can still be thrown during this phase, if you are certain a program should crash if you do a certain thing. For debugging, you can also catch this error, so the testing can continue, but as it is resource-requiring, it is recommended that one removes this before deployment.

On-device testing:
Generally, on-device testing should start out with implementing assertions during the i nitial testing and then move on to a combination of exceptions/logging to make sure this works properly before deployment

After deployment:
After deployment, things such as assertions should generally be removed as they are primarily a tool to help the developper and not the user. Furthermore, you do not want your app to crash due to assertion failures - you should've fixed what would cause these failures before deployment!
Regarding exceptions, they are generally used after deployment for specific cases where you actually -want- your app to crash, such as cases where you risk data corruption or wrong function calls.
Finally, regarding logging messages, it would generally be nice to have logging enabled after deployment as it makes bug-fixing after deployment much easier (Android developpers generally requires you to return a log document along with an error if you want it fixed)



Reflections on these things when they run on other platforms:
Generally, we believe that development remains more or less identical (still assertions --> logging/exception) no matter the platform (at least, we see on desktops that if a program crashes, you can send an error report which contains a log) - however, on servers, it is very likely extremely important that a program does not crash, and as such, they might still throw an exception in the case of data corruption, but this exception will be caught and handled without crashing the program.