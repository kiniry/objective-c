Assignment 5
============
README.md - Sivanujann Selliah - s093042 - 02/02/13

API fragment
------------
The chosen API is the API for handling operating system processes.
In Java this API includes the classes: java.lang.Runtime, java.lang.ProcessBuilder, java.lang.ProcessBuilder.Redirect, java.lang.ProcessBuilder and java.lang.Process.
In C# this API includes the classes: System.Diagnostics.ProcessStartInfo and System.Diagnostics.Process.

The fragment of the API that will be ported is the methods relevant for executing (and controlling) a process (another application) on the operating system, and redirect the standard I/O, i.e. stdin, stdout, stderr.

Operating Sytem Process API
---------------------------
Java has designed the API into different methods for creating a Process object, which "holds" the application. The Process can be created using a ProcessBuilder, which can set up the environment with environment variables and a start up directory. The ProcessBuilder can also be used to redirect the standard I/O, using ProcessBuilder.Redirect. When the ProcessBuilder object has been adjusted for the process, the process can be started, which creates a Process object, this object also provides input- and output-streams for the process. The Process object can be used to terminate the process, and get an exit status value for a process, there is also a method for running the process synchronously with the Java application. In addition to the ProcessBuilder (which is the preferred way to create a Process object), Java also provides several methods for creating a Process object from the Runtime object.
C# has designed the API much like Java, but has only the Process object and a ProcessStartInfo object to adjust a process's environment. What is different however is that the Process class is not abstract like it is in Java, which makes it possible to use this class and object alone, to set up, execute and terminate the process, where the set up and start execution is but in the ProcessBuilder in Java.

Translation to an Objective-C API
------------------------------------------
The port of the API is very straight forward since most of the language constructs are the same. But there are some differences. With regard to the design: the ported version is a combination of the Java and C# API. With regard to the method signatures: these have been changed a slightly so that the "look and feel" of them comply with the coding and naming conventions of Objective-C.

Implementation
--------------
The implementation uses the Foundation Framework's NSTask class, and NSPipe class to handle the process execution and redirection of standard I/O for the process.

Summary
----------
The ported version of the API, would make it easier for Java and C# developers, who knows the Process APIs. However because this is a ported version of another API, it does not take full advantage of the the features that are available in the native NSTask API.
