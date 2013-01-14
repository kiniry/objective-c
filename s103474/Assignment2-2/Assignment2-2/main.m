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
		NSLog(@"%@", str);
		// vs. System.out.println(str);
		
		NSLog(@"Length: %lu", l);
		
		// ------------------------------------------------------------------------------------------
		
	    // Part 2: Aliasing. Happens when several objects reference the same position in memory.
		// Compared to other languages, Objective-C has both strong and weak references.
		NSLog(@"-- PART 2:");
		
		Tim *tim = [[Tim alloc] init];
		Tom *tom = [[Tom alloc] init];
		
		// Let's make a reference that goes both ways. Both Tim and Tom reference each other now.
		
		tim.favoriteColor = @"Blue";
		tom.timsColor = tim.favoriteColor;
		
		NSLog(@"%@, %p", tim.favoriteColor, tim.favoriteColor); // Outputs Tim
		NSLog(@"%@, %p", tom.timsColor, tom.timsColor); // Also outputs Tim
		
		// This was the last strong reference to Tim.
		tim.favoriteColor = nil;
		
		NSLog(@"%@, %p", tim.favoriteColor, tim.favoriteColor); // No longer exists
		NSLog(@"%@, %p", tom.timsColor, tom.timsColor); // Outputs nil (weak reference!)
		
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
		
		// ------------------------------------------------------------------------------------------
		// ------------------------------------------------------------------------------------------
		// ------------------------------------------------------------------------------------------
		// ------------------------------------------------------------------------------------------
	}
    return 0;
}

