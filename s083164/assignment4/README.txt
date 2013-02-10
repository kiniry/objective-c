Assignment 4
To test the performance of Objective-C several experiments have been done:

- String manipulations, such as appending using several approaches.
- Recursion
- Heap use

These test are done using direct String manipulations found in the
StringManipultaion project and calculating the Levenhstein Distance.

The results of the string manipulation are:

2013-02-10 14:17:08.970 StringManipulation[62909:303] The appendString finished in 0.006059
2013-02-10 14:17:08.985 StringManipulation[62909:303] The appendFormat finished in 0.012875
2013-02-10 14:17:08.992 StringManipulation[62909:303] Capacity string append finished in 0.006096
2013-02-10 14:17:08.994 StringManipulation[62909:303] Finding the substring was done in 0.001738
2013-02-10 14:17:09.001 StringManipulation[62909:303] The appendString finished in 0.006162
2013-02-10 14:17:09.014 StringManipulation[62909:303] The appendFormat finished in 0.012670
2013-02-10 14:17:09.021 StringManipulation[62909:303] Capacity string append finished in 0.005950
2013-02-10 14:17:09.023 StringManipulation[62909:303] Finding the substring was done in 0.001375
2013-02-10 14:17:09.031 StringManipulation[62909:303] The appendString finished in 0.007822
2013-02-10 14:17:09.044 StringManipulation[62909:303] The appendFormat finished in 0.012885
2013-02-10 14:17:09.051 StringManipulation[62909:303] Capacity string append finished in 0.006033
2013-02-10 14:17:09.053 StringManipulation[62909:303] Finding the substring was done in 0.001355
2013-02-10 14:17:09.060 StringManipulation[62909:303] The appendString finished in 0.006343
2013-02-10 14:17:09.073 StringManipulation[62909:303] The appendFormat finished in 0.012608
2013-02-10 14:17:09.080 StringManipulation[62909:303] Capacity string append finished in 0.005989
2013-02-10 14:17:09.082 StringManipulation[62909:303] Finding the substring was done in 0.001387
2013-02-10 14:17:09.088 StringManipulation[62909:303] The appendString finished in 0.006085
2013-02-10 14:17:09.102 StringManipulation[62909:303] The appendFormat finished in 0.013619
2013-02-10 14:17:09.112 StringManipulation[62909:303] Capacity string append finished in 0.008789
2013-02-10 14:17:09.114 StringManipulation[62909:303] Finding the substring was done in 0.001411

The Levenhstein is implemented using the dynamic programming technique, using
a memo.
