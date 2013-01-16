//
//  main.m
//  Assignment2.2
//
//  Created by Andreas Haure on 15/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Boy.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        // BELOW ARE REFLECTIONS AND CODE EXPERIMENTS FOR ASSIGNMENT 2.2                                               \\
        // THE TWO OO PROGRAMMING LANGUAGES I KNOW ARE COMPARED: Objective-C vs. JAVA                                  \\
        //+-----------------------------------------------------------------------------------------------------------+\\
    
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 1: Classes in foundation vs classes in java.lang/java.util]------------------------------------\\
        
        //MOST OBJC classes are subclasses of the root class NSObject.
        
        //One of the most used classes in both languages is the Array Class:
        //In OBJC: Foundation.framework -> NSArray
        //In Java: java.util -> Arrays.class
                
        NSLog(@".oO( Comparison 1 )Oo.");
        //In this comparison the Array class will be compared for the two languages OBJC and JAVA:
        
        //INITIALIZE ARRAY WITH INTEGER VALUES 1,2,3//
        NSArray *testArray = [NSArray arrayWithObjects:@1,@2,@3, nil];
        
        //Java Implementation: Int[] testArray = {1,2,3};
        
        //CREATE STRING FROM ARRAY-ELEMENTS JOINED BY A ','//
        NSString *arrayString = [testArray componentsJoinedByString:@","];
        
        //Java Implementation: String arrayText = Arrays.toString(testArray);

        //PRINT OUT STRING GENERATED FROM ARRAY//
        NSLog(@"%@",arrayString);
        
        //Java Implementation: System.out.print(arrayText);
        
        //GET LENGTH OF ARRAY//     
        NSUInteger arrayLength = [testArray count];
        NSLog(@"Number of elements in array: %lu",arrayLength);
        //In objective C count is an instance method that is defined inside the NSArray class.
        
        //Java Implementation :
        //int arrayLength = testArray.length;
        //System.out.println("Number of elements in array: "+arrayLength);
        //In Java length is a field/instance variable that lives inside an instance of an Array class.
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 2: How common is aliasing and how is it avoided compared to the other OO language.]------------\\
        
        //Aliasing refers to the situation where a data location in memory (f.x. an object) is refered to by different objects.
        
        //In objective-C there's two different kinds of pointers between objects: weak & strong.
        
        NSLog(@".oO( Comparison 2 )Oo.");
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 3: Object allocation and initialisation]-------------------------------------------------------\\
        
        /*In Objective C the object allocation and intialisation consists of two steps: First the class method (+ alloc) is
         called, and this allocates the required free memory to hold the object, and returns a pointer to this space, second
         the instance method (- init) is called which returns a pointer to the initialised object. These two methods are
         always used nested when creating an instance of an object.
         In Java we just use the "new" keyword which does allocation and initalisation automatically.*/
        
        NSLog(@".oO( Comparison 3 )Oo.");
        
        //CREATE AN INSTANCE OF AN OBJECT
        
        Person *personInstance = [[Person alloc] init];
        
        //Java Implementation: Person personInstance = new Person();
        
        //CREATE AN INSTANCE OF AN OBJECT USING PARAMETERS
        
        NSString *stringInstance = [[NSString alloc] initWithFormat:@"THIS IS A STRING INSTANCE"];
        NSLog(@"%@",stringInstance);
        
        //Java Implementation:
        //String stringInstance = new String("THIS IS A STRING INSTANCE");
        //System.out.println(stringInstance);
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 4: How are class-types used with those in the other OO language]-------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 5: How constructors and factories are used]----------------------------------------------------\\
        
        //In Objective-C factories can be used for creating new instances of an object.
        //A class-method (+) is used to create a new instance of the class and setting its properties according to the parameter values that are passed in.
        //I have never seen this way of creating new instances of objects in Java.
        
        NSLog(@".oO( Comparison 5 )Oo.");
        
        //USE OF CLASS METHOD TO CREATE INSTANCE OF STRING METHOD//
        
        NSString *stringInstanceFromClassMethod = [NSString stringWithFormat:@"THIS IS A STRING INSTANCE"];
        NSLog(@"%@",stringInstanceFromClassMethod);
        
        //This seems like an easier way to create a string than the way described in Comparison 3.
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 6: How dows copying and cloning of objects work?]----------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 7: Dynamic typing]-----------------------------------------------------------------------------\\

        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 8: Dynamic typing of ID's]---------------------------------------------------------------------\\
        
        //In Objective-C you have the ability to use the "id" type for a variable that allows that variable to hold
        //a pointer to any kind of Objective-C object, whitout knowing what kind of object it is. This approach is called
        //dynamic typing. This can be used f.x. in sitations where you aren't interested in what type of object you're given
        //since you don't have to modify it.
        
        //I'm not familiar with any other OO programming languages that supports dynamic typing in a special type of
        //variable. I only no that this is not possible in Java.
        
        NSLog(@".oO( Comparison 8 )Oo.");
        
        //DYNAMIC TYPING OF ARRAY:
        
        id randomObject = @"Hello";
        
        NSLog(@"The length of \"%@\" is %lu", randomObject, [randomObject length]);
        
        randomObject = [NSArray arrayWithObjects:@1, @2, @3, nil];
        
        NSLog(@"The length of \"%@\" is %lu", randomObject, [randomObject count]);
        
        //The problem with dynamic typing using id's is that you lose information about the type of the object and you won't
        //know what type of object you have during runtime. If you're not careful about this you might end up calling a
        //method that doesn't exist for the object and that will result in a runtime error -> program will definately crash.
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 9: How are expanded types declared?]-----------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 10: How does field hiding work?]---------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 11: How is immutability used?]-----------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 12: How does inheritance work?]----------------------------------------------------------------\\
        
        //In Objective-C we can declare classes that inherit from other classes just like in other OO programming languages.
        //Objective-C only supports single inheritance, just like Java. When an object is inheriting from another object
        //it inherits all of the parent class' methods and properties.
        
        //An example of inheritance below:
        
        Person *Hans = [[Person alloc] init];
        Hans.firstName = @"Hans";
        Hans.lastName = @"Hansen";
        
        NSLog(@"%@",[Hans fullName]);
        
        Boy *Peter = [[Boy alloc] init];
        Peter.firstName = @"Peter";
        Peter.lastName = @"Petersen";
        
        NSLog(@"%@",[Peter fullName]);
        NSLog(@"%@",[Peter hobbies]);
        
        //We see from the example above that Peter as a boy inherits the two properties firstName and lastName from Person,
        //and that the also inherits the method fullName. Also only Peter has access to the method hobbies.
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 13: How are the built in methods for logging?]-------------------------------------------------\\
        
        NSLog(@".oO( Comparison 13 )Oo.");

        
        //In Objective C we use the NSLog object to print to the console:
        
        NSLog(@"This is a logging message to the console");
        
        //Java Implementation: System.out.print("This is a logging message to the console");
        
        //These two ways of printing to the console seems quite alike.
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 14: How does method overloading work?]---------------------------------------------------------\\
        
        //Objective-C doesn't support method overloading. This means that unlike Java a class is not able to have two or
        //more methods with the same name and different parameters. We are though able to An example is given below here using some material
        //from the [irony] best singer in the world [/irony]:
        
        NSLog(@".oO( Comparison 14 )Oo.");
        
        [Peter transformStringIntoFamousPitbullSong:@"I know you want me" byAddingCountIn:@"Spanish"];
        [Peter transformStringIntoFamousPitbullSong:@"Mr Worldwide" byAddingCountIn: @"English" andFourCities:@"New York, Paris, London, Milano"];
        [Peter transformStringIntoFamousPitbullSong:@"Yeah" byAddingCountIn:@""];
        
        //If we do things like this we are able to implements two or more methods with the same name since in Objective-C
        //the method name corresponds to the argument names as well. We can only have one method with only one parameter
        //though. We are not able to make two methods each with only one argument were these two arguments are different.
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 15: How does polymorphism work?]---------------------------------------------------------------\\
        
        NSLog(@".oO( Comparison 15 )Oo.");
        
        //In Objective-C it is just like in Java possible to declare two different methods with the same name for
        //a super class and a sub class. For example the Person instance Hans gives a different version of the
        //sayHello method than Peter who is an instance of a Boy. As a result the sayHello method for a Boy instance
        //overwrites the sayHello method for a Person instance. This is polymorphism.
        
        [Hans sayHello];
        [Peter sayHello];

        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 16: How is NSArray compared with arrays from other OO languages?]------------------------------\\
        
        //The array types in Objective-C: NSArray & NSMutableArray are quite different from the Array objects in Java.
        //The reason is that both NSArray & NSMutableArray are able to hold different types of objects at the same time.
        //F.x. the same NSArray can hold both an NSNumber object and an NSString object at the same time.
        //This is not possible in Java, where you specify the object types when allocation the array.
        
        NSLog(@".oO( Comparison 16 )Oo.");
        
        NSString *randomString = [NSString stringWithFormat:@"Hej"];
        NSNumber *randomNumber = @40;
        
        NSArray *array = [NSArray arrayWithObjects:randomString, randomNumber, nil];
        NSLog(@"%@",array);
        
        //We see that it is possible for us to place mixed types of objects in an array in Objective-C
        
        //In Java we would have to define the type like this:
        //int[] testArray = {1,2,3};
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 17: How does nil work?]------------------------------------------------------------------------\\
        
        //In Objective-C the term 'nil' refers to the object zero. Is much like the 'null' in Java.
        //The difference between Java and Objective-C when it comes to nil/null is that in Objective-C
        //it is okay to send a message to nil, the program won't crash because of that, just nothing will happens.
        //In Java though you will get a NullPointerException that will stop the program.
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 18: How does primitive types look compared to other OO languages?]-----------------------------\\
        
        //In Objective-C the primitive types are the following: char, double, float, int, long, short, BOOL.
        //All these types can be hold in an NSNumber object.
        
        //In Java the primitive types are the following: byte, short, int, long, float, double, boolean, char
        
        //So the primitive types in Objective-C and Java matches pretty well. Normally when passing primitives around
        //Objective-C they are wrapped inside a NSNumber object. This is because primitive types are inherited from C and
        //primitive types are passed by value and not reference.
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 19: How does protocols work?]------------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 20: How are singletons defined and used?]------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 21: How does static and dynamic method resolution work?]---------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 22: How does strong vs weak pointers work?]----------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 23: How does variance work?]-------------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 24: How do exceptions work?]-------------------------------------------------------------------\\'
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 25: How does value boxing and unboxing work]---------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 26: How does introspection work?]--------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 27: How do enumarations work?]-----------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 28: How do property list work?]----------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 29: How do blocks work?]-----------------------------------------------------------------------\\
        
    }
    return 0;
}

