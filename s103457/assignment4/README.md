# Homework Assignment #4: Performance Myths and Realities

In this assignment coding experiments are made and analysed based on performance measurements. The code experiments are executed in ```main.m``` and the printed performance measurements can be seen in ```DATA.md```

## String manipulations

To test the performance of string manipulations, experiments with appending, removing and finding substrings have been executed and measured. The tests consists of different values of the maximum string lengths all with the same amount of string manipulations statements.

From the data in ```DATA.md``` it seems that the append operation is constant independent of the length of the string. This is propably because it keeps a pointer to the last index of the string to optimize queries such as this and the ```length```-operation.

The remove and substring operations aren't exactly like that. For small strings up to about 5000 characters, these operations are constant. But with string sizes above this, they become more and more expensive and with strings with length larger than about 16000, the running time start becomming linear with regards to the length of the string, meaning ```O(l)```, where ```l``` is the length of the string.

## Recursion

To test recursion, a naive version of the fibonacci number calculation is implemented. It consists of a base case, where it just returns 1 as a constant and a recursive case, where it calls itself twice and adds up.

By calling itself twice on each call, it results in an exponential running time, meaning that the complexity is ```O(2^n)``` for calculating the fibonacci number for index n.

The performance of executing this fibonacci algorithm is following an exponential growth rate, meaning that it follows the complexity. By this it can more or less be concluded that it doesn't give a penalty for exponentially recursive formulas. Even though it got the time to fill the call stack, it didn't crash or slowed down the computer. This could be, because the Apple runtime have got some kind of optimization to preventing stack overflow.
