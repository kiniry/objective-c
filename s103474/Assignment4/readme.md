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
