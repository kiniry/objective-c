String Manipulation:


Heavy use of recursion:


Heap trashing and trashing:
Normally, for trashing the heap, one would use garbage collection to cleaning up. However, objective C uses ARC (automatic reference counting) that keeps track of every reference made to an object, and when that number reaches 0, it is removed from the heap. The benefit of this is that the object is removed instantly, whereas with garbage collection, it would only be removed when the garbage collecter comes by (and this could potentially take a long time).
Furthermore, one can manually use dealloc to remove all pointers to a certain object, making the memory available for the program to use for future objects.

Enumerations and iteration:


Foundation's classes:


Blocks:


Protocols:
Protocols in themselves do not impact performance as the cost of sending a message is the same, whether you use the protocol or a reference by its class. They do, however, provide flexibility and guidelines for the programmers and are thus very useful.