_Feedback for Markus Færevaag (s123692) by Simon Altschuler (s123563)_

Part 1
------

In the `Citizen` class, the `single` property is private (so doesn't conform to the spec). Moreover it is implemented as a property which is manually set. I would suggest using a public `readonly` property which would return something like `self.spouse == nil`. That way the property would always by design reflect the marrial status of the `Citizen` and be less prone to errors.
	
As for the `assets` property in `NoblePerson`, instead of having a `setAssetsWithoutSharing` method, a slightly more ideal solution would be a normal setter, and a getter that would check whether the person is a single, and if true, the returned assets would be the person and the spouse assets summed and divided (just like the value being set in the current setter).

Compared to the provided solution by @kiniry, there is no `invariant` method (which validates the instance's state). I don't have that either, and I don't quite understand the purpose of it, since it's return value is never used anywhere, and it doesn't break or otherwise debug execution (maybe something for the second part).


Part 2
------

*Dynamic typing*: I don't understand what is meant by "ids create the use for introspection". Just to clarify, that the static typing is just "for the programmer" is true, but it also means they are used by the _compiler_, which performs type checking at compile-time.

*Immutability*: An immutable object doesn't prevent one from changing a _pointer_ to it, but only changing the objects value itself. That's why there is nothing like a `setValue` method on an `NSString` for instance (`NSMutableString` has `setString:`).

*Logging*: "[...] used with a formatted NSString, with '%' as identifier.", I guess this should be '@'.

*Polymorphism*: Polymorphism is the principle of objects being able to be referenced to as being another object (or a common interface), not that method names can be the same (which is sort of odd). For instance a `NoblePerson` being bound to a variable of type `Citizen`.
