/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 4 (Protocols).
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "ClassNoProtocol.h"
#import "ProtocolOne.h"
#import "ProtocolBig.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSDate* startTime = [NSDate date];
	
	/**
	* 1.0 - CONTAINS TESTS FOR THE SCENARIO: Class with no Protocol.
	*/
	
	NSLog(@"START TEST 1.0");
	startTime = [NSDate date];
	
	ClassNoProtocol* protocolTest1 = [[ClassNoProtocol alloc] init];
	
	[protocolTest1 helloWorld];
	
	double timeProfileProtocol_1 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.0");

	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIO: Class with one Protocol.
	*/
	
	NSLog(@"START TEST 1.1");
	startTime = [NSDate date];
	
	ProtocolOne* protocolTest2 = [[ProtocolOne alloc] init];
	
	[protocolTest2 Test1];
	[protocolTest2 Test2];
	[protocolTest2 Test3];
	[protocolTest2 Test4];
	[protocolTest2 Test5];
	[protocolTest2 Test6];
	[protocolTest2 Test7];
	[protocolTest2 Test8];
	[protocolTest2 Test9];
	[protocolTest2 Test10];
	
	double timeProfileProtocol_2 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.1");
	
	/**
	* 1.2 - CONTAINS TESTS FOR THE SCENARIO: Class with many protocols.
	*/
	
	NSLog(@"START TEST 1.2");
	startTime = [NSDate date];
	
	ProtocolBig* protocolTest3 = [[ProtocolBig alloc] init];
	
	[protocolTest3 Test1];
	[protocolTest3 Test2];
	[protocolTest3 Test3];
	[protocolTest3 Test4];
	[protocolTest3 Test5];
	[protocolTest3 Test6];
	[protocolTest3 Test7];
	[protocolTest3 Test8];
	[protocolTest3 Test9];
	[protocolTest3 Test10];
	
	double timeProfileProtocol_3 = [[NSDate date] timeIntervalSinceDate:startTime];
	NSLog(@"END TEST 1.2");
 	
	NSLog(@"TEST 1.0 - Timing Profile: %f",timeProfileProtocol_1);
	NSLog(@"TEST 1.1 - Timing Profile: %f",timeProfileProtocol_2);
	NSLog(@"TEST 1.2 - Timing Profile: %f",timeProfileProtocol_3);
	
	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

