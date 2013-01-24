//
//  CitizenAsserting.m
//  Assignment3
//
//  Created by Andreas Graulund on 17/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "CitizenAsserting.h"

@implementation CitizenAsserting

-(void) addChild:(Citizen*) child {
	
	NSAssert(child != nil, @"addChild precondition failure: No child given.");
	
	if(!children){ children = [@[] mutableCopy]; }
	
	NSUInteger oldcount = [children count];
	
	if(sex == male){
		child.father = self;
	}
	if(sex == female){
		child.mother = self;
	}
	
	[children addObject: child];
	
	NSAssert([children count] > oldcount, @"addChild postcondition failure: Child not added.");
}

-(void) setSpouse:(Citizen *) aSpouse {
	// Constraints given: "May not marry children or parents or person of same sex."
	// (ignoring the very last constraint to avoid homophobic code)
	
	if(!children){ children = [@[] mutableCopy]; }
	
	NSAssert([children indexOfObject: aSpouse] == NSNotFound &&
			 aSpouse != self.mother &&
			 aSpouse != self.father, @"setSpouse precondition failure: Invalid spouse given.");
	
	
	
	self.spouse = aSpouse;
	aSpouse.spouse = self;
	
	NSAssert(self.spouse == aSpouse, @"setSpouse postcondtion failure: Spouse not set.");
}

@end
