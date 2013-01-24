//
//  main.m
//  Ass4Blocks
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
		
		unsigned int iterations;
		
		// IN THIS FILE, I will time a whole bunch of things. So let's get the timer ready.
		
		NSDate *date;
		double timePassed_ms;
		
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
		
		// MAIN PART 1: CALLS ============================================================================
		
		NSLog(@"Starting part 1 (Simply running the calls).");
		date = [NSDate date];
		
		for (int i = 0; i < iterations; i++) {
			printf("");
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 1! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 2: METHOD CALLS =====================================================================
		
		NSLog(@"Starting part 2 (Doing above calls in a method).");
		date = [NSDate date];
		
		for (int i = 0; i < iterations; i++) {
			[Foo bar];
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 2! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 3: SIMPLE BLOCK =====================================================================
		
		NSLog(@"Starting part 3 (Doing above calls in a simple block).");
		date = [NSDate date];
		
		void (^block1)() = ^{
			printf("");
		};
		
		for (int i = 0; i < iterations; i++) {
			block1();
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 3! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 4: BLOCK ACCESSING PRIMITIVE VARIABLE ===============================================
		
		NSLog(@"Starting part 4 (Block accessing primitive variable).");
		date = [NSDate date];
		
		int val = 2;
		
		void (^block2)() = ^{
			int v = val;
			printf("");
		};
		
		for (int i = 0; i < iterations; i++) {
			block2();
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 4! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 5: BLOCK ACCESSING OUTSIDE OBJECT ===================================================
		
		NSLog(@"Starting part 5 (Block accessing outside object).");
		date = [NSDate date];
		
		NSArray *a = @[@1, @2, @3];
		
		void (^block3)() = ^{
			NSArray *b = a;
			printf("");
		};
		
		for (int i = 0; i < iterations; i++) {
			block3();
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 5! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 6: BLOCK WITH ARGUMENTS =============================================================
		
		NSLog(@"Starting part 6 (Block with arguments).");
		date = [NSDate date];
		
		void (^block4)(int) = ^(int n){
			int a = n;
			printf("");
		};
		
		for (int i = 0; i < iterations; i++) {
			block4(2);
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 6! Time passed: %0.2f ms.", timePassed_ms);
	    
		// Done! -----------------------------------------------------------------------------------------
		
		// MAIN PART 7: BLOCK WITH INNER VARIABLES =======================================================
		
		NSLog(@"Starting part 7 (Block with inner variables).");
		date = [NSDate date];
		
		void (^block5)() = ^{
			int a = 3;
			int b = 4;
			NSArray *c = @[ @1, @2, @3 ];
			printf("");
		};
		
		for (int i = 0; i < iterations; i++) {
			block5();
		}
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 7! Time passed: %0.2f ms.", timePassed_ms);
	    
		// Done! -----------------------------------------------------------------------------------------
	}
    return 0;
}

