_Feedback from Markus Færevaag (s123692)_

Part 1
------

Your 'children' property in Citizen it of type NSMutableSet, and your
getter/setter has a NSMutableSet as it's argument. Though this
works, it defeats the point of using a mutable set - opposed to an
immutable. E.g. if some child where 'born', and you'd want to add
it to another citizen's children, you would create a temporary set of
the present children, add the new born, and then setting that set to the
citizen's children. This, opposed to simply adding a citizen to the
instance's mutable set of children.
I haven't mentioned parents because they are usually only declared
once.

I'm guessing you haven't implemented the sharing of assets bit, in
NoblePerson. (?)

Interesting use of blocks in PersonDB! :)

Part 2
------

Can see your not completely done, but great stuff on the current
topics.
