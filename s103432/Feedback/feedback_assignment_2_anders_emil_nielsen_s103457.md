#Feedback Assignment 2 Anders Emil Nielsen s103457

In this case where the student actually have done more and is better than the peer-viewer, the student does indeed have the permission to correct the peer-viewer and curse at him.

In this feedback a point system to measure awesomeness is made.

##Assignment2-1

###Runablity

The program runs without errors or warnings: _10 Points to Anders_


###Citizen.h

You shows extra works with use of enum: _1 Point to Anders_

You uses `NSMutableSet` instead of `NSArray`. `NSMutableSet` is used when wanted unique items but not in particular order, this is correct. But you don't use the extra methods that comes with `NSMutableSet` instead `NSSet` is prefered:  _0.1 Points are taking from Anders_

###Citizen.m

In the method divorse, which by the way is spelled divorce, you delete both reference so both get divorceds. Joe only deletes one of them which then results in that the pointer still exist. It is now your job to figure out which one of you is correct. If you had done it the other way around so `self.spouse = nil;` and the `self.spouse.spouse = nil;` then you could delete `self.spouse.spouse = nil;` because spouse calling nil is nil: _0 Points are taking from Anders_

You are logging inside methods, great: _5 Points to Anders_

Nice feauture with description: _3 Points to Anders_

###NoblePerson.m

Looks great and all the features are there: _3 Points to Anders_

The description method adds the butler and assert, but it does says that it is a NoblePerson in the output: _1 Point is taking from Anders_

##Assignment2-2

I did not know you could duplicate with `.dup` in Ruby that's cool: _2 Points to Anders_

You chose to describe some, but very detailed and with code example in main. I have learn some Ruby. Good job:  _a whole lot Points to Anders_



