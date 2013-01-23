# Assignment 4: Performance measurements

## Part 1: String manipulations

The Objective-C command line utility called `ass4strings` has been created for this purpose. It creates an `NSMutableString` and runs a loop over the string determined by the amount of iterations given as command line argument. The loop runs in this manner, as long as iterations are left: It adds a 1000 characters to it one by one (using one loop iteration for each), then removes 1000 characters from it one by one. This is done in order to simulate real life string manipulation, which may not be *just* adding or *just* removing, and it also results in a string that does not go over the character limit (which I found to be 50 thousand characters).

In order to determine absolute time given on the addition and removal operations, the application was time profiled with 10 million iterations (resulting in 5 million additions and 5 million removals). Looking at the Instruments results view (see the `Instruments.png` file in each section's assignment 4 subfolder), the addition operations took 277 ms time (31.7%), while the removal operations took 472 ms time (54.1%). This results in the following calculation for the (average) time for the string operations:

* Addition of one character to `NSMutableString`: 277 ms / 5 M operations = **55.4 ns**
* Removal of one character from `NSMutableString`: 472 ms / 5 M operations = **94.4 ns**

In terms of its relative time (code complexity), the program was run with an input progressively 10 times larger, with the following output:

	andy$ ./ass4strings 100000
	2013-01-23 12:03:34.426 ass4strings[23972:707] Before
	2013-01-23 12:03:34.438 ass4strings[23972:707] Done! Time passed: 10.09 ms
	andy$ ./ass4strings 1000000
	2013-01-23 12:03:37.554 ass4strings[23974:707] Before
	2013-01-23 12:03:37.643 ass4strings[23974:707] Done! Time passed: 87.13 ms
	andy$ ./ass4strings 10000000
	2013-01-23 12:03:39.866 ass4strings[23975:707] Before
	2013-01-23 12:03:40.698 ass4strings[23975:707] Done! Time passed: 829.71 ms
	andy$ ./ass4strings 100000000
	2013-01-23 12:03:47.077 ass4strings[23977:707] Before
	2013-01-23 12:03:55.212 ass4strings[23977:707] Done! Time passed: 8132.57 ms
	andy$ ./ass4strings 1000000000
	2013-01-23 12:04:15.639 ass4strings[23981:707] Before
	2013-01-23 12:05:38.237 ass4strings[23981:707] Done! Time passed: 82596.29 ms

Here it is clear to see that the running time increases almost tenfold every time the input amount increases tenfold. Thus, it is reasonable to conclude that string manipulation running time in Objective-C increases linearly; that is to say, O(n).


## Part 2: Recursion depth

In the command line utility called `ass4stack` which I created, no clear answer resulted. I created a method that looped infinitely, calling an incrementing static integer to the command line at every iteration. I've attached an Instruments screen shot in the `ass4stack` subfolder, showing that it just keeps on going for minutes and never crashes. I think there might be some optimization present that I am not aware of. Either that or the method is way too simple to take up any noticable space on my stack, which is of size:

	andy$ ulimit -s
	8192

## Part 4: Method invocation costs

In this part of the assignment, I ran object and class methods in five ways, determined from the assignment description. These five ways were:

1. Sending a message to a method on an object instance normally
2. Sending a message to a method on an object instance using a selector (with `-performSelector:`)
3. Sending a message to a method on a class normally
4. Sending a message to a method on a class using a selector (with `+class` and `-performSelector:`)
5. Sending a message to a method on an object instance normally, after introspecting (using `-isKindOfClass:` and `-respondsToSelector:`)

The results are shown in the `Instruments.png` screen shot belonging to this part of the assignment, and in the command line output below:

	2013-01-23 14:10:09.251 Ass4Invocations[25912:303] Starting part 1 (object method calls).
	2013-01-23 14:10:09.261 Ass4Invocations[25912:303] Done with part 1! Time passed: 7.45 ms.
	2013-01-23 14:10:09.261 Ass4Invocations[25912:303] Starting part 2 (object method selector calls).
	2013-01-23 14:10:09.272 Ass4Invocations[25912:303] Done with part 2! Time passed: 10.24 ms.
	2013-01-23 14:10:09.272 Ass4Invocations[25912:303] Starting part 3 (class method calls).
	2013-01-23 14:10:09.279 Ass4Invocations[25912:303] Done with part 3! Time passed: 6.25 ms.
	2013-01-23 14:10:09.279 Ass4Invocations[25912:303] Starting part 4 (class method selector calls).
	2013-01-23 14:10:09.290 Ass4Invocations[25912:303] Done with part 4! Time passed: 9.74 ms.
	2013-01-23 14:10:09.290 Ass4Invocations[25912:303] Starting part 5 (introspection object method calls).
	2013-01-23 14:10:09.317 Ass4Invocations[25912:303] Done with part 5! Time passed: 26.46 ms.
	
Perhaps obviously, it takes a longer time to call a method using a selector than it does directly. The compiler can apply all sorts of tricks to the direct method calls, as they are known at compile time while the selector method calls are (at least theoretically) not. Interestingly, it also seems like class methods take a shorter time to call than object instance methods. I'm not sure that's a good conclusion to derive from these data, as I think the small difference here is within the percent uncertainty for this statistical sampling due to noise.

However, consistently slower is the introspection part, which is very interesting indeed. Introspection is often a considered good practice in Objective-C, making sure that an object is the right kind of object before sending messages to it, preventing crashes. It is clear here that it comes with a cost. Especially `-respondsToSelector:` is slow in this context; `-isKindOfClass:` responds much quicker. It can be argued in the above situation that only *one* of the introspection methods need to be used, as they help with the same kind of thing. Both were added in this test case to make it more complete.