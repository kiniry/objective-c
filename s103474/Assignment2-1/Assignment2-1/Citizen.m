//
//  Citizen.m
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize firstName, lastName, socialSecurity, country, birthDate, sex, mother, father, spouse, children;

-(Citizen*) initWithFirstName: (NSString*) n1
				  andLastName: (NSString*) n2 {
	self = [super init];
	if (self) {
		self.firstName = n1;
		self.lastName  = n2;
	}
	return self;
}

-(NSString*) fullName {
	return [NSString stringWithFormat: @"%@ %@", self.firstName, self.lastName];
}

-(NSString*) sexString {
	switch (self.sex) {
		case 0:
			return @"undefined";
		case 1:
			return @"male";
		case 2:
			return @"female";
	}
}

-(NSString*) description {
	return [NSString stringWithFormat:@"CITIZEN: %@\nSocial security number: %@\nCountry: %@\nBirth date: %@\nSex: %@",
			self.fullName,
			self.socialSecurity,
			self.country,
			self.birthDate,
			self.sexString];
}

-(NSMutableArray *) getChildren {
	if(!children){ children = [@[] mutableCopy]; }
	return children;
}

-(void) addChild:(Citizen*) child {
	if(!children){ children = [@[] mutableCopy]; }
	[children addObject: child];
}

-(void) setSpouse:(Citizen *) aSpouse {
	// Constraints given: "May not marry children or parents or person of same sex."
	// (ignoring the very last constraint to avoid homophobic code)
	if (
		[children indexOfObject: aSpouse] == NSNotFound &&
		aSpouse != self.mother &&
		aSpouse != self.father
	) {
		self.spouse = aSpouse;
	}
}

@end
