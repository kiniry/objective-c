//
//  Citizen.m
//  Assignment3
//
//  Created by David Harboe on 1/24/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name, sex, age, relationshipStatus;

-(Citizen *)initWithName:(NSString *)aName {
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

- (BOOL)isSingle {
    if(self.relationshipStatus == single) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)canMarry {
    if(self.relationshipStatus == inRelationship) {
        return NO;
    } else {
        return YES;
    }
}

//You have to be in a relationship to get married
- (void)marry:(Citizen *)spouse {
    if (self.relationshipStatus == inRelationship){
        self.spouse = spouse;
        spouse.spouse = self;
    }
}

- (void)divorce {
    self.spouse = nil;
}

-(NSString*) description {
	return [NSString stringWithFormat:@" \n CITIZEN: \n Name: %@\n Sex: %@\n Age: %@\n Relationship status: %@",
			self.name,
			self.sexString,
			self.age,
			self.relationshipStatusString];
}



@end