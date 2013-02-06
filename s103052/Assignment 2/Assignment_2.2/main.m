/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 2 program
 *				  (Second part of Assigment 2)
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "Child.h"
#import "Parent.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
   
	/**
	* 1.0 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: Foundation Framework
	*/
	NSLog(@"START TEST 1.0");

    //Init NSArray with Integers
    NSArray* array_Test1 = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],nil];
    /*
		Java Implementation: 
		Int[] array_Test1 = {0,1};
	*/
	//Length of the array    
    NSUInteger array_Test1_Length = [array_Test1 count];
    NSLog(@"array_Test1_Length = %lu",array_Test1_Length);
	/*
		Java Implementation:
		int array_Test1_Length = array_Test1.length;
        System.out.println("array_Test1_Length = " + array_Test1_Length);
	*/
		
	/**
	* 1.1 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIOS: (Alloc / Init Objects) and (Constructors & Factories)
	*/
	NSLog(@"START TEST 1.1");
 
    //Instance of an obejct:
	Citizen* newCitizen = [[Citizen alloc] init];
    /*
		Java Implementation: 
		Citizen newCitizen = new Citizen();
    */
	//(Constructors & Factories) Instance of an object with parameters:
	Citizen* newCitizen2 = [[Citizen alloc] initWithName:@"name"];
    /*
		Java Implementation: 
		Citizen newCitizen2 = new Citizen("name");
    */   

	/**
	* 1.2 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: Copying
	*/
	NSLog(@"START TEST 1.2");
	//Copy of an object:
	Citizen* newCitizen3 = [[Citizen alloc] initWithName:@"Hans"];
    Citizen* newCitizen3_Cloned = newCitizen3;
	
    NSLog(@"newCitizen3 name = %@",[newCitizen3 getCitizenName]);
    NSLog(@"newCitizen3_Cloned name = %@",[newCitizen3_Cloned getCitizenName]);
	
	newCitizen3_Cloned.name = @"Jens";
	NSLog(@"newCitizen3_Cloned name = %@",[newCitizen3_Cloned getCitizenName]);

	//Use of copy method will crash with an NSInvalidArgumentException since we dont have implemented the NSCopying protocol.
	/* Citizen* newCitizen3_Cloned2 = [newCitizen3 copy]; */
	//The NSString object has the protocol NSCopying implemented.
	NSString* newString = @"String1";
    NSString* newString_Cloned = [newString copy];
    NSLog(@"newString: %@",newString);
    NSLog(@"newString_Cloned: %@",newString_Cloned);
	
    // Java are using the method copy() to do a copy of an obejct if the object has this method specified.
	
	/**
	* 1.3 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: Dynamic Typing of ID's
	*/
	NSLog(@"START TEST 1.3");

    //Dynamic typing id's of an instance of an NSString and an NSArray:
	id newObjectUnknown = @"Test";
	NSLog(@"Length of object = %lu",[newObjectUnknown length]);
    newObjectUnknown = [NSArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:1],nil];   
	NSLog(@"Length of object = %lu",[newObjectUnknown count]);
	
	/**
	* 1.4 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: Inheritance
	*/
	NSLog(@"START TEST 1.4");
	
	Citizen* newCitizen4 = [[Citizen alloc] init];
	newCitizen4.name = @"Hans";
	NSLog(@"newCitizen4 name = %@",[newCitizen4 getCitizenName]);
	
	Child* newChild = [[Child alloc] init];
	newChild.name = @"Jens";
	NSLog(@"newChild name = %@",[newChild getCitizenName]);
    NSLog(@"newChild string = %@",[newChild helloWorld]);

	/**
	* 1.5 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: NSArrays
	*/
	NSLog(@"START TEST 1.5");
    //Array with mixed types of objects:
	NSNumber* Array_NewNumber = [NSNumber numberWithInt:1];
	NSString* Array_NewString = @"String";
    NSArray* Array_NewArray = [NSArray arrayWithObjects:Array_NewNumber, Array_NewString, nil];
    NSLog(@"Array_NewArray: %@",Array_NewArray);

	/**
	* 1.6 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: Protocols
	*/
	NSLog(@"START TEST 1.6");
    
    Parent* newParent = [[Parent alloc]  initWithName:@"Hans"];
	[newParent helloWorld];
	
	/**
	* 1.7 - CONTAINS CODE EXPERIMENTS FOR THE SCENARIO: Introspection
	*/
	NSLog(@"START TEST 1.7");
	
	Child* newChild2 = [[Child alloc] init];
	newChild2.name = @"Jens";
        
    //Check if newChild2 is a kind of class Citizen
    if ([newChild2 isKindOfClass:[Citizen class]])
		NSLog(@"%@ is a kind of class Citizen",[newChild2 getCitizenName]);

	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

