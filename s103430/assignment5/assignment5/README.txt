/**
 *
 * Assignment 5
 * Created by Joachim Jensen
 *
 */

I have chosen java.util.Random from the Java language (obviously).
See http://docs.oracle.com/javase/6/docs/api/java/util/Random.html

The API consists of a single class that handles everything. It is, however,
not a static class, so one have to create an instance of the class in order
to calculate various random types. Additionally, it is not a singleton class
either, meaning that there can be several independent classes.

Looking at the source, one will notice that for the seed that are automatically
generated, the system time (calculated from january 1st 1970) is the major
influence. This combined with bitshifting and some calculation with tokens 
give the pseudorandom numbers.

Implementing the API in objective-c was pretty straight forward as most methods
deal with basic maths and bitshifting. The "static final" variables have
been implemented as "final const" because this simply was the easiest and cleanest
way to do so (taking in consideration that those variables should _not_ be changed).
Other than that, the private vs public has been respected, making an interface for the
public methods in the Random.h file and an interface for the private variables in the
Random.m file.

I have tried to imitate the AtomicLong class from Java with a primitive long and a
"compare" method in this implementation (all properties are atomic by default) which 
seems to have succeeded. 

In Java, some additional methods exist for serialization - these have been deemed
irrelevant in this assignment. Only the body of method "nextGaussian" has not
been implemented in the ported API.

The following is an example from running main.c that tests the methods of the
Random class:

	2013-02-03 20:33:09.963 assignment5[1901:11303] #### TEST 1 ####
         
         Random with no seed
         nextInt					11614
         nextLong				26908
         nextFloat				0.0000004172
         nextDouble				inf
         nextIntWithMaxVal:10	2
         nextBoolean:			1
         2013-02-03 20:33:09.965 assignment5[1901:11303] #### TEST 2 ####
         
         Random with seed 100
         nextInt					8150
         nextLong				52985
         nextFloat				0.0000059009
         nextDouble				inf
         nextIntWithMaxVal:10	2
         nextBoolean:			1