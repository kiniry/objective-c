Assignment 4
============

The purpose with Assignment 4 is to experiment with performace and memory consumption. For this have I implementet some test programs for testing string manipulation, method invocation, enumerations/iteration, and protocols.
Due to the fact that i'm using GNUstep on Windows, I have not been able to make measurements on memory consumption. Unfortunately, gprof is not the best for performance measurement. I have only made measurement for timing profile, and I have done it inline to output the result directly in the console. I used the NSDate class to measure the time.


String Manipulations
--------------------
This part of the test will examine the time consumption when we are doing string manipulations. I have made 4 test cases. Two test for MutableStrings with 100.000 and 1.000.000 iterations and two tests for ImmutableString with the same iterations as for the MutableString.

#### Output:
	2013-02-01 16:10:48.250 Assignment4[8084] START TEST 1.0
	2013-02-01 16:10:48.404 Assignment4[8084] END TEST 1.0
	2013-02-01 16:10:48.423 Assignment4[8084] START TEST 1.1
	2013-02-01 16:10:49.250 Assignment4[8084] END TEST 1.1
	2013-02-01 16:10:49.266 Assignment4[8084] START TEST 1.2
	2013-02-01 16:10:50.239 Assignment4[8084] END TEST 1.2
	2013-02-01 16:10:50.260 Assignment4[8084] START TEST 1.3
	2013-02-01 16:10:57.720 Assignment4[8084] END TEST 1.3
	2013-02-01 16:10:57.761 Assignment4[8084] TEST 1.0 - Timing Profile: 0.095000
	2013-02-01 16:10:57.790 Assignment4[8084] TEST 1.1 - Timing Profile: 0.808000
	2013-02-01 16:10:57.823 Assignment4[8084] TEST 1.2 - Timing Profile: 0.958000
	2013-02-01 16:10:57.884 Assignment4[8084] TEST 1.3 - Timing Profile: 7.440000
	2013-02-01 16:10:57.935 Assignment4[8084] Test Done!

As we can see it is much faster to appending on an mutable string than an immutable string in both cases. with 100.000 iterations, the mutable string are around 8 times faster than the immutable string.


Method Invocations
------------------
This part of the test will examine the time consumption when we are doing method invocations. I have made 5 test cases for testing of calling instance- and class methods directly and by using selectors and finally using introspection.

#### Output:
	2013-02-01 15:40:24.264 Assignment4[12824] START TEST 1.0
	2013-02-01 15:40:24.367 Assignment4[12824] END TEST 1.0
	2013-02-01 15:40:24.387 Assignment4[12824] START TEST 1.1
	2013-02-01 15:40:24.706 Assignment4[12824] END TEST 1.1
	2013-02-01 15:40:24.726 Assignment4[12824] START TEST 1.2
	2013-02-01 15:40:24.875 Assignment4[12824] END TEST 1.2
	2013-02-01 15:40:24.894 Assignment4[12824] START TEST 1.3
	2013-02-01 15:40:25.336 Assignment4[12824] END TEST 1.3
	2013-02-01 15:40:25.353 Assignment4[12824] START TEST 1.4
	2013-02-01 15:40:25.697 Assignment4[12824] END TEST 1.4
	2013-02-01 15:40:25.713 Assignment4[12824] TEST 1.0 - Timing Profile: 0.050000
	2013-02-01 15:40:25.735 Assignment4[12824] TEST 1.1 - Timing Profile: 0.295000
	2013-02-01 15:40:25.758 Assignment4[12824] TEST 1.2 - Timing Profile: 0.130000
	2013-02-01 15:40:25.781 Assignment4[12824] TEST 1.3 - Timing Profile: 0.423000
	2013-02-01 15:40:25.805 Assignment4[12824] TEST 1.4 - Timing Profile: 0.324000
	2013-02-01 15:40:25.828 Assignment4[12824] Test Done!

As we can see invoking class method takes a lot more time than instance methods. Using selectors for both instance methods and class method are even more expensive. The introsepction method takes the longest time for calling a instance method but when we are using dynamic typing, the introspection method can be a very good help to avoid program crashes.


Enumerations/Iterations
-----------------------
This part of the test will examine to use time consumption when we are doing Enumerations and Iterations.
I have made to tests. The first test is a normal standart access with a normal for-loop and a second test is for fast enumeation with the "for (id i in array)" loop.

#### Output:
	2013-02-01 15:00:23.027 Assignment4[7640] START INIT ARRAY
	2013-02-01 15:00:27.393 Assignment4[7640] INIT DONE!
	2013-02-01 15:00:27.410 Assignment4[7640] START TEST 1.1
	2013-02-01 15:00:27.475 Assignment4[7640] END TEST 1.1
	2013-02-01 15:00:27.491 Assignment4[7640] START TEST 1.2
	2013-02-01 15:00:27.528 Assignment4[7640] END TEST 1.2
	2013-02-01 15:00:27.544 Assignment4[7640] TEST 1.1 - Timing Profile: 0.047000
	2013-02-01 15:00:27.567 Assignment4[7640] TEST 1.2 - Timing Profile: 0.018000
	2013-02-01 15:00:27.591 Assignment4[7640] Test Done!

As we can see from the results, it turned out to be over twice as fast with the fast enumeration.


Protocols
---------
This part of the test will examine the time consumption when we are using protocols. I have made three test cases. 
The first test is for a class with just a simple instance method with no use of protocols, the second test is using one long protocol, and the last test is using several small protocols.

#### Output:
	2013-02-01 14:23:13.389 Assignment4[13716] START TEST 1.0
	2013-02-01 14:23:13.446 Assignment4[13716] Hello World!
	2013-02-01 14:23:13.466 Assignment4[13716] END TEST 1.0
	2013-02-01 14:23:13.486 Assignment4[13716] START TEST 1.1
	Test 1 Done! ; Test 2 Done! ; Test 3 Done! ; Test 4 Done! ; Test 5 Done! ; Test
	6 Done! ; Test 7 Done! ; Test 8 Done! ; Test 9 Done! ; Test 10 Done!
	2013-02-01 14:23:13.552 Assignment4[13716] END TEST 1.1
	2013-02-01 14:23:13.580 Assignment4[13716] START TEST 1.2
	Test 1 Done! ; Test 2 Done! ; Test 3 Done! ; Test 4 Done! ; Test 5 Done! ; Test
	6 Done! ; Test 7 Done! ; Test 8 Done! ; Test 9 Done! ; Test 10 Done!
	2013-02-01 14:23:13.669 Assignment4[13716] END TEST 1.2
	2013-02-01 14:23:13.703 Assignment4[13716] TEST 1.0 - Timing Profile: 0.020000
	2013-02-01 14:23:13.735 Assignment4[13716] TEST 1.1 - Timing Profile: 0.046000
	2013-02-01 14:23:13.767 Assignment4[13716] TEST 1.2 - Timing Profile: 0.064000
	2013-02-01 14:23:13.796 Assignment4[13716] Test Done!

As we can see from the results, the use of protocols are not using a big amount of extra time to implement and spreading the methods into several protocols are taking almost the same time compared to one big protocol.