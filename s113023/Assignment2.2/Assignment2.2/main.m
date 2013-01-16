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
        
        //Examples on object allocation and initialisations in Objective-C below and comparison to Java.
        
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
        
        //Example of how factories are used in Objective-C:
        
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
        
        //Example on how dynamic typing using id's can be used in Objective-C. In the example below we use an instance
        //of an NSString and an NSArray:
        
        NSLog(@".oO( Comparison 8 )Oo.");
        
        //DYNAMIC TYPING OF ARRAY:
        
        id randomObject = @"Hello";
        
        NSLog(@"The length of \"%@\" is %lu", randomObject, [randomObject length]);
        
        randomObject = [NSArray arrayWithObjects:@1, @2, @3, nil];
        
        NSLog(@"The length of \"%@\" is %lu", randomObject, [randomObject count]);
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 9: How are expanded types declared?]-----------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 10: How does field hiding work?]---------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 11: How is immutability used?]-----------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 12: How does inheritance work?]----------------------------------------------------------------\\
        
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
        
        //Examples on logging in Objective-C
        
        NSLog(@".oO( Comparison 13 )Oo.");
        
        //In Objective C we use the NSLog object to print to the console:
        
        NSLog(@"This is a logging message to the console");
        
        //Java Implementation: System.out.print("This is a logging message to the console");
        
        //These two ways of printing to the console seems quite alike.
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 14: How does method overloading work?]---------------------------------------------------------\\
        
        //Example on method overloading in Objective-C:
        
        NSLog(@".oO( Comparison 14 )Oo.");
        
        [Peter transformStringIntoFamousPitbullSong:@"I know you want me" byAddingCountIn:@"Spanish"];
        [Peter transformStringIntoFamousPitbullSong:@"Mr Worldwide" byAddingCountIn: @"English" andFourCities:@"New York, Paris, London, Milano"];
        [Peter transformStringIntoFamousPitbullSong:@"Yeah" byAddingCountIn:@""];
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 15: How does polymorphism work?]---------------------------------------------------------------\\
        
        //Example on one kind of polymorphism:
        
        NSLog(@".oO( Comparison 15 )Oo.");
        
        [Hans sayHello];
        [Peter sayHello];

        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 16: How is NSArray compared with arrays from other OO languages?]------------------------------\\
        
        //Example on Objective-C arrays with mixed types of objects:
        
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
        
        //Example on nil pointer:
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 18: How does primitive types look compared to other OO languages?]-----------------------------\\
        
        //See readme for explanation on this topic
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 19: How does protocols work?]------------------------------------------------------------------\\
        
        //Example on a protocol in Objective-C:
        
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

