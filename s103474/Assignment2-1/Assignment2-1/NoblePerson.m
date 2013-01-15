//
//  NoblePerson.m
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

-(NSString*) description {
	return [NSString stringWithFormat:@"NOBLE PERSON: %@\nSocial security number: %@\nCountry: %@\nBirth date: %@ (%ld years old)\nSex: %@\nAssets: DKK %@\nButler: \n%@",
			self.fullName,
			self.socialSecurity,
			self.country,
			self.birthDate,
			self.age,
			self.sexString,
			self.assets,
			self.butler];
}

@end
