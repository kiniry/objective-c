I wrote the three variants with ARC in mind,
so I quickly learned that gcc didn't support it.
I modified to assertion variant to work without ARC,
this also included removing the NSNumber and NSArray
literals recently introduced that only work with clang.

The assertion variant would work well during initial development
as NSAssert raises an exception on pre- and postcondition failures
and invokes the debugger on the offending line.
This is a good thing,
as it helps to discover potential problems right away.

Assertions crashing the program in the release build
would be very anonying for the user,
and it might be a better idea to just keep the program
running in a slightly inconsistent state
and instead record the assertion failure in a log.
That way, when the program actually crashes
or the the user experiences some bug,
we can somehow retrieve the log file
and reason about the origin of the flaw.

On the other hand,
a program crashing on assertion failures
would most likely be prefered in a critical system
where an inconsistent state could lead to something harmful.

What happens on an assertion failure is really up
to how you implement it.
You could use the C macro `assert` of assert.h that
halts the program and prints an error message,
or you could use the `NSAssert` macro of Foundation that
raises an exception with a custom message, or even define your own.
Assuming that the assertion variant raises an exception,
then the only real difference between that and
the defensive programming variant
is that the latter doesn't check the postcondition.
If you intent on catching these exceptions, though,
then it might be misleading to use assert statements
and more clear to directly raise exceptions using
the defensive programming approach.
Moreover,
assertion statements are usally disabled at compile time
in the release build,
but one could argue that it's better to leave them there
or somehow have a way to enable them dynamically.

For the logging variant i played around with a third-party logging framework
called [Lumberjack](https://github.com/robbiehanson/CocoaLumberjack).
Though maybe not entirely relevant to this assignment,
it has support for different log levels and logging to multiple destinations.
I ended up writing two macros PRECONDITION and POSTCONDITION
to make the logging statements inside the methods a bit shorter.
