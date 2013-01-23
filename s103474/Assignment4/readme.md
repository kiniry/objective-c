# Assignment 4: Performance measurements

## Part 1: String manipulations

The Objective-C command line utility called `ass4strings` has been created for this purpose. It creates an `NSMutableString` and runs a loop over the string determined by the amount of iterations given as command line argument (most of these programs take this command line argument). The loop runs in this manner, as long as iterations are left: It adds a 1000 characters to it one by one (using one loop iteration for each), then removes 1000 characters from it one by one. This is done in order to simulate real life string manipulation, which may not be *just* adding or *just* removing, and it also results in a string that does not go over the character limit (which I found to be 50 thousand characters).

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

In the command line utility called `ass4stack` which I created, no clear answer resulted. I created a method that looped infinitely, writing an incrementing static integer to `stdout` at every iteration. I've attached an Instruments screen shot in the `ass4stack` subfolder, showing that it just keeps on going for minutes and never crashes. I think there might be some optimization present that I am not aware of. Either that or the method is way too simple to take up any noticable space on my stack, which is of size:

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

However, consistently slower is the introspection part, which is very interesting indeed. Introspection is often a considered good practice in Objective-C, making sure that an object is the right kind of object before sending messages to it, preventing crashes. It is clear here that it comes with a cost. Especially `-respondsToSelector:` is slow in this context; `-isKindOfClass:` responds much quicker. It can be argued in the above situation that only *one* of the introspection methods need to be used, as they help with the same kind of thing. Both were added in this special test case to make it more complete.

## Part 5: Enumerations and iterations

This part of the assignment concerns enumerating over a given ordered data type. I experimented with `NSSet`, as this is the top-most ordered data type ("collection") in Objective-C. In general, there were two methods of enumeration/iteration in Objective-C before the arrival of version 2.0 of the language, and one additional after the release of this version. The different enumeration methods I tried were:

1. **Old-style iteration:** A simple `for(int i = 0; i < iterations; i++)` loop, which requires a conversion to `NSArray`.
2. **Old-style enumeration:** The normal way to enumerate in Objective-C before version 2.0, which uses an `NSEnumerator` object and a `while` loop that uses its `-nextObject:` method.
3. **Fast enumeration:** The new (and preferred) way to enumerate over a collection in Objective-C 2.0, structured like a `for..in` loop in code. Many optimizations under the hood.

I had a (perhaps obvious) hypothesis that the third method would be the fastest. As it turns out, I was correct, which both the `Instruments.png` screen shot and the below command line output show:

	2013-01-23 14:58:38.107 Ass4Enumerations[26972:303] Starting part 1 (old-style iteration).
	2013-01-23 14:58:38.150 Ass4Enumerations[26972:303] Done with part 1! Time passed: 40.81 ms.
	2013-01-23 14:58:38.151 Ass4Enumerations[26972:303] Starting part 2 (old-style enumeration).
	2013-01-23 14:58:38.223 Ass4Enumerations[26972:303] Done with part 2! Time passed: 71.65 ms.
	2013-01-23 14:58:38.223 Ass4Enumerations[26972:303] Starting part 3 (fast enumeration).
	2013-01-23 14:58:38.241 Ass4Enumerations[26972:303] Done with part 3! Time passed: 17.12 ms.

Most interesting, perhaps, is that the normal way of enumerating over a set is much slower than the plain old C-style `for` loop version, even when the latter involves a conversion between `NSSet` and `NSArray` (which takes up a over half of this method's running time, according to Instruments). This was truly not a good solution.

But of course it's very clear that fast enumeration really is worth it.

## Part 6: Foundation framework

I've defined the core classes to look at in this part as the following three classes: `NSString`, `NSArray` and `NSDictionary`. The methods I've decided to look at for each, are:

1. The `+stringByPaddingToLength:withString:startingAtIndex:` factory method in the `NSString` class to create a repeated string (number of iterations vary length of created string)
2. The `-count` method in an `NSArray` object instance (number of iterations vary number of elements in array)
3. The `-writeToFile:atomically:` method in an `NSDictionary` object instance (number of iterations vary length of dictionary)

Since these are three very different methods, it's especially very interesting to look at their complexity once the input intensity changes (handled with the `iterations` command line argument as a valve for their different complexity aspects). And once we do a couple of runs of the `main.m` file of this part of the assignment, it's clear what the different complexities are:

	2013-01-23 16:16:36.941 Ass4Foundation[28234:303] 100000 iterations.
	2013-01-23 16:16:36.943 Ass4Foundation[28234:303] Starting part 1 (NSString repeat).
	2013-01-23 16:16:36.945 Ass4Foundation[28234:303] Done with part 1! Time passed: 1.67 ms.
	2013-01-23 16:16:36.955 Ass4Foundation[28234:303] Starting part 2 (NSArray count).
	2013-01-23 16:16:36.956 Ass4Foundation[28234:303] Done with part 2! Time passed: 0.01 ms.
	2013-01-23 16:16:37.209 Ass4Foundation[28234:303] Starting part 3 (NSDictionary file writing).
	2013-01-23 16:16:37.710 Ass4Foundation[28234:303] Done with part 3! Time passed: 499.79 ms.
	
	2013-01-23 16:17:16.013 Ass4Foundation[28274:303] 1000000 iterations.
	2013-01-23 16:17:16.015 Ass4Foundation[28274:303] Starting part 1 (NSString repeat).
	2013-01-23 16:17:16.031 Ass4Foundation[28274:303] Done with part 1! Time passed: 15.73 ms.
	2013-01-23 16:17:16.127 Ass4Foundation[28274:303] Starting part 2 (NSArray count).
	2013-01-23 16:17:16.128 Ass4Foundation[28274:303] Done with part 2! Time passed: 0.01 ms.
	2013-01-23 16:17:18.669 Ass4Foundation[28274:303] Starting part 3 (NSDictionary file writing).
	2013-01-23 16:17:23.868 Ass4Foundation[28274:303] Done with part 3! Time passed: 5198.16 ms.
	
	2013-01-23 16:17:35.658 Ass4Foundation[28302:303] 10000000 iterations.
	2013-01-23 16:17:35.660 Ass4Foundation[28302:303] Starting part 1 (NSString repeat).
	2013-01-23 16:17:35.802 Ass4Foundation[28302:303] Done with part 1! Time passed: 141.37 ms.
	2013-01-23 16:17:36.728 Ass4Foundation[28302:303] Starting part 2 (NSArray count).
	2013-01-23 16:17:36.729 Ass4Foundation[28302:303] Done with part 2! Time passed: 0.01 ms.
	2013-01-23 16:18:18.402 Ass4Foundation[28302:303] Starting part 3 (NSDictionary file writing).
	2013-01-23 16:19:38.726 Ass4Foundation[28302:303] Done with part 3! Time passed: 80323.91 ms.

Here it is clear to see the complexities of the various methods. The `NSString` repeater method and the `NSDictionary` write to file method both have approximately linear complexity O(n), while the `NSArray` element count method has a constant complexity O(1). Clearly, the element count is cached somewhere.

These are all expected complexities. There is really nothing significant here.


