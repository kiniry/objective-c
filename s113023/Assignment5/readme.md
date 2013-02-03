Assignment5
===========

Assignment Description
----------------------
The purpose of this assignment was to design and implement an API in Objective-C. I have chosen to port a Java API to Objective-C. I have chosen to implement the Java class that generates random numbers. This class can be found in the Java.util package and is called Random.class. This package is all part of the JRE System Library found in JavaSE-1.7. I haven't implemented all methods from the class since some of them are dealing with Serialization which is a subject that i haven't had any experience with yet since I'm still a junior programmer. The unimplemented methods will just output "Not implemented" in the log, using NSLog.

Implementation
--------------
The Java implementation does a lot of use of the AtomicLong class. As far as i have understood this class is just for creating objects holding a long value, but these longs are declared as atomic, which will result in thread-safety. We already have the oppertunity to specify a normal C-type long with the "atomic" property in Objective-C, so this is what i have done when Java uses instances of the AtomicLong class. I have two long properties that have been declared as atomic: "seed" & "seedUniquifier", both of these properties have been placed in the implementation file Random.m and thereby making them private. I have implemented the Java method compareAndSet(), which is a method found in the AtomicLong class, too. This method has just been implemented directly in the Random class written by me. Some of the methods from Java has been simplified a bit to make it easier to port the whole class. Because of this i haven't put a great focuse on many of the thread-safety aspects that are present in the Java implementation of the Random class, my focus has been on the ability to generate random numbers of different types and getting this part to work. Afterall I'm not currently programming a big concurrent program that requires a high level of tread-safety awareness in the methods.

Test results
------------
I made some test-cases to test whether my class was implemented correctly when it comes to generating pseudo-random numbers that doesn't follow an obvious pattern. To test that i didn't get the same numbers over and over again, I did some different test. First I created an instance of the Random object using the ´-(id)init´ method, without a specific seed to test if the program was able to keep generating different pseudo random numbers of different types. Here are the test results from the first part, whitout a user-specified seed:

	---/ Random integers /---
	901102246
	-670619617
	-700933231
	932598471
	-------------------------
	
	---/ Random integers with specified max /---
	3 (max: 5)
	1 (max: 4)
	2 (max: 3)
	--------------------------------------------
	
	---/ Random longs /---
	4371022529142667530
	-3019478166864401065
	7687328484385404413
	----------------------
	
	---/ Random booleans /---
	0
	1
	1
	--------------------------
	
	---/ Random floats /---
	0.836770
	0.960123
	0.832876
	-----------------------
	
	---/ Random doubles /---
	0.244153
	0.008002
	0.357098
	-------------------------
	
	---/ Random gaussian doubles /---
	-0.037982
	1.108996
	1.373238
	---------------------------------

My conclusion on the first part was that it seemed that the numbers were generated correctly in the sense that the same numbers didn't keep reappering all over, and the numbers didn't exceed max values specified an such.

The next part of the test i kept creating random instances of the Random class to test that the random seed generation worked correctly:

	---/ Random integers /---
	101933908
	-501779688
	-1419598091
	533648706
	-------------------------
	
	---/ Random integers /---
	175805696
	983481120
	502296328
	1349006986
	-------------------------
	
	---/ Random integers /---
	184654921
	177139649
	933849856
	-477107322
	-------------------------

So far so good. The different instances seems to be created correctly with different random seeds.

The last test was to create an instance of the class using a user-specified seed. This is done by initialising the random object instance with the method ´-(id)initWithSeed:(long)seed´. This test was done to make sure that the Java version and the Objective-C version would generate the same numbers when given the same seed:

From the implementations i got the following numbers when using seed '454545'. Java to the left, Objective-C to the right:

	---/ Random integers /---								---/ Random integers /---
	-283383058												-283383058
	-1213786865												-1213786865
	-1449291964												-1449291964
	-662243757												-662243757
	-------------------------								-------------------------
	
	---/ Random integers with specified max /---			---/ Random integers with specified max /---
	0														0 (max: 2)
	7														7 (max: 30)
	4														4 (max: 10)
	--------------------------------------------			--------------------------------------------
	
	---/ Random longs /---									---/ Random longs /---
	-5632223690490763905									-5632223690490763905
	6731072102991342976										6731072102991342976
	4755427282172331359										4755427282172331359
	----------------------									----------------------
	
	---/ Random booleans /---								---/ Random booleans /---
	false													0
	true													1
	true													1
	--------------------------								--------------------------
	
	---/ Random floats /---									---/ Random floats /---
	0.5434988												0.543499
	0.83245087												0.832451
	0.60090125												0.600901
	-----------------------									-----------------------											
	
	---/ Random doubles /---								---/ Random doubles /---
	0.9640219391030193										0.9640219391030193
	0.8622085547281125										0.8622085547281125
	0.03555287075075608										0.0355528707507561
	-------------------------								-------------------------
	
	---/ Random gaussian doubles /---						---/ Random gaussian doubles /---
	0.37202709319016547										0.3720270931901655
	-0.587813149016941										-0.5878131490169410
	-1.3206693786889439										-1.3206693786889439
	---------------------------------						---------------------------------

As we can see above the Random implementation that I've made is working perfectly when compared to the Java version when initilized with a user-specified seed.