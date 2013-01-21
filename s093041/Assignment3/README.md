Assignment 3
============

Assertion
---------
Using the assertion approach for ensuring internal state and integrity is an easy to use shortcut for sanity checks during development. The thing to remember about NSAssert is that it is only compiled into the code when in Debug mode, which means that Release builds will not contain any assertions, thus not causing any crashes in a deployed application when the assertion is violated. When in Debug mode it certainly makes sense to have the application crash when some unwanted state is reached in order to remind the programmer that something is very wrong. In a production environment another method should be used to ensure internal consistency.

Logging
-------
The logging approach will only persist that an unwanted state has at some point been reached, thus it will not prevent such a thing from happening. Therefore, for software like mobil applications logging is also best suited for debugging purposes, hence the check for debug mode in the AlarmClockLogging.m. One would not want the log file of a deployed app to get spammed with logging messages. However, some log statements might make sense when retrieving crash reports and log files, but they should be kept at a minimum. In a server application scenario, however, logging is normally a heavily used approach since a server application cannot easily be stopped and debugged. Thus, constantly writing log messages about both good and bad states will make it a lot easier for a programmer to get an idea of the reason for an eventual crash.

Defensive
---------
To make sure that a critically unwanted state is not reached, even in a deployed application, exceptions can be used. However, it should be clearly underlined that it should only be used for _critically_ bad states since it would cause a crash if not handled properly. This could be an intended behaviour for some applications and some extremely severe states that could lead to further corruption of internal consistency.

This approach is often times used in core APIs to absolutely ensure invariance. For instance NSArray will throw an out of bounds exception if an object at an index greater than the size of the array is accessed. This enforces the programmer to think twice when accessing arrays, avoiding crashes in deployed applications.

It is not standard practice to catch exceptions in Objective-C, exactly because exceptions are considered to represent worst case scenarios that are both unrecoverable and highly unwanted, meaning that the application is supposed to crash in such a  situation.

NSError
-------
A fourth and much more used approach is to use NSError. This method acts much like the use of exceptions in languages like Java and C#. The idea is that a reference (memory address) of an uninitialized NSError object is passed in to some method. This method then does its magic and if it encounters some unwanted state it can initialize the NSError passed in and immediately stop executing. The calling object must then check if the passed in error has been instantiated during execution of the method before continuing. The scheme is very reminiscent of the try/catch procedure of exceptions in other OO languages and thus often used in production environments.

An example of this approach is illustrated in the AlarmClockError class.

Conclusion
----------
Thus, the NSException of Objective-C is much like Java's
Error class, while the NSError is much like Java's Exception
class - thank God for terming consistency!