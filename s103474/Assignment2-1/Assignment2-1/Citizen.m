//
//  Citizen.m
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize firstName, lastName, socialSecurity, country, birthDate, sex, mother, father, spouse;

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


/*@property (copy) NSNumber* socialSecurity;
 
 @property Country* country;
 @property (copy) NSDate* birthDate;
 @property Sex sex;
 
 @property Citizen *mother;
 @property Citizen *father;
 @property Citizen *spouse;*/
@end
