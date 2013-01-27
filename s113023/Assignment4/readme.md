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
	2013-01-25 16:42:43.434 MethodInvocations[64162:303] Calling Object's instance method 10000000 times took 0.052344 seconds
	2013-01-25 16:42:43.434 MethodInvocations[64162:303] Calling Object's instance method 10000000 times via selector took 0.095372 seconds
	2013-01-25 16:42:43.435 MethodInvocations[64162:303] Calling Object's class method 10000000 times took 0.090433 seconds
	2013-01-25 16:42:43.435 MethodInvocations[64162:303] Calling Object's class method 10000000 times via selector took 0.095372 seconds
	2013-01-25 16:42:43.435 MethodInvocations[64162:303] Calling Objects instance method 10000000 times using introspection took 0.256524 seconds
	
We can see directly from the results above that it takes almost double the time when using the performSelector method on an instance of an object compared to calling the instance method directly. The case is not quite the same for class methods were it only takes a short amount of extra time to use the performSelector instead of calling the class method directly. Obvioulsly it takes the longest time to use introspection methods to call an instance method. From the data above it is seen that it is five times faster to call the instance method directly than using introspection. However introspection methods are often used in objective-c because of heavy use of dynamic typing. Therefore we have to check whether an object that has been passed to a method responds to certain methods before calling these. If we don't use introspection we will most certainly end up with a program crash, so often when using dynamic typing, calling introspection methods it is worth the extra time in exchange for a much more stabile and correctly-functionning program.

Enumerations and iterations
---------------------------
In this part of the test i tested four different ways of looping through array elements. The first way is by using a normal for-loop `for (int i = 0; i < iterations; i++)`
combined with C-style access to the array elements (like this: array[i]). The second way was to use a for-loop again but this time combined with the array method objectAtIndex. The third way was to use normal enumeration (using a while loop). To do this you had to create a ´NSEnumerator´ object first Then you could use the enumerator object to loop through the elements in the array. The fourth way was to use fast enumeration ´for (id i in array):

	2013-01-27 12:28:35.626 EnumarationsAndIterations[87220:303] Enter number of iterations
	10000000
	2013-01-27 12:28:36.842 EnumarationsAndIterations[87220:303] You have chosen 10000000 iterations
	2013-01-27 12:28:37.980 EnumarationsAndIterations[87220:303] Normal iteration using c-style acces to 10000000 array elements took 0.167699 seconds
	2013-01-27 12:28:37.980 EnumarationsAndIterations[87220:303] Normal iteration using objectAtIndex to 10000000 array elements took 0.116061 seconds
	2013-01-27 12:28:37.980 EnumarationsAndIterations[87220:303] Normal enumeration to 10000000 array elements took 0.209382 seconds
	2013-01-27 12:28:37.981 EnumarationsAndIterations[87220:303] Fast enumeration to 10000000 array elements took 0.045263 seconds

We can see from the results above that fast enumration of an array is actually quite faster than using normal iteration. From the results above it is between 3 and 4 times faster to use the fast enumaration than a normal for-loop with C-style access to elements. So it is clear that the fast enumeration has been optimized to be very fast and therefore preferable when looping through array items.

Foundation Framework
--------------------
In this part of the test i tested some different ways of accomplishing some of the most common tasks when writing programs. First of i wanted to test the time difference between looping through an immutable array compared to looping through a mutable array containing excatly the same objects. Therefore i allocated a mutable array and instantiated it with the numbers from 0 to the number of iterations entered by the user wrapped inside NSNumber objects. Then i made an immutable copy of that array and started the test.

The next thing i wanted to examine was which way of looping from 0 to the number of iterations entered by the user while storing the number would be fastest. The first solution could be to just save the numbers as normal C integers. The second could be using the NSNumber's factory method ´numberWithInt:´. The third solution could be to use the instance method ´initWithInt:´.

In the last part of the Foundation Framework test i wanted to test how fast it would be to loop through an immutable dictionary compared to a mutable dictionary. So first i allocated a mutable dictionary and instantiated it with the numbers from 0 to the number of iterations. As keys i used the same numbers just wrapped inside a NSString object:

	2013-01-27 13:13:17.846 FoundationClasses[98638:303] Enter number of iterations
	1000000
	2013-01-27 13:13:20.633 FoundationClasses[98638:303] You have chosen 1000000 iterations
	2013-01-27 13:13:24.751 FoundationClasses[98638:303] Counted 1000000 objects in immutable array in 0.003350 seconds
	2013-01-27 13:13:24.751 FoundationClasses[98638:303] Counted 1000000 objects in mutable array in 0.003341 seconds
	2013-01-27 13:13:24.752 FoundationClasses[98638:303] Created 1000000 normal C integers in 0.002265 seconds
	2013-01-27 13:13:24.752 FoundationClasses[98638:303] Wrapped 1000000 normal integers in NSNumbers using factory method in 0.035707 seconds
	2013-01-27 13:13:24.752 FoundationClasses[98638:303] Wrapped 1000000 normal integers in NSNumbers using instance method in 0.012199 seconds
	2013-01-27 13:13:24.753 FoundationClasses[98638:303] Looped through 1000000 objects in immutable dictionary in 1.101141 seconds
	2013-01-27 13:13:24.753 FoundationClasses[98638:303] Looped through 1000000 objects in mutable dictionary in 1.157490 seconds

	2013-01-27 12:42:12.483 FoundationClasses[90760:303] Enter number of iterations
	10000000
	2013-01-27 12:42:13.935 FoundationClasses[90760:303] You have chosen 10000000 iterations
	2013-01-27 12:43:30.451 FoundationClasses[90760:303] Counted 10000000 objects in immutable array in 0.031996 seconds
	2013-01-27 12:43:30.451 FoundationClasses[90760:303] Counted 10000000 objects in mutable array in 0.032481 seconds
	2013-01-27 12:43:30.452 FoundationClasses[90760:303] Created 10000000 normal C integers in 0.022059 seconds
	2013-01-27 12:43:30.452 FoundationClasses[90760:303] Wrapped 10000000 normal integers in NSNumbers using factory method in 0.358047 seconds
	2013-01-27 12:43:30.452 FoundationClasses[90760:303] Wrapped 10000000 normal integers in NSNumbers using instance method in 0.118335 seconds
	2013-01-27 12:43:30.453 FoundationClasses[90760:303] Looped through 10000000 objects in immutable dictionary in 20.609326 seconds
	2013-01-27 12:43:30.453 FoundationClasses[90760:303] Looped through 10000000 objects in mutable dictionary in 21.208100 seconds
	
From the results we see it is actually a bit faster to loop through the elements in an immutable array compared to a mutable array. This should also be the case since mutable objects are normally faster to loop through because of their fixed size. But we see as well that it is actually quite fast to use a mutable form as well, so it is not a massive amount of time that can be saved by switching from a mutable to a immutable. Not that suprisingly we see that it is way faster to save numbers as normal C integers compared to wrapping the number inside a NSNumber object. So this should be considered when using integers. It is also more than twice as fast to use the instance method than the factory method to create NSNumber objects. The dictionarys took much longer time than the other collection objects i have used to loop through. We see that again the immutable version is a bit faster to loop through than the mutable but the main point to state here is that it should really be considered when using a dictionary since the looping through using keys is quite slow compared to an array for example.

Blocks
------

Protocols
---------
