Assignment4
===========
String Manipulations
--------------------
To measure the complexity of string manipulations the project StringManipulation has been created. This program prompts the user for an amount of iterations to run. When the user has entered a number of iterations the program will start appending the char 'a' to an empty mutable array. The program continues to append the char until the amount specified has been appended. The program measures the time spent for this operation.

Afterwards the program will do the same thing just for an immutable array instead. The time spent for this operation will be measured as well. The outputs for this test were:

	2013-01-29 21:44:32.606 StringManipulation[16015:303] Enter number of iterations
	10000
	2013-01-29 21:44:38.020 StringManipulation[16015:303] MutableString appending took 0.001516 seconds doing 10000 additions
	2013-01-29 21:44:38.020 StringManipulation[16015:303] ImmutableString appending took 0.000733 seconds doing 10000 additions
	2013-01-29 21:44:38.021 StringManipulation[16015:303] MutableString time spent pr char appended: 0.000152 ms
	2013-01-29 21:44:38.021 StringManipulation[16015:303] ImmutableString time spent pr char appended: 0.000073 ms

	2013-01-29 21:44:51.844 StringManipulation[16078:303] Enter number of iterations
	100000
	2013-01-29 21:44:55.242 StringManipulation[16078:303] MutableString appending took 0.009896 seconds doing 100000 additions
	2013-01-29 21:44:55.243 StringManipulation[16078:303] ImmutableString appending took 0.004274 seconds doing 100000 additions
	2013-01-29 21:44:55.243 StringManipulation[16078:303] MutableString time spent pr char appended: 0.000099 ms
	2013-01-29 21:44:55.243 StringManipulation[16078:303] ImmutableString time spent pr char appended: 0.000043 ms

	2013-01-29 21:45:11.624 StringManipulation[16137:303] Enter number of iterations
	1000000
	2013-01-29 21:45:15.576 StringManipulation[16137:303] MutableString appending took 0.060796 seconds doing 1000000 additions
	2013-01-29 21:45:15.577 StringManipulation[16137:303] ImmutableString appending took 0.027239 seconds doing 1000000 additions
	2013-01-29 21:45:15.577 StringManipulation[16137:303] MutableString time spent pr char appended: 0.000061 ms
	2013-01-29 21:45:15.578 StringManipulation[16137:303] ImmutableString time spent pr char appended: 0.000027 ms

	2013-01-29 21:45:27.101 StringManipulation[16190:303] Enter number of iterations
	10000000
	2013-01-29 21:45:28.855 StringManipulation[16190:303] MutableString appending took 0.582018 seconds doing 10000000 additions
	2013-01-29 21:45:28.856 StringManipulation[16190:303] ImmutableString appending took 0.242795 seconds doing 10000000 additions
	2013-01-29 21:45:28.856 StringManipulation[16190:303] MutableString time spent pr char appended: 0.000058 ms
	2013-01-29 21:45:28.856 StringManipulation[16190:303] ImmutableString time spent pr char appended: 0.000024 ms

	2013-01-29 21:45:43.868 StringManipulation[16232:303] Enter number of iterations
	100000000
	2013-01-29 21:45:53.068 StringManipulation[16232:303] MutableString appending took 5.714429 seconds doing 100000000 additions
	2013-01-29 21:45:53.068 StringManipulation[16232:303] ImmutableString appending took 2.386271 seconds doing 100000000 additions
	2013-01-29 21:45:53.069 StringManipulation[16232:303] MutableString time spent pr char appended: 0.000057 ms
	2013-01-29 21:45:53.069 StringManipulation[16232:303] ImmutableString time spent pr char appended: 0.000024 ms

By taking a look at the timings from the test above, we see that first of all string appending on an immutable string is almost twice as fast as appending on a mutable string in all the cases above. We can also something about the complexity by comparing the time spent pr char for the different number of iterations. We can see that for both types of append-operations the time spent pr char appended is decreasing when the number of iterations increases. 
	
