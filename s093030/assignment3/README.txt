2013-01-15, Søren Olofsson, s093030

REFLECTIONS:

The implementation for the three programming styles heavily uses inheritance. All functionality is located within the Citizen-class and all the implementation styles just inherit from that class and then react differently based on the preconditions defined for each method inside the Citizen class. The implementation does not use blocks so it seems pretty portable. The following will try to describe the different styles:

Defensive:
In the defensive style an exception is thrown if the precondition does not hold. This can be a major problem in an iPhone app since throwing exceptions is very costly, since it can cause memory leaks. Therefore exceptions in an app should only be thrown if something catastrophic happens and not to regulate control flow of the program as it is known from Java. If developing for a web server it is more common, since throwing exceptions can help in setting up centralised log functionality and it can be easier to show proper messages to the user, because a web server is usually quite layered in its architecture.

Logging:
The logging style checks the precondition and if it fails it prints out an error message. In a real environment however one would normally persist log messages to the file system instead of printing to the console. However it only makes sense to emit log messages if you as a developer have access to these log files afterwards. Since you will probably not gain access to your users device if you are developing an iPhone app, it seems like a bad idea (or at least just meaningless) to ship an app that emits log messages. If it was an application for a webserver or desktop it would make a lot more sense to emit log messages. It can however be discussed for the desktop platform as it depends on the stability of your program and the target users, e.g. if you target developers, then they will be probably be happy that they can access a log file to track what your program is doing. 

Assertions: This is much like the defensive style because an exception is usually also thrown if the assertion does not hold. On the other hand there is not necessarily any "friendly" information (i.e. useful error messages to display for the user) related when making assertions and they are more common to use in unit testing because they provide an easy way to make if-statements an exception handling in one-liners.

From my personal experience, which is mainly based on web development, a combination of logging and defensive programming styles go very well in hand. You as a developer always want to be able to check the web server's log files if users experience odd behaviour that is not easy to reproduce.

With regards to the question about what apps do when they fail, I would say it depends on the degree of failure. If it is a fatal error the phone OS usually says that the application has encountered an error and needs to be closed. If it is because you have done something illegal/wrong, it is usually just displayed to the user.