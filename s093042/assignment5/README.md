Assignment 5
============
README.md - Sivanujann Selliah - s093042 - 02/02/13

Chosen API fragment
-------------------
The choosen API is the API for handling operating system processes.
In Java this API includes the classes: java.lang.Runtime, java.lang.ProcessBuilder, java.lang.ProcessBuilder.Redirect, java.lang.ProcessBuilder and java.lang.Process.

The fragment of the API that will be ported is the methods relevant for executing (and controlling) a process (another application) on the operating system, and redirect the standard I/O, i.e. stdin, stdout, stderr.

Operating Sytem Process API
---------------------------
Java has designed the API into different methods for creating a Process object, which "holds" the application. The Process can be created using a ProcessBuilder, which can set up the enviroment with envirment variables and a start up directory. The ProcessBuilder can also be used to redirect the standard I/O, using ProcessBuilder.Redirect. When the ProcessBuilder object has been adjusted for the process, the process can be started, which creates a Process object, this object also provides input- and output-streams for the process. The Process object can be used to terminatethe process, and get an exit status value for a process, there is also a method for running the process synchronously with the Java application. In addition to the ProcessBuilder (which is the preferred way to create a Process object), Java also provides several methods for creating a Process object from the Runtime object.


Translation of Java API to Objective-C API
------------------------------------------
The port of the Java API is very straight forward since most of the language constructs are the same. But there are some subtle differences, e.g. ...

Implementation
--------------
The implementation uses the Foundation Framework's NSTask class, and NSPipe class to handle the process execution and redirection of standard I/O for the process.

Conclusion
----------
The ported version of the API, would make it easier for Java developers, who knows the Process API, but this API does not have all the features that are available in the native NSTask API.
