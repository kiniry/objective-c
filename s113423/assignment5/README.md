# Assignment 5

I've chosen to port the classes regular expression classes from the
Java package java.util.regex, which consists of the interface
MatchResult and the classes Matcher, Pattern,
and PatternSyntaxException.
I've used the following Javadocs as reference:
http://docs.oracle.com/javase/6/docs/api/java/util/regex/package-summary.html

... fundemental aspects of the API (design, arch., and pattern POV) ...

The Java interface MatchResult translates to a protocol in
Objective-C,
and the two classes Matcher and Pattern remain classes.
The symbol Pattern was already declared in a header file imported by
the Foundation framework,
so I renamed it to RegexPattern.

The names of methods in Objective-C is a lot different than in Java,
since parameters are interspersed in the method name.
Java also support overloading of methods,
whereas method names must be distinct in Objective-C.
I tried my best to follow
[Apple's method naming convention](https://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html),
when translating from Java to Objective-C.

The class method `compile` of Pattern throws the exception
PatternSyntaxException if it's given an invalid regular expression.
An invalid regular expression could be seen as a programmer error,
but I can imagine the regular expression as an input from the user,
so I decided to use NSError to handle an invalid syntax instead of
throwing an exception.

A handful of the methods in the Matcher class of the Java package
return their own class instance,
for what I assume is to enable method chaining.
Method chaining in Objective-C looks ugly,
so I decided to have their counterparts simply return void.

...

The `String` class in Java provides a couple of methods to make it
easier to work with regular expressions:
`matches`, `replaceFirst`, `replaceAll`, and `split`.
It's possible to extend existing classes in Objective-C using
categories.
I've created the category `Regex` that extends the `NSString`
class of the Foundation framework,
so that it support the following methods:

```objective-c
- (BOOL)matchesRegularExpression:(NSString*)regularExpression;
- (NSString*)stringByReplacingFirstOccurrenceOfRegularExpression:(NSString*)regularExpression withString:(NSString*)replacement error:(NSError**)error;
- (NSString*)stringByReplacingOccurrencesOfRegularExpression:(NSString*)regularExpression withString:(NSString*)replacement error:(NSError**)error;
- (NSArray*)componentsSeparatedByRegularExpression:(NSString*)regularExpression error:(NSError**)error;
- (NSArray*)componentsSeparatedByRegularExpression:(NSString*)regularExpression withLimit:(NSInteger)limit error:(NSError**)error;
```

I tried to name them in a similiar way to the other methods found in NSString.
I had to stick the NSError parameters on to the end,
as I chose to avoid exceptions on an invalid regular expression
syntax.

Despite the differences in method naming and syntax,
I still wanted the semantics to stay the same.
I wrote handful of unit tests to make it easier to verify if I was
doing things right.
I wrote them in Java first to make sure I understood how it should
work and then translated them to Objective-C.

As for the implementation,
I didn't think that writing a regular expressions interpreter would be
in scope of this assignment,
so I used the Foundation class NSRegularExpression to do the actual
pattern matching.

...

...

