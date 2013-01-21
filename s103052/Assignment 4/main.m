/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 4.
 *
 *  Created on  : 21/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "mem_Test.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	/**
	* 1.0 - CONTAINS TESTS FOR THE SCENARIOS: LEVENSHTEIN DISTANCE.
	*/
	
    NSString* s1 = @"kitten";
    NSString* s2 = @"sitting";
	
    int distance = [mem_Test LevenshteinDistanceBetween:s1 and:s2];
	NSLog(@"String 1: %@", s1);
	NSLog(@"String 2: %@", s2);
    NSLog(@"The Levenshtein distance: %d", distance);
	
	
	/********** TEST DONE **********/
		NSLog(@"Test Done!");
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