Heavy use of recursion
----------------------
Not done yet

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

	2013-01-29 22:07:58.090 FoundationClasses[16628:303] Enter number of iterations
	10000
	2013-01-29 22:08:07.947 FoundationClasses[16628:303] You have chosen 10000 iterations
	2013-01-29 22:08:07.997 FoundationClasses[16628:303] Counted 10000 objects in immutable array in 0.000072 seconds
	2013-01-29 22:08:07.998 FoundationClasses[16628:303] Counted 10000 objects in mutable array in 0.000054 seconds
	2013-01-29 22:08:07.998 FoundationClasses[16628:303] Created 10000 normal C integers in 0.000024 seconds
	2013-01-29 22:08:07.999 FoundationClasses[16628:303] Wrapped 10000 normal integers in NSNumbers using factory method in 0.000417 seconds
	2013-01-29 22:08:07.999 FoundationClasses[16628:303] Wrapped 10000 normal integers in NSNumbers using instance method in 0.000153 seconds
	2013-01-29 22:08:08.000 FoundationClasses[16628:303] Looped through 10000 objects in immutable dictionary in 0.010739 seconds
	2013-01-29 22:08:08.000 FoundationClasses[16628:303] Looped through 10000 objects in mutable dictionary in 0.011202 seconds
	
	2013-01-29 22:08:32.944 FoundationClasses[16706:303] Enter number of iterations
	100000
	2013-01-29 22:08:34.220 FoundationClasses[16706:303] You have chosen 100000 iterations
	2013-01-29 22:08:34.636 FoundationClasses[16706:303] Counted 100000 objects in immutable array in 0.000348 seconds
	2013-01-29 22:08:34.637 FoundationClasses[16706:303] Counted 100000 objects in mutable array in 0.000340 seconds
	2013-01-29 22:08:34.637 FoundationClasses[16706:303] Created 100000 normal C integers in 0.000240 seconds
	2013-01-29 22:08:34.637 FoundationClasses[16706:303] Wrapped 100000 normal integers in NSNumbers using factory method in 0.003870 seconds
	2013-01-29 22:08:34.638 FoundationClasses[16706:303] Wrapped 100000 normal integers in NSNumbers using instance method in 0.001244 seconds
	2013-01-29 22:08:34.638 FoundationClasses[16706:303] Looped through 100000 objects in immutable dictionary in 0.111182 seconds
	2013-01-29 22:08:34.638 FoundationClasses[16706:303] Looped through 100000 objects in mutable dictionary in 0.114784 seconds

	2013-01-29 22:08:54.666 FoundationClasses[16749:303] Enter number of iterations
	1000000
	2013-01-29 22:08:56.054 FoundationClasses[16749:303] You have chosen 1000000 iterations
	2013-01-29 22:09:00.165 FoundationClasses[16749:303] Counted 1000000 objects in immutable array in 0.003379 seconds
	2013-01-29 22:09:00.166 FoundationClasses[16749:303] Counted 1000000 objects in mutable array in 0.003340 seconds
	2013-01-29 22:09:00.166 FoundationClasses[16749:303] Created 1000000 normal C integers in 0.002594 seconds
	2013-01-29 22:09:00.166 FoundationClasses[16749:303] Wrapped 1000000 normal integers in NSNumbers using factory method in 0.038028 seconds
	2013-01-29 22:09:00.167 FoundationClasses[16749:303] Wrapped 1000000 normal integers in NSNumbers using instance method in 0.012007 seconds
	2013-01-29 22:09:00.167 FoundationClasses[16749:303] Looped through 1000000 objects in immutable dictionary in 1.088304 seconds
	2013-01-29 22:09:00.167 FoundationClasses[16749:303] Looped through 1000000 objects in mutable dictionary in 1.170044 seconds

	2013-01-29 22:09:16.871 FoundationClasses[16800:303] Enter number of iterations
	10000000
	2013-01-29 22:09:18.144 FoundationClasses[16800:303] You have chosen 10000000 iterations
	2013-01-29 22:10:35.389 FoundationClasses[16800:303] Counted 10000000 objects in immutable array in 0.032840 seconds
	2013-01-29 22:10:35.390 FoundationClasses[16800:303] Counted 10000000 objects in mutable array in 0.041802 seconds
	2013-01-29 22:10:35.390 FoundationClasses[16800:303] Created 10000000 normal C integers in 0.022491 seconds
	2013-01-29 22:10:35.391 FoundationClasses[16800:303] Wrapped 10000000 normal integers in NSNumbers using factory method in 0.386634 seconds
	2013-01-29 22:10:35.391 FoundationClasses[16800:303] Wrapped 10000000 normal integers in NSNumbers using instance method in 0.123448 seconds
	2013-01-29 22:10:35.391 FoundationClasses[16800:303] Looped through 10000000 objects in immutable dictionary in 20.636197 seconds
	2013-01-29 22:10:35.392 FoundationClasses[16800:303] Looped through 10000000 objects in mutable dictionary in 21.362013 seconds

