//
//  main.m
//  Ass4Strings
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEBUGGING 0
#define COMMAND_LINE 0
#define PRESET_ITERATIONS 10000000

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		// Variables -------------------------------------------------------------------------------------
		
		NSMutableString *s = [NSMutableString string]; // the string
		unsigned int iterations;
		BOOL adding = YES; // adding or removing from string
		
		int additions = 0; int removals = 0;
		
		// Preparation -----------------------------------------------------------------------------------
		
		if(COMMAND_LINE){
			if (argc < 2) {
				fprintf(stderr, "Please provide a number of iterations as command line argument.\n");
				return EXIT_FAILURE;
			}
			iterations = atoi(argv[1]);
		} else {
			iterations = PRESET_ITERATIONS;
		}
		
		// Sanity check
		if (iterations < 1) {
			fprintf(stderr, "Can't have that few/many iterations.\n");
			return EXIT_FAILURE;
		}
		
		// Prologue: Start timing ------------------------------------------------------------------------
		
		NSLog(@"Before");
		NSDate *date = [NSDate date];
		
		// MAIN PART: STRING MANIPULATIONS ===============================================================
		
		for (unsigned int i = 0; i < iterations; i++) {
			
			// Switch mode every 1000th iteration
			if (i % 1000 == 0 && i > 0) {
				adding = !adding;
			}
			
			// ADDING ONE CHARACTER a
			
			if (adding) {
				// Notifying that we're Adding, and the string length is
				if (DEBUGGING) printf("A%lu ", [s length]);
				[s appendString:@"a"];
				additions++;
			} else {
				
			// REMOVING ONE CHARACTER FROM BEGINNING OF STRING
				
				if (DEBUGGING) printf("R%lu ", [s length]);
				[s replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
				removals++;
			}
		}
		
		// Epilogue: Show measured time ------------------------------------------------------------------
		
		double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done! Time passed: %0.2f ms. Additions: %d. Removals: %d", timePassed_ms, additions, removals);
	    
	}
    return EXIT_SUCCESS;
}

