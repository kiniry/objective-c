/*************************************************************************
 *  File name   : main.m
 *  Description : Main module for Assignment 5.
 *				  Contains test for the Random API Class
 *
 *  Created on  : 31/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import <Foundation/Foundation.h>
#import "Random.h"

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	Random* newRandomNumber = [[Random alloc] init];
	Random* newRandomNumberWithSeed = [[Random alloc] initWithSeed:80000];
	
	/**
	* 1.0 - CONTAINS TESTS FOR THE SCENARIO: nextInt Method.
	*/
	NSLog(@"START TEST 1.0");

	int randomNextIntNumber_1 = [newRandomNumber nextInt];
	int randomNextIntNumber_2 = [newRandomNumber nextInt];
	int randomNextIntNumber_3 = [newRandomNumberWithSeed nextInt];
    int randomNextIntNumber_4 = [newRandomNumberWithSeed nextInt];
	
	NSLog(@"Random Number 1 = %d",randomNextIntNumber_1);
	NSLog(@"Random Number 2 = %d",randomNextIntNumber_2);
	NSLog(@"Random Number 3 = %d",randomNextIntNumber_3);
	NSLog(@"Random Number 4 = %d",randomNextIntNumber_4);
    
	NSLog(@"END TEST 1.0");    
	
	/**
	* 1.1 - CONTAINS TESTS FOR THE SCENARIO: nextInt:(int)n Method.
	*/
	NSLog(@"START TEST 1.1");
	int intArg = 10;
	
	int randomNextIntArgNumber_1 = [newRandomNumber nextInt:intArg];
	int randomNextIntArgNumber_2 = [newRandomNumber nextInt:intArg];
	int randomNextIntArgNumber_3 = [newRandomNumberWithSeed nextInt:intArg];
    int randomNextIntArgNumber_4 = [newRandomNumberWithSeed nextInt:intArg];
	
	NSLog(@"Random Number 1 = %d",randomNextIntArgNumber_1);
	NSLog(@"Random Number 2 = %d",randomNextIntArgNumber_2);
	NSLog(@"Random Number 3 = %d",randomNextIntArgNumber_3);
	NSLog(@"Random Number 4 = %d",randomNextIntArgNumber_4);
	
	NSLog(@"END TEST 1.1");    
	
	/**
	* 1.2 - CONTAINS TESTS FOR THE SCENARIO: nextLong Method.
	*/
	NSLog(@"START TEST 1.2");
	
	long randomNextLongNumber_1 = [newRandomNumber nextLong];
	long randomNextLongNumber_2 = [newRandomNumber nextLong];
	long randomNextLongNumber_3 = [newRandomNumberWithSeed nextLong];
    long randomNextLongNumber_4 = [newRandomNumberWithSeed nextLong];
	
	NSLog(@"Random Number 1 = %ld",randomNextLongNumber_1);
	NSLog(@"Random Number 2 = %ld",randomNextLongNumber_2);
	NSLog(@"Random Number 3 = %ld",randomNextLongNumber_3);
	NSLog(@"Random Number 4 = %ld",randomNextLongNumber_4);
	
	NSLog(@"END TEST 1.2");
	
	/**
	* 1.3 - CONTAINS TESTS FOR THE SCENARIO: nextBoolean Method
	*/
	NSLog(@"START TEST 1.3");
	
	BOOL randomBoolean_1 = [newRandomNumber nextBoolean];
	BOOL randomBoolean_2 = [newRandomNumber nextBoolean];
	BOOL randomBoolean_3 = [newRandomNumberWithSeed nextBoolean];
    BOOL randomBoolean_4 = [newRandomNumberWithSeed nextBoolean];
	
	NSLog(@"Random Boolean 1 = %d",randomBoolean_1);
	NSLog(@"Random Boolean 2 = %d",randomBoolean_2);
	NSLog(@"Random Boolean 3 = %d",randomBoolean_3);
	NSLog(@"Random Boolean 4 = %d",randomBoolean_4);
	
	NSLog(@"END TEST 1.3");  
	
	/**
	* 1.4 - CONTAINS TESTS FOR THE SCENARIO: nextFloat
	*/
	NSLog(@"START TEST 1.4");
	
	float randomNextFloatNumber_1 = [newRandomNumber nextFloat];
	float randomNextFloatNumber_2 = [newRandomNumber nextFloat];
	float randomNextFloatNumber_3 = [newRandomNumberWithSeed nextFloat];
    float randomNextFloatNumber_4 = [newRandomNumberWithSeed nextFloat];
	
	NSLog(@"Random Number 1 = %f",randomNextFloatNumber_1);
	NSLog(@"Random Number 2 = %f",randomNextFloatNumber_2);
	NSLog(@"Random Number 3 = %f",randomNextFloatNumber_3);
	NSLog(@"Random Number 4 = %f",randomNextFloatNumber_4);
	
	NSLog(@"END TEST 1.4");  
	
	/**
	* 1.5 - CONTAINS TESTS FOR THE SCENARIO: nextDouble
	*/
	NSLog(@"START TEST 1.5");
	
	double randomNextDoubleNumber_1 = [newRandomNumber nextDouble];
	double randomNextDoubleNumber_2 = [newRandomNumber nextDouble];
	double randomNextDoubleNumber_3 = [newRandomNumberWithSeed nextDouble];
    double randomNextDoubleNumber_4 = [newRandomNumberWithSeed nextDouble];

	NSLog(@"Random Number 1 = %f",randomNextDoubleNumber_1);
	NSLog(@"Random Number 2 = %f",randomNextDoubleNumber_2);
	NSLog(@"Random Number 3 = %f",randomNextDoubleNumber_3);
	NSLog(@"Random Number 4 = %f",randomNextDoubleNumber_4);
	
	NSLog(@"END TEST 1.5");  
	
	/**
	* 1.6 - CONTAINS TESTS FOR THE SCENARIO: nextGaussian
	*/
	NSLog(@"START TEST 1.6");
	
	double randomNextGaussianNumber_1 = [newRandomNumber nextGaussian];
	double randomNextGaussianNumber_2 = [newRandomNumber nextGaussian];
	double randomNextGaussianNumber_3 = [newRandomNumberWithSeed nextGaussian];
    double randomNextGaussianNumber_4 = [newRandomNumberWithSeed nextGaussian];
	
	NSLog(@"Random Number 1 = %f",randomNextGaussianNumber_1);
	NSLog(@"Random Number 2 = %f",randomNextGaussianNumber_2);
	NSLog(@"Random Number 3 = %f",randomNextGaussianNumber_3);
	NSLog(@"Random Number 4 = %f",randomNextGaussianNumber_4);
	
	NSLog(@"END TEST 1.6");  
	
	/********** TEST DONE **********/
	NSLog(@"Test Done!");
	[pool drain];
    return 0;
}

