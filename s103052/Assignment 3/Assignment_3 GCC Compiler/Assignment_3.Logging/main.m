/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 3 (Logging) program.
 *
 *  Created on  : 18/01/2013
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
	
	NSLog(@"START TEST 1.0");
	
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
	NSLog(@"STEP 1)");
	[HansJensen addChild:AnnaNielsen];		// OK!
	[MiaNielsen addChild:AnnaNielsen];		// OK!
	
	/** Step 2) Add Children (FAIL) **/
	NSLog(@"STEP 2)");
	[AnnaNielsen addChild:HansJensen];		// NSLOG: "You are not allowed to add one of your own parents!"
	[MetteLarsen addChild:nil];				// NSLOG: "You must specify a citizen!"
	[MartinJensen addChild:AnnaNielsen];	// NSLOG: "The citizen already has a father!"
	[MetteLarsen addChild:AnnaNielsen];		// NSLOG: "The citizen already has a mother!"
	
	/** Step 3) Legal Marriage (OK) **/
	NSLog(@"STEP 3)");
	[HansJensen marry:MiaNielsen];			// OK!
	[AnnaNielsen marry:MartinJensen];		// OK!
	
	/** Step 4) Not Legal Marriage (FAIL) **/
	NSLog(@"STEP 4)");
	[HansJensen marry:AnnaNielsen];			// NSLOG: "Precondition violation: Not a legal marriage. Invalid spouse!" + "Precondition violation: Marriage failed!
	[AnnaNielsen marry:HansJensen];			// NSLOG: "Precondition violation: Not a legal marriage. Invalid spouse!" + "Precondition violation: Marriage failed! 	
	[AnnaNielsen marry:AnnaNielsen];		// NSLOG: "Precondition violation: Not a legal marriage. Invalid spouse!" + "Precondition violation: Marriage failed!
	[MetteLarsen marry:AnnaNielsen];		// NSLOG: "Precondition violation: Not a legal marriage. Invalid spouse!" + "Precondition violation: Marriage failed!
	[EmilOlsen marry:SimonHansen];			// NSLOG: "Precondition violation: Not a legal marriage. Invalid spouse!" + "Precondition violation: Marriage failed!
	[EmilOlsen marry:MiaNielsen];			// NSLOG: "Precondition violation: Not a legal marriage. Invalid spouse!" + "Precondition violation: Marriage failed!
	[EmilOlsen marry:nil];					// NSLOG: "Postcondition violation: You must specify a spouse!"
	
	/** Step 5) Legal Divorce (OK) **/
	NSLog(@"STEP 5)");
    [MiaNielsen divorce:HansJensen];		// OK!
        
	/** Step 6) Not Legal Divorce (FAIL) **/
	NSLog(@"STEP 6)");
	[MiaNielsen divorce:HansJensen];		// NSLOG: "Precondition violation: You are single and therefore unable to divorce this person!"
	[EmilOlsen divorce:MetteLarsen];		// NSLOG: "Precondition violation: You are single and therefore unable to divorce this person!"
	[MartinJensen divorce:nil];				// NSLOG: "Precondition violation: The divorce is not possible!"
	[MartinJensen divorce:MartinJensen];	// NSLOG: "Precondition violation: The divorce is not possible!" + "Precondition violation: Divorce failed!" 
	[MartinJensen divorce:MetteLarsen];		// NSLOG: "Precondition violation: The divorce is not possible!"

	// Print Description of Test Citizens
	NSLog(@"%@",[HansJensen description]);
	NSLog(@"%@",[AnnaNielsen description]);
	NSLog(@"%@",[MartinJensen description]);
	NSLog(@"%@",[MiaNielsen description]);
	NSLog(@"%@",[MetteLarsen description]);
	NSLog(@"%@",[EmilOlsen description]);
	NSLog(@"%@",[SimonHansen description]);
	
	NSLog(@"END TEST 1.0");
	
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIOS: MARRIAGE BETWEEN NOBLE PERSONS
	*/	
	
	NSLog(@"START TEST 1.1");
	
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
	NSLog(@"STEP 1)");
	[AmandaAndersen addChild:JanAndersen];			// OK!
	[AmandaAndersen addChild:EmilOlsen]; 			// OK!
	
	/** Step 2) Add Butler (OK) **/
	NSLog(@"STEP 2)");
	[AmandaAndersen setButler:EmilOlsen];			// OK!
	[AmandaAndersen setButler:Butler];				// OK!
	[ChristineMadsen setButler:EmilOlsen];			// OK!
	
	/** Step 3) Add Butler (FAIL) **/
	NSLog(@"STEP 3)");
	[JensKristensen setButler:ChristineMadsen];		// NSLOG: "Precondition violation: You are not allowed to have a Noble Butler!"
	[JensKristensen setButler:JensKristensen];		// NSLOG: "Precondition violation: You are not allowed to have a Noble Butler!"
	[AmandaAndersen setButler:nil];					// NSLOG: "Precondition violation: You must specify a Citizen as Butler!"
	
	/** Step 4) Legal Marriage (ASSERTION OK) **/
	NSLog(@"STEP 4)");
	[AmandaAndersen marryNoble:JensKristensen];		// OK!
        
    /** Step 5) Not Legal Marriage (ASSERTION FAIL) **/
	NSLog(@"STEP 5)");
	[AmandaAndersen marryNoble:JanAndersen];   		// NSLOG: "Not a legal marriage. Invalid spouse!"
	[AmandaAndersen marryNoble:JensKristensen];		// NSLOG: "Not a legal marriage. Invalid spouse!"
	[ChristineMadsen marryNoble:AnnaJensen];		// NSLOG: "Not a legal marriage. Invalid spouse!"
	[AnnaJensen marryNoble:JanAndersen];			// NSLOG: "Precondition violation: No marriage. You don't have a Butler!"
	[ChristineMadsen marryNoble:SimonHansen];		// NSLOG: "No marriage. You are not Noble!"
	
    /** Step 6) Legal Divorce (ASSERTION OK) **/
	NSLog(@"STEP 6)");
    [AmandaAndersen divorce:JensKristensen];		// OK!
        
	/** Step 7) Not Legal Divorce (ASSERTION FAIL) **/
	NSLog(@"STEP 7)");
	[ChristineMadsen divorce:JanAndersen];			// NSLOG: "Precondition violation: You are single and therefore unable to divorce this person!"

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

