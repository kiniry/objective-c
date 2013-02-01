Assignment 5
============

The purpose with Assignment 5 is to design and implement an already know API from java to Objective-C. 
I have choosen to implement the java.util.Random from JRE System Library (JavaSE-1.7). 
Not all methods are implemented in the classes. These methods will just send out a NSLog message saying "unimplmented" and make a 'false' assertion.
The java.util.Random class is a API to create random numbers in Java. 


Implementation
--------------
So far have I implemented most of the methods of the Random API Class. I have not implemented the nextBytes method do to it's syntax. I'm not sure how to implemented since it's a void method that does not return any value. It's taking in a pointer to an array of bytes and then chance the values in the array.
    public void nextBytes(byte[] bytes) {
        for (int i = 0, len = bytes.length; i < len; )
            for (int rnd = nextInt(),
                     n = Math.min(len - i, Integer.SIZE/Byte.SIZE);
                 n-- > 0; rnd >>= Byte.SIZE)
                bytes[i++] = (byte)rnd;
    }

The Java implementation of the Random API are using AtomicLong values which is a special java class for long values that are atomic. In Objective-C, we have the possiblity to make properties atomic, so I have made two properties for the AtomicLong variables 'seed' and 'seedUniquifier'. These two properties are private. The Java AtomicLong class have the method 'compareAndSet' which are used in the 'next:(int)bits' method, so I have implemeted the 'compareAndSet' method in the Random class as well.
	

Testing of the API
------------------
I have made some different tests of the methods i have implemented in the Random class so far.

#### Output:
	2013-02-01 19:05:21.294 Assignment5[11648] START TEST 1.0
	2013-02-01 19:05:21.353 Assignment5[11648] Random Number 1 = 13408
	2013-02-01 19:05:21.376 Assignment5[11648] Random Number 2 = -11976
	2013-02-01 19:05:21.401 Assignment5[11648] Random Number 3 = -22004
	2013-02-01 19:05:21.424 Assignment5[11648] Random Number 4 = -29869
	2013-02-01 19:05:21.451 Assignment5[11648] END TEST 1.0
	2013-02-01 19:05:21.469 Assignment5[11648] START TEST 1.1
	2013-02-01 19:05:21.489 Assignment5[11648] Random Number 1 = 1
	2013-02-01 19:05:21.509 Assignment5[11648] Random Number 2 = 7
	2013-02-01 19:05:21.531 Assignment5[11648] Random Number 3 = 7
	2013-02-01 19:05:21.551 Assignment5[11648] Random Number 4 = 4
	2013-02-01 19:05:21.572 Assignment5[11648] END TEST 1.1
	2013-02-01 19:05:21.590 Assignment5[11648] START TEST 1.2
	2013-02-01 19:05:21.609 Assignment5[11648] Random Number 1 = -3913
	2013-02-01 19:05:21.635 Assignment5[11648] Random Number 2 = 14910
	2013-02-01 19:05:21.658 Assignment5[11648] Random Number 3 = -31998
	2013-02-01 19:05:21.678 Assignment5[11648] Random Number 4 = 4678
	2013-02-01 19:05:21.700 Assignment5[11648] END TEST 1.2
	2013-02-01 19:05:21.718 Assignment5[11648] START TEST 1.3
	2013-02-01 19:05:21.737 Assignment5[11648] Random Boolean 1 = 1
	2013-02-01 19:05:21.759 Assignment5[11648] Random Boolean 2 = 1
	2013-02-01 19:05:21.779 Assignment5[11648] Random Boolean 3 = 1
	2013-02-01 19:05:21.802 Assignment5[11648] Random Boolean 4 = 1
	2013-02-01 19:05:21.822 Assignment5[11648] END TEST 1.3
	2013-02-01 19:05:21.840 Assignment5[11648] START TEST 1.4
	2013-02-01 19:05:21.857 Assignment5[11648] Random Number 1 = 0.000007
	2013-02-01 19:05:21.884 Assignment5[11648] Random Number 2 = 0.000004
	2013-02-01 19:05:21.910 Assignment5[11648] Random Number 3 = 0.000001
	2013-02-01 19:05:21.938 Assignment5[11648] Random Number 4 = 0.000005
	2013-02-01 19:05:21.980 Assignment5[11648] END TEST 1.4
	2013-02-01 19:05:22.003 Assignment5[11648] START TEST 1.5
	2013-02-01 19:05:22.024 Assignment5[11648] Random Number 1 = inf
	2013-02-01 19:05:22.047 Assignment5[11648] Random Number 2 = -inf
	2013-02-01 19:05:22.073 Assignment5[11648] Random Number 3 = -inf
	2013-02-01 19:05:22.101 Assignment5[11648] Random Number 4 = inf
	2013-02-01 19:05:22.125 Assignment5[11648] END TEST 1.5
	2013-02-01 19:05:22.147 Assignment5[11648] START TEST 1.6
	2013-02-01 19:05:22.281 Assignment5[11648] Random Number 1 = nan
	2013-02-01 19:05:22.302 Assignment5[11648] Random Number 2 = nan
	2013-02-01 19:05:22.323 Assignment5[11648] Random Number 3 = nan
	2013-02-01 19:05:22.363 Assignment5[11648] Random Number 4 = nan
	2013-02-01 19:05:22.390 Assignment5[11648] END TEST 1.6
	2013-02-01 19:05:22.412 Assignment5[11648] Test Done!

It's seems like the methods are working both for a class with a specified seed and one with a seed that the init of the class are generating. 
The nextDouble and nextGaussian are not given the output that I expected. For some reason it's not sending out a double value but a string saying the number is infinity for the nextDouble and NaN for nextGaussian which means that the number is an undefined or unrepresentable vlaue. So far, I have not been able to figure out why it's not printing correctly.
