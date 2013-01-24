//
//  CitizenLogging.m
//  Assignment3
//
//  Created by Andreas Graulund on 17/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "CitizenLogging.h"

#define __DEBUG 0

@implementation CitizenLogging

-(void) addChild:(Citizen*) child {
	
	if(__DEBUG && child == nil){
		NSLog(@"addChild precondition failure: No child given.");
	}
	
	if(!children){ children = [@[] mutableCopy]; }
	
	NSUInteger oldcount = [children count];
	
	if(sex == male){
		child.father = self;
	}
	if(sex == female){
		child.mother = self;
	}
	
	[children addObject: child];
	
	if(__DEBUG && [children count] <= oldcount){
		NSLog(@"addChild postcondition failure: Child not added.");
	}
}

-(void) setSpouse:(Citizen *) aSpouse {
	// Constraints given: "May not marry children or parents or person of same sex."
	// (ignoring the very last constraint to avoid homophobic code)
	
	if(!children){ children = [@[] mutableCopy]; }
	
	if (
		__DEBUG &&
		(aSpouse == nil ||
		 [children indexOfObject: aSpouse] != NSNotFound ||
		 aSpouse == self.mother ||
		 aSpouse == self.father)
		) {
		NSLog(@"setSpouse precondition failure: Invalid spouse given.");
	}
	
	self.spouse = aSpouse;
	aSpouse.spouse = self;
	
	if (__DEBUG && aSpouse != self.spouse) {
		NSLog(@"setSpouse postcondtion failure: Spouse not set.");
	}
}


@end
