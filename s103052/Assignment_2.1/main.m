/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 2 program
 *				  (First part of Assigment 2)
 *
 *  Created on  : 15/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
   
	/**
	* 1.0 - CONTAINS TESTS FOR THE SCENARIOS: MARRIAGE BETWEEN REGULAR CITIZENS.
	*/
		
	// a) Create new regular citizens
    Citizen* HansJensen = [[Citizen alloc] initWithName:@"Hans Jensen" withSex:@"Male" 
											withAge:[NSNumber numberWithInt:45]];
    Citizen* AnnaNielsen = [[Citizen alloc] initWithName:@"Anna Nielsen" withSex:@"Female" 
											withAge:[NSNumber numberWithInt:42]];
    Citizen* MartinJensen = [[Citizen alloc] initWithName:@"Martin Jensen" withSex:@"Male" 
											withAge:[NSNumber numberWithInt:19]];
	Citizen* MiaNielsen = [[Citizen alloc] initWithName:@"Mia Nielsen" withSex:@"Female" 
											withAge:[NSNumber numberWithInt:18]];
    // Step 1)
	[MartinJensen setFather:HansJensen];
	[MartinJensen setMother:AnnaNielsen];
    [HansJensen addChild:MartinJensen];
    [AnnaNielsen addChild:MartinJensen];
	
    NSLog(@"%@",[HansJensen printInfo]);
    NSLog(@"%@",[AnnaNielsen printInfo]);
	NSLog(@"%@",[MartinJensen printInfo]);
	NSLog(@"%@",[MiaNielsen printInfo]);   
	
    // Step 2) Not legal marriage
    [MartinJensen marry:AnnaNielsen];	// FAIL!
    [HansJensen marry:MartinJensen];	// FAIL!
        
    // Step 3) Legal marriage
    [AnnaNielsen marry:HansJensen];		// OK!
    [MiaNielsen marry:MartinJensen];	// OK!
   
    // Step 4) Not possible divorces
    [MiaNielsen divorce:HansJensen];	// FAIL!
        
    // Step 5) Possible divorce
    [MiaNielsen divorce:MartinJensen];	// OK!
        
		
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIOS: MARRIAGE BETWEEN NOBLE PERSONS
	*/	
	
    // a) Create new noble persons
    NoblePerson* MetteHansen = [[NoblePerson alloc] initWithName:@"Mette Hansen" withSex:@"Female" 
														withAge:[NSNumber numberWithInt:32] withAssets:80000];
    NoblePerson* OleHansen = [[NoblePerson alloc] initWithName:@"Ole Hansen" withSex:@"Male" 
														withAge:[NSNumber numberWithInt:55] withAssets:1500000];
    NoblePerson* AmandaAndersen = [[NoblePerson alloc] initWithName:@"Amanda Andersen" withSex:@"Female" 
														withAge:[NSNumber numberWithInt:50] withAssets:100];
    NoblePerson* JensKristensen = [[NoblePerson alloc] initWithName:@"Jens Kristensen" withSex:@"Male" 
														withAge:[NSNumber numberWithInt:38] withAssets:10000];
	// b) Create butler citizen
    Citizen* Butler = [[Citizen alloc] initWithName:@"Butler" 
										withSex:@"Male" withAge:[NSNumber numberWithInt:30]];
	// Step 1) Not legal marriage
    [AmandaAndersen addChild:JensKristensen];
    [AmandaAndersen marryNoble:JensKristensen];   	// FAIL!
    [AmandaAndersen setButler:Butler];
    [AmandaAndersen marryNoble:JensKristensen];		// FAIL!
        
    // Step 2 Legal marriage
    [AmandaAndersen marryNoble:OleHansen];			// OK!
    [MetteHansen setButler:Butler];
    [MetteHansen marryNoble:JensKristensen];		// OK!

	NSLog(@"Test Done!");
	
	[pool drain];
    return 0;
}

