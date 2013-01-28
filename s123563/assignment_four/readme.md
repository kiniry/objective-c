I wanted to be looking at both space and time consumptions, but being on Windows using GNUstep, the memory monitoring proved ridiculously difficult. I have tried obtaining copies of the `mach/` header files (which allow you to programatically monitor simple memory usage), but something was always missing or the like. 

`gprof` is not excatly user friendly, and it doesn't seem to be geared toward Objective-C. You'll see a lot of calls to Obj-C runtime methods and some gcc stuff (like  `__gcc_deregister_frame`), which don't really make sense (to me, that is). But worst of all, there is no _memory_ profiling going on as far as I could tell. So that was sort of useless.

I settled on measuring only time profiles (except a few `sizeof`-ish things), and doing it inline, both because of the ease of it, and because I could then have the program output its results nicely.

I formatted the output of the programs to be more compact, but they are all copy/pasted from actual runs.


Method invocations
------------------

Invoking class methods is a lot more expensive than instance methods. And using selectors is again much more expensive. The output should be self-explanatory.

One interesting thing I found was that it is much faster to call methods by directly invoking the Objective-C implementation. This is because by doing it that way, you bypass the dynamic message responder lookup, and it's about 60% faster!

#### Output:

```
2013-01-28 19:25:02.513 Four[6304] --- Running method invocation tests ---
2013-01-28 19:25:02.517 Four[6304] run task: direct IMP call
2013-01-28 19:25:03.370 Four[6304] > finished in 0.8519998 sec
2013-01-28 19:25:03.370 Four[6304] run task: method access
2013-01-28 19:25:04.775 Four[6304] > finished in 1.405 sec
2013-01-28 19:25:04.775 Four[6304] run task: performSelector
2013-01-28 19:25:07.421 Four[6304] > finished in 2.646 sec
2013-01-28 19:25:07.421 Four[6304] run task: static method access
2013-01-28 19:25:13.805 Four[6304] > finished in 6.384 sec
2013-01-28 19:25:13.806 Four[6304] run task: static performSelector
2013-01-28 19:25:21.767 Four[6304] > finished in 7.961 sec
2013-01-28 19:25:21.768 Four[6304] comparison: 'direct IMP call' is 1.649062 faster than 'method access'
2013-01-28 19:25:21.768 Four[6304] comparison: 'method access' is 1.883274 faster than 'performSelector'
2013-01-28 19:25:21.768 Four[6304] comparison: 'static method access' is 1.247024 faster than 'static performSelector'
2013-01-28 19:25:21.768 Four[6304] comparison: 'method access' is 4.543771 faster than 'static method access'
2013-01-28 19:25:21.768 Four[6304] comparison: 'performSelector' is 3.008693 faster than 'static performSelector'
```

String manipulations
--------------------
Something interesting is the fact that there is a difference in the size of a strings class that is initialized by literals (12 bytes) and one create by alloc/init on `NSString` (16 bytes).

