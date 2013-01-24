//
//  IteratorTester.m
//  Ass4Enumerations
//
//  Created by Andreas Graulund on 23/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "IteratorTester.h"

@interface IteratorTester ()

@property NSNumber *currentNum;

@end

@implementation IteratorTester

@synthesize set        = _set;
@synthesize currentNum = _currentNum;

-(id) initWithIterationsCount:(unsigned int)iterations {
	
	self = [super init];
	
    if(self) {
		
		// Let's construct the set we'll iterate over.
		
		NSMutableSet *constructor = [NSMutableSet setWithCapacity:iterations];
		
		for (unsigned int i = 0; i < iterations; i++) {
			[constructor addObject:[NSNumber numberWithInt:i]];
		}
		
		// Ready to go!
		
		self.set = [constructor copy];
		
    }
	
	return self;
}

-(void) oldStyleIteration {
	NSArray *a = [_set allObjects];
	for (unsigned int i = 0; i < [_set count]; i++) {
		_currentNum = [a objectAtIndex:i];
	}
}

-(void) oldStyleEnumeration {
	NSEnumerator *enumerator = [_set objectEnumerator];
	NSNumber *num;
	
	while ((num = [enumerator nextObject]) != nil) {
		_currentNum = num;
	}
}

-(void) fastEnumeration {
	for (NSNumber *num in _set) {
		_currentNum = num;
	}
}

@end
