/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 3 (Defensive) program.
 *
 *  Created on  : 17/01/2013
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
	* 1.0 - CONTAINS TESTS FOR THE SCENARIOS: MARRIAGE AND DIVORCE BETWEEN REGULAR CITIZENS.
	*/
	
	// a) Create new regular Citizens
    Citizen* HansJensen = [[Citizen alloc] initWithName:@"Hans Jensen" withSex:@"Male" 
											withAge:[NSNumber numberWithInt:45]];
    Citizen* AnnaNielsen = [[Citizen alloc] initWithName:@"Anna Nielsen" withSex:@"Female" 
											withAge:[NSNumber numberWithInt:18]];
    Citizen* MartinJensen = [[Citizen alloc] initWithName:@"Martin Jensen" withSex:@"Male" 
											withAge:[NSNumber numberWithInt:20]];
	Citizen* MiaNielsen = [[Citizen alloc] initWithName:@"Mia Nielsen" withSex:@"Female" 
											withAge:[NSNumber numberWithInt:42]];
	Citizen* MetteLarsen = [[Citizen alloc] initWithName:@"Mette Larsen" withSex:@"Female" 
											withAge:[NSNumber numberWithInt:30]];											
	Citizen* SimonHansen = [[Citizen alloc] initWithName:@"Simon Hansen" withSex:@"Male" 
											withAge:[NSNumber numberWithInt:32]];		
	Citizen* EmilOlsen = [[Citizen alloc] initWithName:@"Emil Olsen" withSex:@"Male" 
											withAge:[NSNumber numberWithInt:35]];	

    /** Step 1) Add Children (OK) **/
	[HansJensen addChild:AnnaNielsen];			// OK!
	[MiaNielsen addChild:AnnaNielsen];			// OK!
	
	/** Step 2) Add Children (FAIL) **/
	//[AnnaNielsen addChild:HansJensen];		// Exception: "You are not allowed to add one of your own parents!"
	//[AnnaNielsen addChild:MiaNielsen];		// Exception: "You are not allowed to add one of your own parents!"
	//[HansJensen addChild:AnnaNielsen];		// Exception: "The citizen already has a father!"
	//[MartinJensen addChild:AnnaNielsen];		// Exception: "The citizen already has a father!"
	//[MiaNielsen addChild:AnnaNielsen];		// Exception: "The citizen already has a mother!"
	//[MetteLarsen addChild:AnnaNielsen];		// Exception: "The citizen already has a mother!"
	//[MetteLarsen addChild:nil];				// Exception: "You must specify a citizen!"
	
	/** Step 3) Legal Marriage (OK) **/
	[HansJensen marry:MiaNielsen];				// OK!
	[AnnaNielsen marry:MartinJensen];			// OK!
	
	/** Step 4) Not Legal Marriage (FAIL) **/
	//[HansJensen marry:AnnaNielsen];			// Exception: "Not a legal marriage. Invalid spouse!" (Incest)
	//[AnnaNielsen marry:HansJensen];			// Exception: "Not a legal marriage. Invalid spouse!" (Incest)
	//[AnnaNielsen marry:AnnaNielsen];			// Exception: "Not a legal marriage. Invalid spouse!"
	//[MetteLarsen marry:AnnaNielsen];			// Exception: "Not a legal marriage. Invalid spouse!" (Homosexuality)
	//[EmilOlsen marry:SimonHansen];			// Exception: "Not a legal marriage. Invalid spouse!" (Homosexuality)
	//[EmilOlsen marry:MiaNilsen];				// Exception: "Not a legal marriage. Invalid spouse!"
	//[EmilOlsen marry:nil];					// Exception: "Not a legal marriage. Invalid spouse!"
	
	/** Step 5) Legal Divorce (OK) **/
    [MiaNielsen divorce:HansJensen];			// OK!
        
	/** Step 6) Not Legal Divorce (FAIL) **/
	//[EmilOlsen divorce:MetteLarsen];			// Exception: "You are single and therefore unable to divorce this person!"
    //[MiaNielsen divorce:HansJensen];			// Exception: "You are single and therefore unable to divorce this person!"
	//[MartinJensen divorce:MetteLarsen];		// Exception: "The divorce is not possible!"
	//[MartinJensen divorce:MartinJensen];		// Exception: "The divorce is not possible!"
	//[MartinJensen divorce:nil];				// Exception: "The divorce is not possible!"
	
	// Print Description of Test Citizens
	NSLog(@"%@",[HansJensen description]);
	NSLog(@"%@",[AnnaNielsen description]);
	NSLog(@"%@",[MartinJensen description]);
	NSLog(@"%@",[MiaNielsen description]);
	NSLog(@"%@",[MetteLarsen description]);
	NSLog(@"%@",[EmilOlsen description]);
	NSLog(@"%@",[SimonHansen description]);
	
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIOS: MARRIAGE BETWEEN NOBLE PERSONS
	*/	
	
    // a) Create new Noble Persons
    NoblePerson* AmandaAndersen = [[NoblePerson alloc] initWithName:@"Amanda Andersen" withSex:@"Female" 
														withAge:[NSNumber numberWithInt:54] withAssets:70000];
	NoblePerson* JanAndersen = [[NoblePerson alloc] initWithName:@"Jan Andersen" withSex:@"Male" 
														withAge:[NSNumber numberWithInt:25] withAssets:1000];
    NoblePerson* JensKristensen = [[NoblePerson alloc] initWithName:@"Jens Kristensen" withSex:@"Male" 
														withAge:[NSNumber numberWithInt:60] withAssets:100000];
	NoblePerson* ChristineMadsen = [[NoblePerson alloc] initWithName:@"Christine Madsen" withSex:@"Female" 
														withAge:[NSNumber numberWithInt:70] withAssets:300000];
	NoblePerson* AnnaJensen = [[NoblePerson alloc] initWithName:@"Anna Jensen" withSex:@"Female" 
														withAge:[NSNumber numberWithInt:70] withAssets:50000];													
	// b) Create a Butler Citizen
    Citizen* Butler = [[Citizen alloc] initWithName:@"Butler" 
										withSex:@"Male" withAge:[NSNumber numberWithInt:30]];
	
	/** Step 1) Add Children (OK) **/	
	[AmandaAndersen addChild:JanAndersen];			// OK!
	[AmandaAndersen addChild:EmilOlsen]; 			// OK!
	
	/** Step 2) Add Butler (OK) **/
	[AmandaAndersen setButler:EmilOlsen];			// OK!
	[AmandaAndersen setButler:Butler];				// OK!
	[ChristineMadsen setButler:EmilOlsen];			// OK!
	
	/** Step 3) Add Butler (FAIL **/
	//[JensKristensen setButler:ChristineMadsen];	// Exception: "You are not allowed to have a Noble Butler!"
	//[JensKristensen setButler:JensKristensen];	// Exception: "You are not allowed to have a Noble Butler!"
	//[AmandaAndersen setButler:nil];				// Exception: "You must specify a Citizen as Butler!"
	
	/** Step 4) Legal Marriage (OK) **/
	[AmandaAndersen marryNoble:JensKristensen];		// OK!
        
    /** Step 5) Not Legal Marriage (FAIL) **/
	//[AmandaAndersen marryNoble:JanAndersen];   	// Exception: "Not a legal marriage. Invalid spouse!"
	//[AmandaAndersen marryNoble:JensKristensen];	// Exception: "Not a legal marriage. Invalid spouse!"
	//[ChristineMadsen marryNoble:AnnaJensen];		// Exception: "Not a legal marriage. Invalid spouse!"
	//[AnnaJensen marryNoble:JanAndersen];			// Exception: "No marriage. You don't have a Butler!"
	//[ChristineMadsen marryNoble:SimonHansen];		// Exception: "No marriage. You are not Noble!"
	
    /** Step 5) Legal Divorce (OK) **/
    [AmandaAndersen divorce:JensKristensen];		// OK!
        
	/** Step 6) Not Legal Divorce (FAIL) **/
	//[ChristineMadsen divorce:JanAndersen];		// Exception: "You are single and therefore unable to divorce this person!"

	// Print Description of Test Noble Persons + Butler
	NSLog(@"%@",[AmandaAndersen description]);
	NSLog(@"%@",[JanAndersen description]);
	NSLog(@"%@",[JensKristensen description]);
	NSLog(@"%@",[ChristineMadsen description]);
	NSLog(@"%@",[Butler description]);
	
	/********** TEST DONE **********/
	
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

