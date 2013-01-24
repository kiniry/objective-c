//
//  main.m
//  Ass4Protocols
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo1.h"
#import "Foo2.h"
#import "Foo3.h"
#import "Foo4.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
		// All the classes will be imported and all methods called. This will be timed.
		
	    // MAIN PART 1: NO PROTOCOLS ==============================================================
		
		NSLog(@"Starting part 1 (no protocols).");
		NSDate *date = [NSDate date];
		
		Foo1 *foo1 = [[Foo1 alloc] init];
		
		[foo1 bar];
		
		double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 1! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 2: ONE PROTOCOL ==============================================================
		
		NSLog(@"Starting part 2 (one protocol).");
		date = [NSDate date];
		
		Foo2 *foo2 = [[Foo2 alloc] init];
		
		[foo2 bar];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 2! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 3: LONG PROTOCOL =============================================================
		
		NSLog(@"Starting part 3 (one long protocol).");
		date = [NSDate date];
		
		Foo3 *foo3 = [[Foo3 alloc] init];
		
		[foo3 alfa];
		[foo3 bravo];
		[foo3 charlie];
		[foo3 delta];
		[foo3 echo];
		[foo3 foxtrot];
		[foo3 golf];
		[foo3 hotel];
		[foo3 india];
		[foo3 juliet];
		[foo3 kilo];
		[foo3 lima];
		[foo3 mike];
		[foo3 november];
		[foo3 oscar];
		[foo3 papa];
		[foo3 quebec];
		[foo3 romeo];
		[foo3 sierra];
		[foo3 tango];
		[foo3 uniform];
		[foo3 victor];
		[foo3 whiskey];
		[foo3 xray];
		[foo3 yankee];
		[foo3 zulu];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 3! Time passed: %0.2f ms.", timePassed_ms);
		
		// MAIN PART 4: 26 PROTOCOLS ==============================================================
		
		NSLog(@"Starting part 4 (26 protocols).");
		date = [NSDate date];
		
		Foo4 *foo4 = [[Foo4 alloc] init];
		
		[foo4 alfa];
		[foo4 bravo];
		[foo4 charlie];
		[foo4 delta];
		[foo4 echo];
		[foo4 foxtrot];
		[foo4 golf];
		[foo4 hotel];
		[foo4 india];
		[foo4 juliet];
		[foo4 kilo];
		[foo4 lima];
		[foo4 mike];
		[foo4 november];
		[foo4 oscar];
		[foo4 papa];
		[foo4 quebec];
		[foo4 romeo];
		[foo4 sierra];
		[foo4 tango];
		[foo4 uniform];
		[foo4 victor];
		[foo4 whiskey];
		[foo4 xray];
		[foo4 yankee];
		[foo4 zulu];
		
		timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
		NSLog(@"Done with part 4! Time passed: %0.2f ms.", timePassed_ms);
	    
	}
    return 0;
}

