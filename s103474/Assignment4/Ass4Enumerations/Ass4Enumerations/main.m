//
//  main.m
//  Ass4Enumerations
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IteratorTester.h"

#define COMMAND_LINE 0
#define PRESET_ITERATIONS 1000000

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    // Iterations ------------------------------------------------------------------------------------
		
		unsigned int iterations;
		
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
		// Let's go!
		
		IteratorTester *tester = [[IteratorTester alloc] initWithIterationsCount:iterations];
		
		// MAIN PART 1: OLD-STYLE ITERATION ==============================================================
		
		NSLog(@"Starting part 1 (old-style iteration).");
		NSDate *date = [NSDate date];
		
		[tester oldStyleIteration];
		
		double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 1! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 2: OLD-STYLE ENUMERATION ============================================================
		
		NSLog(@"Starting part 2 (old-style enumeration).");
		date = [NSDate date];
		
		[tester oldStyleEnumeration];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 2! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 3: FAST ENUMERATION =================================================================
		
		NSLog(@"Starting part 3 (fast enumeration).");
		date = [NSDate date];
		
		[tester fastEnumeration];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 3! Time passed: %0.2f ms.", timePassed_ms);
		
		// Done! -----------------------------------------------------------------------------------------
	    
	    
	}
    return 0;
}

