Assignment4
===========
String Manipulations
--------------------
To measure the complexity of string manipulations the project StringManipulation has been created. This program prompts the user for an amount of iterations to run. When the user has entered a number of iterations the program will start appending the char 'a' to an empty mutable array. The program continues to append the char until the amount specified has been appended. The program measures the time spent for this operation.

Afterwards the program will start removing chars from the string. The program continues to remove chars until the string is empty again. The time spent during this operation is also measured. This program can be used to simulate how mutable strings can be manipulated in a 'real' program. I have profiled the program using different numbers for the amount of iterations:

Heavy use of recursion
----------------------

Method Invocation cost
----------------------
In this part of the test I tested 5 different ways of calling an object's method. The five different ways i used were:

1. Using the normal way of sending a message to an instance of an object
2. Using the performSelector method to send a message to an instance of an object
3. Using the normal way of sending a message to a class 
4. Using the performSelector method to send a message to a class
5. Using the isKindOfClass and respondsToSelector methods to send a message to an instance of an object

The output from the console when entering 10000000 iterations is posted below:

	2013-01-25 16:42:39.633 MethodInvocations[64162:303] Enter number of iterations
	10000000
	2013-01-25 16:42:42.883 MethodInvocations[64162:303] You have chosen 10000000 iterations
	2013-01-25 16:42:42.883 MethodInvocations[64162:303] Call object's instance method test started
	2013-01-25 16:42:42.936 MethodInvocations[64162:303] Call object's instance method test finished
	2013-01-25 16:42:42.937 MethodInvocations[64162:303] Call object's instance method via selector test started
	2013-01-25 16:42:43.028 MethodInvocations[64162:303] Call object's instance method via selector test finished
	2013-01-25 16:42:43.029 MethodInvocations[64162:303] Call object's class method test started
	2013-01-25 16:42:43.079 MethodInvocations[64162:303] Call object's class method test finished
	2013-01-25 16:42:43.080 MethodInvocations[64162:303] Call object's class method via selector test started
	2013-01-25 16:42:43.176 MethodInvocations[64162:303] Call object's class method via selector test finished
	2013-01-25 16:42:43.177 MethodInvocations[64162:303] Call object using introspection test started
	2013-01-25 16:42:43.433 MethodInvocations[64162:303] Call object using introspection test finished
	2013-01-25 16:42:43.434 MethodInvocations[64162:303] Calling Object's instance method 10000000 times took 0.052344 seconds
	2013-01-25 16:42:43.434 MethodInvocations[64162:303] Calling Object's instance method 10000000 times via selector took 0.095372 seconds
	2013-01-25 16:42:43.435 MethodInvocations[64162:303] Calling Object's class method 10000000 times took 0.090433 seconds
	2013-01-25 16:42:43.435 MethodInvocations[64162:303] Calling Object's class method 10000000 times via selector took 0.095372 seconds
	2013-01-25 16:42:43.435 MethodInvocations[64162:303] Calling Objects instance method 10000000 times using introspection took 0.256524 seconds
	
We can see directly from the results above that it takes almost double the time when using the performSelector method on an instance of an object compared to calling the instance method directly. The case is not quite the same for class methods were it only takes a short amount of extra time to use the performSelector instead of calling the class method directly. Obvioulsly it takes the longest time to use introspection methods to call an instance method. From the data above it is seen that it is five times faster to call the instance method directly than using introspection. However introspection methods are often used in objective-c because of heavy use of dynamic typing. Therefore we have to check whether an object that has been passed to a method responds to certain methods before calling these. If we don't use introspection we will most certainly end up with a program crash, so often when using dynamic typing, calling introspection methods it is worth the extra time in exchange for a much more stabile and correctly-functionning program.

Enumerations and iterations
---------------------------

Foundation Framework
--------------------

Blocks
------

Protocols
---------
