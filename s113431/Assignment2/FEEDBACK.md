# Peer-review on assignment 2 part 1
### To Jamie (s113431) from Salvador (s113423)

The marry: is overriden with a covariant argument type.
This could cause problems when upcasting a NoblePerson to a Citizen.
```objective-c
// A NoblePerson is a Citizen
Citizen* citizen = [[NoblePerson alloc] init];

// Let's assume commoner is of a subclass of Citizen
// that does not have the butler property
[citizen marry:commoner];
```

I think the NSValue subclass NSNumber would make more sense for the age property.
It would probably suffice with a primitive type as it's not used in a collection.

The properties firstName, lastName, and sex have the `copy` attribute
to avoid aliasing when calling the setter,
but the rest are left without it,
which seems a bit inconsistent.

The spouse property is left with the default attribute `readwrite`,
which makes it possible to directly change the spouse.
It's my understanding that this is the job of the `marry:` and `divorce` methods.

I interpreted all of the properties as being readonly,
but I guess it's up to the implementer.
Either way,
it would've been useful with an initializer method to set some of the important properties.

The `divorce:` method only divorces one from the other,
but not the other way around.

The property `@property (nonatomic) NoblePerson *marry;` of NoblePerson seems at bit weird.
Assuming autosynthesis is enabled (no need for @synthesize),
it creates a setter and a getter for an instance variable called `_marry`.
