/**
 * Assignment 4 - Performance testing and analyzing
 */
 Blocks:
 
The first tests goes on testing if the same method call is affected by being run inside of a block (in time). 
In this test I'm looking at NSLog method which is first called by it self, then its called inside a method in a class implementation
and then its called by itself inside a block and then the method call inside a block aswell.
As the result shows there is not the most of differences in the time it takes to run the different calls so my conclusion is that there is not really 
any performance loss in running time when running simple calls inside of a block compared to just runníng it.
 
 Assignment4[2657:303] NSLog took: 0.11 ms to call 100 times
 Assignment4[2657:303] NSLog in a class method takes 0.15 ms to call 100 times
 Assignment4[2657:303] NSLog in a block takes 0.13 ms to call 100 times
 Assignment4[2657:303] NSLog in class method a block takes 0.11 ms to call 100 times
 
 The next block test is to see if the amount of stuff inside a block might affect how much time it uses each time the block is called. The first 2 tests
 is run with only integers to test if external call affects the running time, it apparently doesnt (also shown in the ealier example). 
 The latter 2 is trying to increase the memory usage of the block to see if that might have an effect, and as it turns out that actually has an effect. This means that
 when increasing the amount of memory a block uses, it requires some more time to compute (naturally since all the elements is actually allocated inside of the block). 
 So it actually acts as I would expect. 
 
 Assignment4[2657:303] Adding to locally integers inside block took 0.009 ms
 Assignment4[2657:303] Adding to external integers inside block took 0.009 ms
 Assignment4[2657:303] Calling a block with 3 string and 3 arrays 100 times took 0.191 ms
 Assignment4[2657:303] Calling a block with 3 mutablestring and 9 mutablearrays 100 times took 0.370 ms
 
 
 Invocation:
 
 Performance checking invokations is done based on the differnt types of invokations available. First by invoking the method directly and then when using "performSelector" function.
 This seemes not to matter how to invoke a method on an object. The last two outputs is based on the idea that Objective-c has the ability of protocols and such so there is available
 a set of methods to check whether a class is actually what is supposed to be and also check if that class actually responds to the method about to be invoked. The check here should 
 show the overhead introduced by those sanity checks. 
 
 Assignment4[2949:303] Method invocation: 0.16 ms to call 100 times
 Assignment4[2949:303] Method performselector: 0.12 ms to call 100 times
 Assignment4[2949:303] Class selector: 0.03 ms to call 100 times
 Assignment4[2949:303] Reflection on first call (putting it all together): 0.14 ms to call 100 times
 
 
 Analyzing using instruments:
 
 Most of these test I find too small to analyze in the Instruments tool so I have chosen not to do that. I have used Instruments on projects like iPhone app for "Sticks n Sushi" and "Dagblade Børsen" 
 to detect leaks, figure out what parts of the code is running so damn slow and generally just check and analyze if the written code is performing inside what is considered as "OK". 
 The think I like most with the Instruments tool is that it is actually a recording which is created so I can recreate or replay the interactions so it is possible to look on a snapshot "in time" which 
 is pretty useful when debugging an iPhone app used by a test-person.
 
 
 