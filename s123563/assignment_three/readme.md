Notes
=====

I have implemented the `parents` and `children` sets as `NSSet`s (that is, immutable), and as `readonly` properties. This is to prevent outsiders from directly manipulating the sets, which would otherwise be impossible to assert valid, unless listening for their changes somehow. For this reason, I have also implemented _add_ and _remove_ methods for both the sets.

**Implementation**

At first I did not realize that `NSAssert` had to be called within an `NSObject` derived class and though GNUstep had some bug. So I redid the assertion functionality manually. For this I used macros which take a statement and a message and if the assertion fails will throw an error containing the message. I believe this is more or less equal to how `NSAssert` works. It was pretty interesting to do actually, and it turned out super useful for the _logging_ variant. In there I basically tweaked the `Assertion.h` to log stuff instead of throwing exceptions. 

I have only done assertion/logging/throwing in methods that change state. I believe this was how it was meant to be(?). This means that, for instance, the method `canMarry` does not break or log if it invalidates.
