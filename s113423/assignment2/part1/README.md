Citizen is an abstract/deferred class and should not be instantiated.
It provides the method initWithName:sex:age:children: for the sake of convenience of subclasses.

I assume the precondition is satisfied
before the caller invokes a method on any of the classes.

The overriden method marry: of NoblePerson expects a NoblePerson as argument.
This means that the argument type is covariant,
which could cause problems when upcasting to Citizen.
To avoid strengthening the precondition of the overriden method,
I decided to move the NoblePerson requirement into the canMarry: method and override it in the subclass.
This instead strengthens the postcondition, which is okay.

I changed the precondition of the abstract method marry: in Citizen to require canMarry: both ways.
This ensures that a Commoner (subtype of Citizen, but not of NoblePerson) can't marry a NoblePerson.

The postcondition of marry: in NoblePerson states that
the object on which it's called,
will have a butler when the method returns.
I've made this a precondition instead by moving it into the canMarry: method,
where at least one of the two are required to have a butler in advance.

Instead of using NSSet to store the parents,
I used two weak properties, mother and father,
to avoid a strong reference cycle between children and parents.
