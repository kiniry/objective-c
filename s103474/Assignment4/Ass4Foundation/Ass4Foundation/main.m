//
//  main.m
//  Ass4Foundation
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

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
		
		NSLog(@"%u iterations.", iterations);
		
		// MAIN PART 1: NSSTRING REPEATS =================================================================
		
		NSLog(@"Starting part 1 (NSString repeat).");
		NSDate *date = [NSDate date];
		
		[[NSString string] stringByPaddingToLength:iterations withString:@"a" startingAtIndex:0];
		
		double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 1! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 2: NSARRAY COUNTS ===================================================================
		
		// Prepare the array
		
		NSMutableArray *ma = [NSMutableArray array];
		for (unsigned int i = 0; i < iterations; i++) {
			[ma addObject:[NSNumber numberWithInt:i]];
		}
		
		NSArray *a = [ma copy];
		
		// Let's go!
		
		NSLog(@"Starting part 2 (NSArray count).");
		date = [NSDate date];
		
		[a count];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 2! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 3: NSDICTIONARY FILE WRITING ========================================================
		
		// Prepare the dictionary
		
		NSMutableDictionary *md = [NSMutableDictionary dictionary];
		for (unsigned int i = 0; i < iterations; i++) {
			NSNumber *n = [NSNumber numberWithInt:i];
			[md setObject:n forKey:[n stringValue]];
		}
		
		NSDictionary *d = [md copy];
		
		// Let's go!
		
		NSLog(@"Starting part 3 (NSDictionary file writing).");
		date = [NSDate date];
		
		[d writeToFile:@"out.txt" atomically:YES];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 3! Time passed: %0.2f ms.", timePassed_ms);
		
		// Done! -----------------------------------------------------------------------------------------
	    
		
	}
    return 0;
}

