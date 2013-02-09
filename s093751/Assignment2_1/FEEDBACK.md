Peer-review on assignment 2 part 1
=======
### To Carsten Nilsson (s093751) from Sivanujann Selliah (s093042)

* The use of `@synthesize` in the implementation files is not needed when using the "standard" instance variables and accessor methods.
* The use of `self` in `init` methods is not recommended, because the rest of the object might not be completely initialized before the property is being set.
* It is best practice to nest the calls to `alloc` and `init`, because the object returned by `init` could be different from the object returned from `alloc`.
* I do not see the point in redefining the "Apple System Log facility" using `#define NSLog(FORMAT, ...)` just to use the C `printf` function. Since Objective-C is a superset of C, you could just as well use the `printf` function directly in the code.

### Overall assessment
The overall solution to this part of the assignment looks very good!