I found that it is almost 3 times faster to append on an `NSMutableString`, so this should be used as an art `StringBuilder`(from C#), if heavy string manipulations are to be done. 

##### 50000 appends on immutable string

| String size   | Time (sec)    | Per char   |
| ------------- | ------------- | ---------- |
| 1             | 0.02600002    | 0.02600002 |
| 10            | 0.02700019    | 0.00270002 |
| 100           | 0.04699993    | 0.00047000 |
| 1000          | 0.2179999     | 0.00021800 |
| 10000         | 1.931         | 0.00019310 |


##### 50000 appends on mutable string

| String size   | Time (sec)    | Per char       |
| ------------- | ------------- | -------------- |
| 1             | 0.006999969   | 0.00699996900	 |
| 10            | 0.006999969   | 0.00069999690	 |
| 100           | 0.01200008    | 0.00012000080  |
| 1000          | 0.05800009    | 0.00005800009	 |
| 10000         | 0.4849999     | 0.00004849999  | 

I haven't had any complexity theory yet, but I believe this is something like `O(1/n)` in both the mutable and immutable case (the cost per char is inversely proportional to the string size). So the conclusion is to write to strings in as big chunks as possible. This is quite obvious though...

#### Output: 

```
12:36:54.807: --- Running string manipulation tests ---
12:36:54.807: size of NSString typed var's class: 16
12:36:54.807: size of string literal's class: 12
12:36:54.807: 
12:36:54.807: -- appending 'x'*10000 50000 times:
12:36:54.807: run task: append to immutable string (10000)
12:36:56.762: > finished in 1.955 sec
12:36:56.763: run task: append to mutable string (10000)
12:36:57.227: > finished in 0.464 sec
12:36:57.227: comparison: 'append to mutable string (10000)' is 4.213363 faster than 'append to immutable string (10000)'
12:36:57.227: -- appending 'x'*10 50000 times:
12:36:57.227: run task: append to immutable string (10)
12:36:57.254: > finished in 0.02699995 sec
12:36:57.255: run task: append to mutable string (10)
12:36:57.262: > finished in 0.006999969 sec
12:36:57.262: comparison: 'append to mutable string (10)' is 3.857153 faster than 'append to immutable string (10)'
12:36:57.262: -- appending 'x'*100 50000 times:
12:36:57.262: run task: append to immutable string (100)
12:36:57.309: > finished in 0.04699993 sec
12:36:57.309: run task: append to mutable string (100)
12:36:57.321: > finished in 0.01200008 sec
12:36:57.321: comparison: 'append to mutable string (100)' is 3.916634 faster than 'append to immutable string (100)'
12:36:57.321: -- appending 'x'*1000 50000 times:
12:36:57.321: run task: append to immutable string (1000)
12:36:57.542: > finished in 0.221 sec
12:36:57.543: run task: append to mutable string (1000)
12:36:57.597: > finished in 0.05400014 sec
12:36:57.598: comparison: 'append to mutable string (1000)' is 4.092581 faster than 'append to immutable string (1000)'
12:36:57.598: -- appending 'x'*1 50000 times:
12:36:57.598: run task: append to immutable string (1)
12:36:57.624: > finished in 0.02600002 sec
12:36:57.624: run task: append to mutable string (1)
12:36:57.631: > finished in 0.006999969 sec
12:36:57.631: comparison: 'append to mutable string (1)' is 3.714305 faster than 'append to immutable string (1)'
```

Another thing I found while doing this, is that if you declare an `NSMutableString` as a property, with the `copy` attribute, the getter will actually (from what i gathered) return an immutable string! Seems odd, but I had error telling me that inline string wont reply to `appendString`, until i changed the property decleration from `copy` to `retain`.

Something annoying is that the GNUstep implementation does not have some `block` features, such as NSDictionary's `enumerateKeysAndObjectsUsingBlock`.

Blocks
------
Blocks execute pretty fast. Doing a simple operation (where the operation is close to free) is almost twice as fast when executed by a block, than by messaging. 

#### Output: 

```
12:58:37.475: --- Running block tests ---
12:58:37.479: -- performing simple operation 200000000 times
12:58:37.479: run task: simple op as msg send
12:58:39.660: > finished in 2.18 sec
12:58:39.660: run task: simple op as block
12:58:40.876: > finished in 1.216 sec
12:58:40.876: comparison: 'simple op as block' is 1.792763 faster than 'simple op as msg send'
```


Enumerations
------------

I tested how fast _fast enumeration_ is compared to a normal for loop. It turned about twice as fast.

```
2013-01-26 14:13:54.626 Four[8060] --- Running enumerations ---
2013-01-26 14:13:54.626 Four[8060] Creating a dictionary with 10000000 integers
2013-01-26 14:13:57.449 Four[8060] -- enumerating the dictionary --
2013-01-26 14:13:57.449 Four[8060] run task: standard for loop
2013-01-26 14:13:57.511 Four[8060] > finished in 0.06200004 sec
2013-01-26 14:13:57.511 Four[8060] run task: fast enumeration
2013-01-26 14:13:57.538 Four[8060] > finished in 0.02700019 sec
2013-01-26 14:13:57.539 Four[8060] comparison: 'fast enumeration' is 2.296282 faster than 'standard for loop'
```
