Notes
=====

I have implemented the `parents` and `children` sets as `NSSet`s (that is, immutable), and as `readonly` properties. This is to prevent outsiders from directly manipulating the sets, which would otherwise be impossible to assert valid, unless listening for their changes somehow. For this reason, I have also implemented _add_ and _remove_ methods for both the sets.

**Implementation**

At first I did not realize that `NSAssert` had to be called within an `NSObject` derived class and though GNUstep had some bug. So I redid the assertion functionality manually. For this I used macros which take a statement and a message and if the assertion fails will throw an error containing the message. I believe this is more or less equal to how `NSAssert` works. It was pretty interesting to do actually, and it turned out super useful for the _logging_ variant. In there I basically tweaked the `Assertion.h` to log stuff instead of throwing exceptions. 

I have only done assertion/logging/throwing in methods that change state. I believe this was how it was meant to be(?). This means that, for instance, the method `canMarry` does not break or log if it invalidates.

Compilers
---------
Use `make CC=clang` (default) and `make CC=gcc` to compile to `clang` and `gcc` accordingly. Run-time performance-wise, there is obviously no noticable difference in a program of this scale. But at compile-time, `gcc` is much, much faster, probably around 10x as fast. I'm almost certain that it's an issue with my setup, since I find `clang` strangely slow. It takes 2-3 seconds to compile a small (~50 lines) file.

Anyway, `clang` really has _way_ better output for debugging. It shows you which line and _where_ on the line something went wrong (with nice little ascii arrows and everything). `clang` also always tells you if a warning can be disabled with a flag, for instance, if you implicitly call an undeclared function, it will warn and tell you `-Wimplicit-function-declaration` is what makes it warn you about it. `gcc` does this too, but, it seems, not as thourougly. `clang` will also tell you which spec something belongs to, e.g. that the former function warning is not allowed as of the `C99` spec.

Feature-wise `clang` seems to be a bit more complete (regarding Objective-C, that is). There is no `blocks` support in `gcc` but `clang` has them. None of them, however, support things like array literals. I suppose this is some Apple-specific feature.


Variants
--------

**Logging**

I dont quite like this implementation. First of all, it needs a `DEBUG` flag set somewhere, which has to be sprinkled around code everywhere. I don't think it is very useful as is it does nok break execution. At least in some cases (e.g. a person suddenly has more than two parents), I believe a program _must_ crash. It's no good having a program continue with a terribly messed up state (I realize that the logging is meant to prevent this, but one can never be sure). 

On the other hand, it could, sometimes be of interest that a program continues with an invalid state. One could image a highscore where a single entry was missing a date property. But these seem edge cases. 

One way this could be useful in a production environment where one could easily make the logging system relay the log info to a server, where developers could analyze them.

**Defensive**

This is a bit more useful as compared to logging. When an invalid state is (or will be) reached the program crashes. I believe however that one should make sure to catch the exceptions thrown by state-changing methods, and try to handle it, and if impossible then exit gracefully, letting the user know what happened. This seems a much better scenario, as one can possibly get back on track by _correcting_ an error. 

The thing about this implementation is the endless `throw`s. Better is the assertion technique.

**Assertion**

I like this the best of the three. It has the same advantages as the defensive strategy, but yields much nicer code, both by looks and maintenance. As long as one uses a flexible assertion system (or creates their own wrapper), it can be changed how the system handles invalid assertions. For instance, send the messages to a server, crash and burn, show a message, etc.


Overall
-------

All in all, I don't think I would rely on these kinds of inline testing. It's nice for some debugging purposes, and it could possibly catch a lot of bugs. But as it seems that it's hard to handle these error anyway, I would favor unit testing. That way, you dont clog up your code with assertions and logging, and one can actually make out what's happening somewhere in code (exaggeration...)

For server side code, the logging mechanism is useless. It's simply insecure to be able to continue execution of an invalid state, and could be easily exploited. This goes for some client-side applications as well, but for something like a game with no sensible data present, it wouldn't really be an issue.

Portability
-----------

`gcc` supports more targets than does `clang`