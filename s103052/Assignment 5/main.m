/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 5.
 *
 *  Created on  : 25/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "Random.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	/**
	* 1.0 - CONTAINS TESTS FOR THE RANDOM API CLASS
	*/
	NSLog(@"START TEST 1.0");
	
	Random* newRandomNumber = [[Random alloc] initWithSeed:300];
    int randomNumber_1 = [newRandomNumber nextInt];
	int randomNumber_2 = [newRandomNumber nextInt];
	int randomNumber_3 = [newRandomNumber nextInt];
	
	NSLog(@"Random Number 1 = %d",randomNumber_1);
	NSLog(@"Random Number 2 = %d",randomNumber_2);
	NSLog(@"Random Number 3 = %d",randomNumber_3);
        
	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

