//
//  main.m
//  Assignment2-2
//
//  Created by Andreas Graulund on 13/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Tim.h"
#import "Tom.h"
#import "Tommy.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		// ------------------------------------------------------------------------------------------
	    
		// Part 1: Classes of the Foundation framework compared to Java
		// Example used is NSString vs. java.util.String
		NSLog(@"-- PART 1:");
		
		// --> INITIALISATION WITH LITERAL
		NSString *str = @"foo";
		// vs. String str = "abc";
		
		// --> INITIALISATION WITH FORMAT
		str = [NSString stringWithFormat:@"%@", [NSString class]];
		// vs. String.format(...);
		
		// --> GETTING LENGTH OF STRING
		unsigned long l = [str length];
		// vs. str.length();
		
		// --> PRINTING STRING
		NSLog(@"This string is an %@", str);
		// vs. System.out.println(str);
		
		NSLog(@"Length: %lu", l);
		
		// ------------------------------------------------------------------------------------------
		
	    // Part 2: Aliasing. Happens when several objects reference the same position in memory.
		// Compared to other languages, Objective-C has both strong and weak references.
		NSLog(@"-- PART 2:");
		
		Tim *tim = [[Tim alloc] init];
		Tom *tom = [[Tom alloc] init];
		
		// Let's make a reference that has its origin in both classes. Tim knows his favorite
		// color, but Tom also knows Tim's -- with a weak reference.
		
		tim.favoriteColor = @"Blue";
		tom.timsColor = tim.favoriteColor;
		
		NSLog(@"%@, %p", tim.favoriteColor, tim.favoriteColor); // Outputs Blue
		NSLog(@"%@, %p", tom.timsColor, tom.timsColor); // Also outputs Blue (same address)
		
		// This was the last strong reference to Tim's favorite color.
		tim.favoriteColor = nil;
		
		NSLog(@"%@, %p", tim.favoriteColor, tim.favoriteColor); // No longer exists (address 0x0)
		NSLog(@"%@, %p", tom.timsColor, tom.timsColor); // Should/could output nil (weak reference!)
		
		// ------------------------------------------------------------------------------------------
		
		// Part 3: Object initialisation. In most languages, the “new” keyword is used. However, in
		// Objective-C, a two-step procedure, using “+alloc” (which returns a new instance of the 
		// class by allocating the correct amount of memory and zeroing it out) in combination with
		// “-init” (which initialises the newly created instance).
		NSLog(@"-- PART 3:");
		
		// Let's create that Tim object again.
		
		Tim *tim2 = [[Tim alloc] init];
		
		// Notice how this uses a class method embedded inside a method call on this new (currently
		// anonymous) object.
		
		// Compare with Java: Tim tim = new Tim();
		
		// Initialisers can also take arguments. Just like this string below.
		
		NSString *t = [[NSString alloc] initWithFormat: @"My new Tim 2: %@", tim2];
		
		// This is where Objective-C can often become a little verbose in my opinion.
		
		// Compare with Java: Tim tim = new Tim("some argument", something);
		
		NSLog(@"%@", t);
		
		// ------------------------------------------------------------------------------------------
		
		// Part 4: Factories. As I mentioned, initialising with arguments, as seen above, using alloc
		// and constructors, can be a bit verbose. All Foundation classes I know of have “factories”
		// which are class methods that help you to initialise a certain kind of object by returning
		// them with the given argument.
		NSLog(@"-- PART 4:");
		
		// Let's create another string with format, like above, but use a factory instead.
		
		NSString *t2 = [NSString stringWithFormat: @"The same Tim 2: %@", tim2];
		
		// Much shorter. Java also has a formatted string factory,
		// also implemented as a class method: String t2 = String.format("Result is %d.", 42);
		
		NSLog(@"%@", t2);
		
		// ------------------------------------------------------------------------------------------
		
		NSLog(@"-- PART 5:");
		
		// Part 5: Copying. Normally, when you set one variable to the contents of another variable,
		// you don't copy the value (if it's an object). You create a reference to it (also known as
		// aliasing, see part 2).
		
		// There are two ways to get around this. In object instances, you can define @properties as
		// copy @properties. This means that the getter method automatically returns a copy of the
		// object instead of returning the reference. This is good if you want to prevent changing of
		// the values inside the @property object by getting it and changing it outside. If you
		// change a copy, you (obviously) don't change the original, as we saw in part 2. Let's see
		// an example of this: Tim has a pet; we can figure out which kind, but not change it,
		// because we receive a copy (and it's a readonly variable; it only has a getter).
		
		NSString *pet = tim.myPet;
		NSLog(@"I think Tim's pet is: %@", pet);
		NSLog(@"Tim's pet is: %@", tim.myPet);
		
		// If we tried changing it anyway, like below...
		pet = @"MacBook";
		// ...it would not be reflected in the object:
		
		NSLog(@"Now, I think Tim's pet is: %@", pet);
		NSLog(@"Now, Tim's pet is: %@", tim.myPet);
		
		// The second way is to make a copy of an object explicitly. This is what happens in the
		// background in the above situation. Most Foundation objects have the methods “-copy” and
		// “-mutableCopy” which creates	a mutable copy of a perhaps immutable object:
		
		pet = tim.myPet;
		NSMutableString *newPet = [pet mutableCopy];
		[newPet appendString: @"-Man"];
		
		NSLog(@"His new pet is %@", newPet);
		
		// The objects that support the above operations all implement the Foundation protocol made
		// for this purpose, named <NSCopying>. These copy methods are all “shallow copies”, which
		// means that they only copy the top object, and any subobjects, like members of an array
		// object, are still passed by reference. The opposite of this is called a “deep copy”, which
		// is usually best done in Objective-C using serialisation (“property lists”).
		
		// ------------------------------------------------------------------------------------------
		
		NSLog(@"-- PART 6:");
		
		// Part 6: Dynamic typing. The special “id” type given to a variable allows that variable to
		// contain a pointer to any type of Objectie-C object. This is handy in cases where you don't
		// care what type of object is given because you don't perform any operations on it, or in
		// cases where you expect to receive a certain class or subclass of that original class,
		// without necessarily specifying which one.
		
		id a = @"Hello";
		
		NSLog(@"The length of \"%@\" is %lu", a, [a length]);
		
		a = @[@1, @2, @3];
		
		NSLog(@"The length of \"%@\" is %lu", a, [a count]);
		
		// I don't know of any other OO programming languages that offer a sort of dynamic typing in
		// only one type of variable. All the languages I know either offer dynamic typing
		// *everywhere*, like Ruby or Python, or *nowhere*, like Java.
		
		// Obviously, this dynamic typing has a big downside: You don't (immediately) know what type
		// of object is in the variable at runtime. Thus, if you call a method on the object that
		// doesn't exist, the compiler doesn't complain, but you get a runtime error resulting in a
		// program crash. This is the same in Java, although the compiler can also warn you about
		// this in this language.
		
		// ------------------------------------------------------------------------------------------
		
		// Part 7: Field hiding. Many object-oriented languages give us the ability to control how
		// the object's properties (or “fields”) and methods are accessible to other objects and the
		// outside world. In fact, most OO languages *force* us to explicitly state this. Objective-C
		// is different in that properties and methods have an implied visibility if it's not
		// explicitly defined. By default, methods are public and properties are protected; that is,
		// hidden. In the literature I've read about the language, it is a very important principle
		// that properties can be accessed only via getters and setters (also known as “accessors”,
		// usually @synthesized), like the properties on our Tim object below:
		
		[tim setFavoriteColor: @"Red"];
		
		// This is a fundamental principle of object oriented programming in Objective-C. Synthesized
		// accessor methods with the dot notation makes it look like you're not using the accessor
		// methods, but you always are.
		
		tim.favoriteColor = @"Red";
		
		// Equivalent to above.
		
		// Compare to Java: tim.setFavoriteColor("Red");
		
		// ------------------------------------------------------------------------------------------
		
		// Part 8: Immutability. Like most other OO programming languages, Objective-C has a strong
		// focus on immutable objects. The usual argument is that the class code is simpler and a lot
		// of problems, like thread-safety, synchronization, etc., which are completely eliminated.
		// This is the exact same in Java. However, Objective-C's Foundation is unique in that it
		// actually has some mutable classes, like NSMutableString and the oft-used NSMutableArray.
		
		NSMutableString *nms = [NSMutableString stringWithString:@"Hel"];
		// (could also be defined as: [@"Hel" mutableCopy] -- ref. part 5)
		
		[nms appendString: @"lo"];
		
		NSLog(@"-- PART 8: %@", nms); // Outputs “Hello”.
		
		// Equivalent in Java: Use the StringBuilder object.
		// String hel = "Hel";
		// StringBuilder sb = new StringBuilder(hel);
		// sb.append("lo");
		// System.out.println(sb);
		
		// ------------------------------------------------------------------------------------------
		
		NSLog(@"-- PART 9:");
		
		// Part 9: Inheritance. Class declarations in Objective-C inherit from other classes, just
		// like any other OOP language. However, like most, but not all OOP languages, Objective-C
		// only supports single inheritance, which eliminates the nasty issues that occur with
		// multiple inheritance (notably the diamond shaped inheritance). When an object inherits
		// from another object, it carries all its methods and properties along with it (sometimes
		// depending on visibility). In order to demonstrate, I am creating an object of the class
		// “Tommy” below, which inherits from “Tom”. These two objects model the same person.
		// However, “Tommy” is the moniker Tom dons when he talks to all his friends. Thus, an
		// object of the class Tommy can call a friend, while an object of the class Tom cannot.
		// But they both have a method returning the same full name, since they're the same person.
		
		Tommy *tommy = [[Tommy alloc] init];
		
		NSLog(@"Tom's full name: %@", tom.fullName);
		NSLog(@"Tommy's full name: %@", tommy.fullName);
		
		[tommy callFriend: @"Jake"];
		// [tom callFriend: @"Jake"]; <-- This would generate a compile time error
		
		// In Java, inheritance is the exact same way -- only the syntax is different.
		
		// ------------------------------------------------------------------------------------------
		
		// Part 10: Logging. This is a simple one. In Objective-C, we use NSLog to log any string to
		// the console. It is prepended with a timestamp and the module name. In C, it is equivalent
		// to: fprintf(stderr, ...), and in Java, it's equivalent to System.out.println.
		
		NSLog(@"--PART 10: I am logging!");
		
		// Of course, there is more to debugging than just logging, but this is as far as I've gotten
		// in terms of familiarity for now.
		
		// ------------------------------------------------------------------------------------------
		
		// Part 11: Method overloading. In languages like Java, it is possible to have more than one
		// method with the same name, but with different parameter sets. It's not directly possible
		// to have two methods with the same name in Objective-C at all, but in Objective-C,
		// “method name” refers to the entire signature of the method (including argument names), so
		// in practice, it really is the same. Although, as a consequence of this, at least one of
		// the methods has to have more than one argument. I've added two different methods to
		// the “Tim” class which exhibit this practice:
		
		NSLog(@"-- PART 11:");
		
		[tim pimpify: @"shi" withWord: @"ni"];
		[tim pimpify: @"wi" withNumber: @42];
		
		// (See the implementation for the Tim class to see yet another variation, using ints.)
		
		// ------------------------------------------------------------------------------------------
		
		// Part 12: Polymorphism. Just like in other OO programming languages, like Java, it is
		// possible for several different classes to share the same method names and signatures.
		// If I call the greeting method on both Tim and Tom, they output a different greeting,
		// because the inside code for their methods inside their respective class declarations are
		// different from each other, even though they have the same method name. This is even more
		// evident in subclasses, where I can overwrite the contents of the methods found in the
		// superclasses, by defining the implementation of a method with the same name. This can be
		// seen in the Tommy class.
		
		NSLog(@"-- PART 12:");
		
		[tim greeting];
		[tom greeting];
		[tommy greeting];
		
		// These all output different greetings.
		
		// ------------------------------------------------------------------------------------------
		
		// Part 13: NSArrays and polymorphism. Whilst arrays in many programming languages, such as
		// Java and C++, take only one pre-defined type of input object (monomorphic), arrays in the
		// Foundation framework (NSArrays) are polymorphic because they take “id” elements, which are
		// any kind of Foundation framework object. This is shown below:
		
		NSArray *list = @[@42, @"Pie", @( M_PI ), @[@"Ubiquity of 42:", @( 13.37 * M_PI )]];
		
		NSLog(@"-- PART 13: %@", list);
		
		// ------------------------------------------------------------------------------------------
		
		// Part 14: nil. Nil is the zero object in Objective-C. Comparable to null in Java and other
		// languages, any object pointer can point to nil (address 0x0). However, whilst you get
		// a NullPointerException in Java trying to access null, Objective-C lets you run methods on
		// nil; they just don't have any effect (as you'd expect). I think this is a nice courtesy.
		
		tim = nil;
		
		[tim greeting]; // <-- Nothing happens.
		
		// ------------------------------------------------------------------------------------------
		
		// Part 15: Primitive types. Since Objective-C is a superset of C, it inherits all the
		// primitive types from C (although not the ones present in the newer versions of C, such as
		// C99), however little they are used in Obj-C, since it's focused on OOP.
		
		// As in all OOP languages, primitive types are unique in that they are never copied by
		// reference, but always by value.
		
		int x = 42;
		int y = x;
		
		x = 21; // <-- This does not change the value of y.
		
		NSLog(@"-- PART 15: x = %d, y = %d", x, y);
		
		// ------------------------------------------------------------------------------------------
		
		// Part 16: Protocols. Similar to Interfaces in Java, which are collections of methods that a
		// class declaration can “implement” and thus, the class is required to implement all of the
		// methods listed in the protocol it implements. Looking at it this way, it can be seen as
		// a “contract” between the protocol and the implementing class declaration (@interface).
		
		// As an example of this, all of my classes (Tim, Tom and Tommy) implement the “Greeter”
		// protocol, which requires them to implement a “-greeting” method, as seen in part 12.
		
		// In Objective-C:
		//		@interface Tim : NSObject <Greeter>
		
		// In Java:
		//		class Tim implements Greeter {
		
		// ------------------------------------------------------------------------------------------
		
		// Part 17: Singletons. Empty lists and dictionaries have a simple syntax in many languages;
		// but not in Objective-C. At least not until “Modern Objective-C” arrived. In many
		// languages, an empty list is [] and an empty dictionary is {}. Before the arrival of Modern
		// Objective-C, this is how it was done:
		
		NSArray *oldEmptyArray = [NSArray array];
		NSDictionary *oldEmptyDict = [NSDictionary dictionary];
		
		// With Modern Objective-C:
		
		NSArray *newEmptyArray = @[];
		NSDictionary *newEmptyDict = @{};
		
		// Much better in my opinion. They are the same types of objects:
		
		NSLog(@"-- PART 17:");
		NSLog(@"Old: %@, %@", oldEmptyArray, oldEmptyDict);
		NSLog(@"New: %@, %@", newEmptyArray, newEmptyDict);
		
		// ------------------------------------------------------------------------------------------
		
		// Part 18: Enumerations. In Objective-C, enumerations are part of C, so they are defined in
		// the exact same way as in this programming language. In assignment 2, part 1, I have an
		// example of a defined enumeration wherein a person's sex can be found from three choices,
		// and then it is mapped to a type using typedef:
		
		typedef enum { undefined, male, female } sex;
		
		// ------------------------------------------------------------------------------------------
		
	}
	
	// Thanks for reading.
	
    return 0;
}