From the results we see it is actually a bit faster to loop through the elements in an immutable array compared to a mutable array. This should also be the case since mutable objects are normally faster to loop through because of their fixed size. But we see as well that it is actually quite fast to use a mutable form as well, so it is not a massive amount of time that can be saved by switching from a mutable to a immutable. Not that suprisingly we see that it is way faster to save numbers as normal C integers compared to wrapping the number inside a NSNumber object. So this should be considered when using integers. It is also more than twice as fast to use the instance method than the factory method to create NSNumber objects. The dictionarys took much longer time than the other collection objects i have used to loop through. We see that again the immutable version is a bit faster to loop through than the mutable but the main point to state here is that it should really be considered when using a dictionary since the looping through using keys is quite slow compared to an array for example.

In terms of complexity of the Foundation classes tested above, we can see that the take consumption for array operations and number operations are almost growing linearly with respect to the number of iterations. This means that the time spent pr operation is almost the same for these no matter how many iterations we are performing. The same thing applies to the dictionary operations performed until we reach between 1000000 and 10000000 operations. Then the overall time spent in these operations suddently increases rapidly and when trying to do 100000000 operations (ten times more), then the program will just become unstable and it looks like too much memory is consumed.

Blocks
------
In this part of the test i will have a look at the time consumption when using blocks. I will run a few simple operations. First i will do this directly in the main file, second i will do this using an instance method and third i will do this inside a block. I will do these three steps to see if it's faster to use blocks than placing the operations inside a method for itself.

	2013-01-27 15:12:09.343 Blocks[20338:303] Enter number of iterations
	1000000
	2013-01-27 15:12:11.437 Blocks[20338:303] You have chosen 1000000 iterations
	2013-01-27 15:12:11.455 Blocks[20338:303] Performed normal operations 1000000 times and spent 0.003013 seconds doing it
	2013-01-27 15:12:11.455 Blocks[20338:303] Performed method calls for normal operation 1000000 times and spent 0.006814 seconds doing it
	2013-01-27 15:12:11.455 Blocks[20338:303] Performed operations in block 1000000 times and spent 0.003479 seconds doing it
	
The results above speak for themself. It is almost twice as fast to place the operations inside a block than sending a message to an instance of an object performing them. We see as well that it only takes a tiny bit of extra time to place the code inside a block compared to having the code directly in the main. This is why blocks are such a powerful tool in objective-C. They are kinda like object methods but they are much faster.

Protocols
---------
In this part of the test we will have a look at whether it will cost extra time to use protocols. First we will compare the time spent when calling an instance method on an object that doesn't implement any protocols against one that does. Hereafter we will compare the performance results of using one long protocol against using several smaller ones that combined does the same thing.

	2013-01-27 20:28:12.453 Protocols[51167:303] Calling instance method with no protocols started
	2013-01-27 20:28:12.454 Protocols[51167:303] I ain't bound by any protocols
	2013-01-27 20:28:12.455 Protocols[51167:303] Calling instance method with no protocols finished
	2013-01-27 20:28:12.455 Protocols[51167:303] Calling instance method with one small protocol started
	2013-01-27 20:28:12.455 Protocols[51167:303] One protocol is what i responds to
	2013-01-27 20:28:12.456 Protocols[51167:303] Calling instance method with one small protocol finished
	2013-01-27 20:28:12.456 Protocols[51167:303] Calling instance methods from one long protocol started
	and i will strike own upon thee with great vengeance and furious anger those who attempt to poisen and destroy my brothers and you will know my name is the lord when i lay my vengeance upon you 2013-01-27 20:28:12.457 Protocols[51167:303] Calling instance methods from one long protocol finished
	2013-01-27 20:28:12.457 Protocols[51167:303] Calling  instance methods with many protocols started
	and i will strike own upon thee with great vengeance and furious anger those who attempt to poisen and destroy my brothers and you will know my name is the lord when i lay my vengeance upon you 2013-01-27 20:28:12.458 Protocols[51167:303] Calling  instance methods with many protocols finished
	2013-01-27 20:28:12.458 Protocols[51167:303] Time spent calling instance method with no protocols: 0.000392
	2013-01-27 20:28:12.458 Protocols[51167:303] Time spent calling instance method with one protocol: 0.000405
	2013-01-27 20:28:12.459 Protocols[51167:303] Time spent calling several instance methods with one long protocol: 0.000116
	2013-01-27 20:28:12.459 Protocols[51167:303] Time spent calling several instance methods with many protocols: 0.000126
	
From the result above we can see why protocols are so often used in objective-C. It only takes a tiny amount of extra time to implement a method from a protocol than without a protocol. The same result applies to when we are implementing many methods at the same time. It takes almost the same time to spread the methods into several smaller protocols instead of having all of them in one large protocol. So this is often preferable to do.