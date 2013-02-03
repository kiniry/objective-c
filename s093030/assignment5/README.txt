Language-Integrated Query (LINQ)

The chosen API for this assignment is Language Integrated Query (LINQ), which is
a part of the .NET framework, since version 3.5. LINQ extends enumerables by adding
query-like  functionality to work with enumerables. This includes filtering, ordering,
selecting, mapping, extracting and processing tasks. The most of the API uses higher
order functions in order to do so.

The architecture of LINQ is defined by a set of standard query operators which
are accessible as extension methods for enumerable types. The query operators include
but are not limited to:
- Select (map)
- Where
- Sum
- Min
- Max
- Average
- Reverse
- Distinct
- Union
- Except (difference)
- Intersect
- First
- Last
- All
- Contains
- Count

All of the above operators have higher order versions which performs the
same operation but applies a certain function first. An example is the
higher order version of max which can be used to extract a numeric
value from all elements in the enumerable.

All operators are provided in a functional style, i.e. they do not mutate
the enumerable they are working on, rather they return a new instance.

In order to implement the LINQ API in Objective-C an interface category
has been used in order to create "extension methods" for the NSImmutableArray class.
This allows the extension methods to work with the self keyword as a reference to an
NSImmutableArray instance. Due to this pattern all extension methods implementations
are located in a single file called NSImmutableArrayExtensions.m.