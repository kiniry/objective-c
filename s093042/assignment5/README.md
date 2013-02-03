Assignment 5
============
README.md - Sivanujann Selliah - s093042 - 02/02/13

The following are reflections on porting an API to Objective-C.

The code (with comments) for the ported version is found in the [Process](Process/ "Link to Process") project.

The original APIs can be found on [Oracle](http://docs.oracle.com/javase/7/docs/api/java/lang/Process.html "Link to http://docs.oracle.com/javase/7/docs/api/java/lang/Process.html") and [MSDN](http://msdn.microsoft.com/en-us/library/system.diagnostics.process.aspx "Link to http://msdn.microsoft.com/en-us/library/system.diagnostics.process.aspx").

API fragment
------------
The chosen API for this assignment is the API for handling operating system processes (executing other applications).

In Java this API includes the classes: `java.lang.Runtime`, `java.lang.ProcessBuilder`, `java.lang.ProcessBuilder.Redirect` and `java.lang.Process`.
In C# this API includes the classes: `System.Diagnostics.ProcessStartInfo` and `System.Diagnostics.Process`.

The fragments of the API that will be ported are the methods relevant for setting up a process, executing (and controlling) a process on the operating system and redirecting the standard I/O i.e. `stdin`, `stdout` and `stderr`.

Operating System Process API
---------------------------
In Java the API has been designed by having several different methods for creating a `Process` object, which "holds" the process (application). The `Process` can be created using a `ProcessBuilder`, which can set up the environment with environment variables and a working directory. The `ProcessBuilder` can also be used to redirect the standard I/O, using the `ProcessBuilder.Redirect` class. When the `ProcessBuilder` object has been adjusted for the process to be executed, the process can be started, which creates a `Process` object, this object also provides input- and output-streams for the process. The `Process` object can be used to terminate the process, and get an exit code for a process, there is also a method for running the process synchronously with the Java application. In addition to the `ProcessBuilder` (which is the preferred way to create a `Process` object), Java also provides several methods for creating a `Process` object from the `Runtime` object.

In C# the API has been designed much like Java, but there are only two classes: a `Process` and a `ProcessStartInfo` class, to adjust a process's environment. The main difference is that the `Process` class is not `abstract` like it is in Java, which makes it possible to use this class and object alone, to set up, execute and terminate the process, where the set up and start execution is put in the `ProcessBuilder` in Java.

Translation to an Objective-C API
---------------------------------
The ported version of the API is very close to the "original" API since most of the language constructs are the same. But there are some differences.

With regard to the design:
The ported version is a combination of the Java and C# API, because it would not make much sense to "start" a new process with the constructor (the init method), hence the `start` method has been moved from the `ProcessBuilder` in Java to the `Process` class like it is done in C#, this also makes the design more like the design of the Java `Thread` class. The ported version of the `Process` class works like the version in Java by being dependent on a `ProcessBuilder` to be able to set up a `Process` object.
The `ProcessBuilder` class is a little different from Java's `ProcessBuilder`: the different accessor methods have been replaced with Objective-C properties, much like the `ProcessStartInfo` class from C#, where fields are used; the only accessor method left is the variable-list styled setter for the commands list. In addition to this, the design of the ported version is made such that all standard I/O is redirected to pipes, hence the `redirectX` methods from the Java API are not included.
And of cause the Java objects used to hold the data have been replaced with the Objective-C "equivalent" objects.

With regard to the method signatures:
These have been changed slightly so that the "look and feel" of them comply with the coding and naming conventions of Objective-C.

Implementation
--------------
The implementation uses the Foundation Framework's `NSTask` class, and `NSPipe` class to handle the process execution and redirection of standard I/O for the process.

Summary
-------
The ported version of the API, would make it easier for Java and C# developers, who knows the `Process` APIs, to set up and execute an operating system process. However because this is a ported version of an API, it does not take full advantage of the features that are available in the native `NSTask` API e.g. the `suspend` and `resume` methods.
