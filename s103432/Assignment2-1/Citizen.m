//
//  Citizen.m
//  Assignment2-1
//
//  Created by David Harboe on 1/10/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name, sex, age, relationshipStatus;

-(Citizen *)initWithName:(NSString *)aName
{
    self = [super init];
    if (self) {
        self.name = aName;
    }
    return self;    
}

-(NSString*) sexString {
    switch (sex){
        case 0:
            return @"undefined";
        case 1:
            return @"male";
        case 2:
            return @"female";
    }
}

-(NSString*) relationshipStatusString {
	switch (relationshipStatus) {
		case 0:
			return @"undefined";
		case 1:
			return @"single";
		case 2:
			return @"inRelationship";
        case 3:
            return @"itIsComplicated";
	}
}

-(NSString*) description {
	return [NSString stringWithFormat:@" \n CITIZEN: \n Name: %@\n Sex: %@\n Age: %@\n Relationship status: %@",
			self.name,
			self.sexString,
			self.age,
			self.relationshipStatusString];
}



@end