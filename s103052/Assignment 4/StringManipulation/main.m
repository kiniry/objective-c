	/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 4 (String Manipulation).
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>

static const long iterations1 = 100000;
static const long iterations2 = 1000000;

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSDate* startTime = [NSDate date];
	int i = 0;
	
	NSMutableString* stringTestMutable = [NSMutableString string];
    NSString* stringTestImmutable = [stringTestMutable copy];
	
	/**
	* 1.0 - CONTAINS TESTS FOR THE SCENARIO: MutableString appending with 100.000 interations
	*/
	
	NSLog(@"START TEST 1.0");
	startTime = [NSDate date];
	
	for (i = 0; i < iterations1; i++)
		[stringTestMutable appendString:@"x"];
	
	double timeProfileProtocol_1 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.0");
	
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIO: ImmutableString appending 100.000 interations
	*/
	
	NSLog(@"START TEST 1.1");
	startTime = [NSDate date];
	
	for (i = 0; i < iterations1; i++)
		[stringTestImmutable stringByAppendingString:@"x"];
	
	double timeProfileProtocol_2 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.1");

	/**
	* 1.2 - CONTAINS TESTS FOR THE SCENARIO: MutableString appending with 1.000.000 interations
	*/
	
	NSLog(@"START TEST 1.2");
	startTime = [NSDate date];
    
	for (i = 0; i < iterations2; i++)
		[stringTestMutable appendString:@"x"];
		
	double timeProfileProtocol_3 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.2");
	
	/**
	* 1.3 - CONTAINS TESTS FOR THE SCENARIO: ImmutableString appending with 1.000.000 interations
	*/
	
	NSLog(@"START TEST 1.3");
	startTime = [NSDate date];
    
	for (i = 0; i < iterations2; i++)
		[stringTestImmutable stringByAppendingString:@"x"];
		
	double timeProfileProtocol_4 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.3");
	
	NSLog(@"TEST 1.0 - Timing Profile: %f",timeProfileProtocol_1);
	NSLog(@"TEST 1.1 - Timing Profile: %f",timeProfileProtocol_2);
	NSLog(@"TEST 1.2 - Timing Profile: %f",timeProfileProtocol_3);
	NSLog(@"TEST 1.3 - Timing Profile: %f",timeProfileProtocol_4);
	
	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

