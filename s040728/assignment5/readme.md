I have implemented a priority queue data structure. The implementation is not efficient. The java implementation uses a heap and is efficient, but I have used a simple NSMutableArray for simplicity.

The contents of the array are ordered using a custom comparator. To keep the array ordered, it is sorted  every time a new element is inserted.

In the java implementation, the queue is ordered using a comparator object or the comparable interface.

Because Objective-c is a dynamic language, and arrays can contain any kind of object, you can not be sure that objects can be compared to each other.
 The design decision was to give an optional protocol that all objects in the list can implement. The protocol has one optional method compare: ; 

Objects don't need to implement the protocol, as long as they implement a method called compare:
Then objects can be sorted using sertUsingSelector:@selector(compare:).


Instead of using a comparator class like in java, a block can be used when initiating the priority queue. The underlying array can be sorted using sortUsingComparator: method.


