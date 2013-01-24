## Feedback to s093042 (Sivaujann Selliah) from s093041 (Philip Nielsen)

* With the newest edition of Objective-C you need not do `@synthesize` for a `@property`. It automatically creates an instance variable with a prefixed underscore and implicit getters/setters.
* In the init method you normally want to set the *instance variable* directly, not use the accessor, i.e. say `_name = aName`. Instance variables are generally used in initializers and getter/setters. Everywhere else you would use properties.
* Checking for nil in Objective-C can be done implicitly, i.e. `if (sweethart != nil)` is equal to `if (!sweetheart)`.
* You don't have to declare `impedimentToMarriage:` or `marry:` in `NoblePerson.h` since it is already declared in `Citizen.h`.
* Not sure what the `shareOfAssets -= 50000/2;` calculation is for?

Apart from the minor comments above it is overall a solid solution for the assignment, which shown a clear understanding of the language and its features.