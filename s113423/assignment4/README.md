## Method invocation
I've compared the different ways of calling a method,
as well as calling a function and a block.
Below are the average times (out of 100000000 iterations) of calling a method/function/block
in both Clang and GCC.

|                                               | clang    | gcc      |
|:--------------------------------------------- | --------:| --------:|
|                                      function |  5.68 ns |  8.38 ns |
|                                         block |  4.72 ns |  8.69 ns |
|                               instance method |  6.19 ns |  9.23 ns |
|                                  class method |  7.42 ns |  8.74 ns |
|                         instance method on id |  5.64 ns |  8.47 ns |
|                         class method on Class |  8.01 ns | 10.43 ns |
|              instance method performSelector: | 12.34 ns | 13.46 ns |
|                 class method performSelector: | 12.72 ns | 31.84 ns |
|        instance method performSelector: on id | 10.67 ns | 12.58 ns |
|        class method performSelector: on Class | 12.55 ns | 13.56 ns |
|                                               |          |          |
|           instance method respondsToSelector: | 16.86 ns | 15.08 ns |
|              class method respondsToSelector: | 16.05 ns | 14.88 ns |
|     instance method respondsToSelector: on id | 15.08 ns | 14.88 ns |
|     class method respondsToSelector: on Class | 15.44 ns | 14.86 ns |

The version compiled in GCC seems to be a bit slower at calling methods,
while introspection with `respondsToSelector:` is a bit faster.
Oddly though, `performSelector:` used directly on the class symbol
consistenly takes considerbly longer with GCC (~13 ns vs ~30 ns).


## String manipulation
I have compared the method `stringByAppendingString:` of `NSString` with `appendString:` of NSMutableString.
Below are the average times (1000 iterations) of appending to a string of different lengths.

#### Clang
| length | `stringByAppendingString:` | ratio | `appendString:` | ratio |
| ------:| --------------------------:| -----:| ---------------:| -----:|
|    100 |                  702.25 ns |     – |       104.94 ns |     – |
|    200 |                  954.51 ns | 01.36 |       113.11 ns | 01.08 |
|    400 |                  999.66 ns | 01.05 |       109.61 ns | 00.97 |
|    800 |                 1036.43 ns | 01.04 |       111.19 ns | 01.01 |
|   1600 |                 2061.06 ns | 01.99 |       111.69 ns | 01.00 |
|   3200 |                 2893.80 ns | 01.40 |       102.68 ns | 00.92 |
|   6400 |                 4295.90 ns | 01.48 |       104.61 ns | 01.02 |
|  12800 |                 8598.08 ns | 02.00 |       105.57 ns | 01.01 |
|  25600 |                14647.82 ns | 01.70 |       127.06 ns | 01.20 |
|  51200 |                33450.75 ns | 02.28 |       115.33 ns | 00.91 |
| 102400 |                62688.65 ns | 01.87 |       190.20 ns | 01.65 |
| 204800 |               146954.91 ns | 02.34 |       314.68 ns | 01.65 |
| 409600 |               297544.66 ns | 02.02 |       349.75 ns | 01.11 |
| 819200 |              3143454.38 ns | 10.56 |       267.16 ns | 00.76 |

#### GCC
| length | `stringByAppendingString:` | ratio | `appendString:` | ratio |
| ------:| --------------------------:| -----:| ---------------:| -----:|
|    100 |                  710.27 ns |     – |       115.34 ns |     – |
|    200 |                  764.29 ns | 01.08 |       125.75 ns | 01.09 |
|    400 |                  830.08 ns | 01.09 |       111.97 ns | 00.89 |
|    800 |                 1143.61 ns | 01.38 |       102.36 ns | 00.91 |
|   1600 |                 1683.99 ns | 01.47 |       101.79 ns | 00.99 |
|   3200 |                 2692.08 ns | 01.60 |        98.53 ns | 00.97 |
|   6400 |                 4179.09 ns | 01.55 |        88.65 ns | 00.90 |
|  12800 |                 8844.89 ns | 02.12 |       154.96 ns | 01.75 |
|  25600 |                20823.25 ns | 02.35 |       163.83 ns | 01.06 |
|  51200 |                50932.77 ns | 02.45 |       174.25 ns | 01.06 |
| 102400 |                83509.48 ns | 01.64 |       271.41 ns | 01.56 |
| 204800 |               179516.61 ns | 02.15 |       469.99 ns | 01.73 |
| 409600 |               362970.15 ns | 02.02 |       553.94 ns | 01.18 |
| 819200 |               853995.18 ns | 02.35 |       646.86 ns | 01.17 |

The method `stringByAppendingString:` seems to double in time when the input size doubles,
which means that its asymptotic time is most likely linear.
This is probably because the string needs to be copied and allocated into a new NSString.

The method `appendString:` seems to increase a bit when the input size doubles,
but the ratio stays around 1.00, which would mean that its asymptotic time is constant.
This is probably because the NSMutableString simply appends to the already allocated string.


## Iteration
I've compared the time it takes to iterate over an NSMutableArray of 1000000 elements
using a simple for-loop and indexing vs. using the fast enumeration syntax.

|                  | time        | ratio |
|:---------------- | -----------:| -----:|
| fast enumeration |  5064.13 ns |     – |
| simple indexing  | 11520.52 ns |  2.27 |

Fast enumeration appears to be more than twice as fast as using a for-loop with indexing.
