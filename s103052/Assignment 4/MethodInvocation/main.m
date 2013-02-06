/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 4 (Method Invocations).
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "TestClass.h"

static const long iterations = 1000000;

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSDate* startTime = [NSDate date];
	int i = 0;
	
	TestClass* testClass = [[TestClass alloc] init];
	
	/**
	* 1.0 - CONTAINS TESTS FOR THE SCENARIO: Call instance method
	*/
	NSLog(@"START TEST 1.0");
	startTime = [NSDate date];
	
	for (i = 0; i < iterations; i++)
		[testClass InstanceMethod];
	
	double timeProfileProtocol_1 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.0");
	
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIO: Call class method 
	*/
	
	NSLog(@"START TEST 1.1");
	startTime = [NSDate date];
	
	for (i = 0; i < iterations; i++)
		[TestClass ClassMethod];
	
	double timeProfileProtocol_2 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.1");

	/**
	* 1.2 - CONTAINS TESTS FOR THE SCENARIO: Call instance method via Selector
	*/
	
	NSLog(@"START TEST 1.2");
	startTime = [NSDate date];
    
	for (i = 0; i < iterations; i++)
		[testClass performSelector:@selector(InstanceMethod)];

	double timeProfileProtocol_3 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.2");
	
	/**
	* 1.3 - CONTAINS TESTS FOR THE SCENARIO: Call class method via Selector
	*/
	
	NSLog(@"START TEST 1.3");
	startTime = [NSDate date];
    
	for (i = 0; i < iterations; i++)
		[TestClass performSelector:@selector(ClassMethod)];

	double timeProfileProtocol_4 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.3");
	
	/**
	* 1.4 - CONTAINS TESTS FOR THE SCENARIO: Call object via Introspection
	*/
	
	NSLog(@"START TEST 1.4");
	startTime = [NSDate date];
    
	for (i = 0; i < iterations; i++)
	{
		if ([testClass isKindOfClass:[testClass class]])
			if ([testClass respondsToSelector:@selector(InstanceMethod)])
                    [testClass InstanceMethod];
    }

	double timeProfileProtocol_5 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.4");
	
	NSLog(@"TEST 1.0 - Timing Profile: %f",timeProfileProtocol_1);
	NSLog(@"TEST 1.1 - Timing Profile: %f",timeProfileProtocol_2);
	NSLog(@"TEST 1.2 - Timing Profile: %f",timeProfileProtocol_3);
	NSLog(@"TEST 1.3 - Timing Profile: %f",timeProfileProtocol_4);
	NSLog(@"TEST 1.4 - Timing Profile: %f",timeProfileProtocol_5);
	
	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

