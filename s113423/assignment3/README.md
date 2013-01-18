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
running in a slightly inconsitent state
and instead record the assertion failure in a log.
That way, when the program actually crashes
or the the user experiences some bug,
we can somehow retrieve the log file
and reason about the origin of theflaw.

On the other hand,
a program crashing on assertion failures
would most likely be prefered in a critical system
where an inconsitent state could lead to something harmful.

For the logging variant i played around with a third-party logging framework
called [Lumberjack](https://github.com/robbiehanson/CocoaLumberjack).
Though maybe not entirely relevant to this assignment,
it has support for different log levels and logging to multiple destinations.
I ended up writing two macros PRECONDITION and POSTCONDITION
to make the logging statements inside the methods a bit shorter.
