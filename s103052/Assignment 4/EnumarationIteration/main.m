/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 4 (Enumarations/Interations).
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

static const long iterations = 1000000;

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSDate* startTime = [NSDate date];
	int i = 0;
	
	/**
	* 1.0 - Initializing array for testing
	*/
	
    NSLog(@"START INIT ARRAY");
	NSMutableArray* testArray = [NSMutableArray arrayWithCapacity:iterations];
    for (i = 0; i < iterations; i++)
		[testArray addObject:[NSNumber numberWithInt:i]];
    NSLog(@"INIT DONE!");
	
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIO: Standart Enumeration
	*/
	
	NSLog(@"START TEST 1.1");
	startTime = [NSDate date];
	
	for (i = 0; i < [testArray count]; i++);
	
	double timeProfileProtocol_1 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.1");

	/**
	* 1.2 - CONTAINS TESTS FOR THE SCENARIO: Fast Enuneration.
	*/
	
	NSLog(@"START TEST 1.2");
	startTime = [NSDate date];
    
	for (id i in testArray);
		
	double timeProfileProtocol_2 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.2");
	
	NSLog(@"TEST 1.1 - Timing Profile: %f",timeProfileProtocol_1);
	NSLog(@"TEST 1.2 - Timing Profile: %f",timeProfileProtocol_2);
	
	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

