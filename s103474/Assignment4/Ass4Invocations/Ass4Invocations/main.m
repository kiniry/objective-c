//
//  main.m
//  Ass4Invocations
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"

#define COMMAND_LINE 0
#define PRESET_ITERATIONS 1000000

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		
		// Variables -------------------------------------------------------------------------------------

		Foo *foo = [[Foo alloc] init]; // the foo object on which we test
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
		
		// MAIN PART 1: CALL OBJECT METHOD ===============================================================
		
		NSLog(@"Starting part 1 (object method calls).");
		NSDate *date = [NSDate date];
		
		for (unsigned int i = 0; i < iterations; i++) {
			[foo method];
		}
		
		double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 1! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 2: CALL OBJECT METHOD SELECTOR ======================================================
		
		NSLog(@"Starting part 2 (object method selector calls).");
		date = [NSDate date];
		
		for (unsigned int i = 0; i < iterations; i++) {
			[foo performSelector:@selector(method)];
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 2! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 3: CALL CLASS METHOD ================================================================
		
		NSLog(@"Starting part 3 (class method calls).");
		date = [NSDate date];
		
		for (unsigned int i = 0; i < iterations; i++) {
			[Foo bar];
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 3! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 4: CALL CLASS METHOD SELECTOR =======================================================
		
		NSLog(@"Starting part 4 (class method selector calls).");
		date = [NSDate date];
		
		for (unsigned int i = 0; i < iterations; i++) {
			[[Foo class] performSelector:@selector(bar)];
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 4! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 5: INTROSPECTION OBJECT METHOD CALL =================================================
		
		NSLog(@"Starting part 5 (introspection object method calls).");
		date = [NSDate date];
		
		for (unsigned int i = 0; i < iterations; i++) {
			if ([foo isKindOfClass:[Foo class]]) {
				if ([foo respondsToSelector:@selector(method)]) {
					[foo method];
				}
			}
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 5! Time passed: %0.2f ms.", timePassed_ms);
		
		// Done! -----------------------------------------------------------------------------------------
	    
	}
    return EXIT_SUCCESS;
}

