REFLECTIONS

Two implementations have been made in this assignment:
 - A dynamic programming approach to the 0-1 Knapsack problem
 - The Levenshtein distance using memoization

The time complexity for the Knapsack solution is O(nW) where n is the
amount of items that can be stored in the knap sack and W is the amount
of items that need to be examined. The solution uses regular C-arrays
and not NSArray. A quick performance test showed that a plain C-array
was much faster to solve the Knapsack problem than a NSArray. 207ms
vs a test where the NSMutableArray did not even finish after a couple
of minutes. The test results can be found in the Instruments folder.

The Levenshtein distance implementation used to test the cost of blocks,
method invocation vs macro. Also it was used to test string manipulation.
The different variants had the following running times. The test results
can be found in the Instruments folder:
 - Macro: 8503ms
 - Blocks: 9020ms
 - Method invocation: 9069ms

Which indicates that they are almost equally fast but the macro is a bit
faster. This is probably because the expansion of the used macro yields
a simple if sentence whereas there is a small overhead of invoking a 
function or an inline-block.

The string manipulation seems to be quite fast when using the characterAtIndex
method of NSString.