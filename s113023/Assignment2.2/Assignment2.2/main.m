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
#import "AustinPowers.h"
#import "PersonAlternative.h"
#import "TVShows.h"

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
        
        //See readme
        
        
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
        
        //See readme
        
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
        
        NSLog(@".oO( Comparison 6 )Oo.");
        
        //Example of copying an object
        Person *personReadyForCloning = [[Person alloc] init];
        personReadyForCloning.firstName = @"Franz";
        personReadyForCloning.lastName = @"Ferdinand";

        Person *clonedPerson = personReadyForCloning;
        NSLog(@"%@",[personReadyForCloning fullName]);
        NSLog(@"%@",[clonedPerson fullName]);
        
        //Trying to change last name of cloned person:
        
        clonedPerson.lastName = @"Jäger";
        NSLog(@"%@",[personReadyForCloning fullName]);
        NSLog(@"%@",[clonedPerson fullName]);
        
        //we see that personReadyForCloning's lastName was changed as well. This is because the cloned person holds
        //just a new reference to the personReadyForCloning.
        
        //If we try using the copy method as below the program will crash with an NSInvalidArgumentException, since our
        //Person class hass to implement the NSCopying protocol.
        //Person *newClonedPerson = [personReadyForCloning copy];
        
        //we try with strings instead:
        NSString *stringReadyForCloning = @"I'm ready for cloning";
        NSString *clonedString = [stringReadyForCloning copy];
        NSLog(@"%@",stringReadyForCloning);
        NSLog(@"%@",clonedString);
        
        clonedString = @"I'm successfully cloned";
        NSLog(@"%@",stringReadyForCloning);
        NSLog(@"%@",clonedString);
        
        //So for NSStrings the protocol NSCopying has been implemented and therefore we are able to copy the whole string-object
        //To a new string object instance.
        
        PersonAlternative *anotherPerson = [[PersonAlternative alloc] init];
        anotherPerson.firstName = @"Jessica";
        anotherPerson.lastName = @"Alba";
        
        NSString *jessicasFullName = anotherPerson.fullName;
        NSLog(@"Jessicas %@",anotherPerson.fullName);
        NSLog(@"Jessicas %@",jessicasFullName);
        
        jessicasFullName =@"Full Name: Peter Griffin";
        NSLog(@"Jessicas %@",anotherPerson.fullName);
        NSLog(@"Jessicas %@",jessicasFullName);
        
        //Here we are also copying the fullName property from the instance of the PersonAlternative object. But
        //the copy will not be able to change the propery for the object since the property was declared as (copy).
        
        //In Java you can use the method copy() to copy an object if the object has this method specified.
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
        
        NSLog(@".oO( Comparison 10 )Oo.");
        
        Person *PersonForFieldHidingTest = [[Person alloc] init];
        //PersonForFieldHidingTest._firstName = @"Hans";
        //Line above wont work by default.
        
        PersonForFieldHidingTest.firstName = @"Hans";
        //By default we have to use accesor-method like above.
        
        //Java Implementation:
        //private String _name; - Would result in a private field that can't be accessed from outside the class
        //public String _name; - Would result in a public field that is accessible from outside the class
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 11: How is immutability used?]-----------------------------------------------------------------\\
        
        NSLog(@".oO( Comparison 11 )Oo.");
        
        //Example on inmutable classes in Objective-C:
        
        NSArray *inmutableArrayTest = [[NSArray alloc]initWithObjects:@"foo", nil];
        NSLog(@"%@",inmutableArrayTest);
        
        //We can add a new object to the array in the following way:
        inmutableArrayTest = [inmutableArrayTest arrayByAddingObject:@"bar"];
        NSLog(@"%@",inmutableArrayTest);

        //Example on mutable classes in Objective-C:
                
        NSMutableArray *mutableArrayTest = [[NSMutableArray alloc]initWithObjects:@"foo",nil];
        NSLog(@"%@",mutableArrayTest);
        
        //We can add a new object to the array in the following way:
        [mutableArrayTest addObject:@"bar"];
        NSLog(@"%@",mutableArrayTest);
        
        [mutableArrayTest replaceObjectAtIndex:0 withObject:@"bar"];
        NSLog(@"%@",mutableArrayTest);
        
        //Java Implementation of mutable array (arrayList):
        //ArrayList arrayListTest = new ArrayList();
		//arrayListTest.add("foo");
		//arrayListTest.add("bar");
		//System.out.println(arrayListTest);
        
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
        
         NSLog(@".oO( Comparison 17 )Oo.");
        
        //Example on nil pointer:
        Peter = nil;
        NSLog(@"%@",[Peter fullName]);
        
        //We see that even though we are setting the pointer to nil, we are still able to call the method fullName
        //on it. The method will just return (null)
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 18: How does primitive types look compared to other OO languages?]-----------------------------\\
        
        //See readme for explanation on this topic
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 19: How does protocols work?]------------------------------------------------------------------\\
        
        //Example on a protocol in Objective-C:
        
        NSLog(@".oO( Comparison 19 )Oo.");
        
        AustinPowers *AustinFromSixties = [[AustinPowers alloc] initWithVelourColor:@"cyan"];
        NSLog(@"Today the color of Austin's jacket is: %@",AustinFromSixties.velourColor);
        [AustinFromSixties sayAustinQoute];
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 20: How are singletons defined and used?]------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 21: How does static and dynamic method resolution work?]---------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 22: How does strong vs weak pointers work?]----------------------------------------------------\\
        
        //Explaned in readme
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 23: How does variance work?]-------------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 24: How do exceptions work?]-------------------------------------------------------------------\\'
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 25: How does value boxing and unboxing work]---------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 26: How does introspection work?]--------------------------------------------------------------\\
        
        NSLog(@".oO( Comparison 26 )Oo.");
        
        Boy *JamesBrown = [[Boy alloc] init];
        JamesBrown.firstName = @"James";
        JamesBrown.lastName = @"Brown";
        
        //Check whether James Brown is a kind of class:
        if ([JamesBrown isKindOfClass:[Person class]]){
            NSLog(@"%@ is both a Boy and a Person",[JamesBrown fullName]);
        }
        
        //Check whether James Brown has the ability to transformASongIntoFamousPitbullSong:
        if ([JamesBrown respondsToSelector:@selector(transformStringIntoFamousPitbullSong:byAddingCountIn:andFourCities:)]){
            NSLog(@"%@ know how to make a famous song now-a-days",[JamesBrown fullName]);
        }
        
        //Java Implementation - Find class that instance is an instance of:
        //System.out.println(personInstance.getClass());
                
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 27: How do enumarations work?]-----------------------------------------------------------------\\
        
        NSLog(@".oO( Comparison 27 )Oo.");

        //Example in Objective-C on fast enumaration:
        
        NSArray *beerNames = [NSArray arrayWithObjects:@"Groen Tuborg",@"Carls Special",@47,@"Christmas Brew", nil];
        
        id beer;
        for (beer in beerNames){
            NSLog(@"Yeah, heres another beer: %@",beer);
        }
        
        //Java Implementation:
        //String[] tekstArray = {"Groen Tuborg","Carls Special","47","Christmas Brew"};
		//for (String s: tekstArray){
		//      System.out.println(s);
		//}
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 28: How do property list work?]----------------------------------------------------------------\\
        
        
        
        //+-----------------------------------------------------------------------------------------------------------+\\
        //--[COMPARISON 29: How do blocks work?]-----------------------------------------------------------------------\\
        
        NSLog(@".oO( Comparison 29 )Oo.");
        
        //Using blocks for fast enumaration:
        
        TVShows *animatedTVShowList = [[TVShows alloc] initWithTVShows:@[@"Futurama",@"The Simpsons",@"Family Guy"]];
        
        __block NSString *showToSearchFor = @"Californication";
        
        [animatedTVShowList enumerateTVShowsWithBlock:^(NSString *name, int index, BOOL *stop) {
            if ([name isEqualToString:showToSearchFor]){
                NSLog(@"Yeaah, we found %@",showToSearchFor);
                *stop = YES;
            } else {
                NSLog(@"Found %@ but that wasn't: %@",name,showToSearchFor);
            }
        }];
        
        TVShows *normalTVShowList = [[TVShows alloc] initWithTVShows:@[@"Breaking Bad",@"Game of Thrones",@"HIMYM",@"Californication"]];
        
        [normalTVShowList enumerateTVShowsWithBlock:^(NSString *name, int index, BOOL *stop) {
            if ([name isEqualToString:showToSearchFor]){
                NSLog(@"Yeaah, we found %@",showToSearchFor);
                *stop = YES;
            } else {
                NSLog(@"Found %@ but that wasn't: %@",name,showToSearchFor);
            }
        }];
        
        
        
    }
    return 0;
}

