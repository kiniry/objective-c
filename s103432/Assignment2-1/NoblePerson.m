//
//  NobelPerson.m
//  Assignment2-1
//
//  Created by David Harboe on 1/10/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

-(NSString*) description {
	return [NSString stringWithFormat:@" \n NOBLEPERSON: \n Name: %@\n Sex: %@\n Age: %@\n Relationship status: %@\n Assets: %@\n Butler: %@\n",
			self.name,
			self.sexString,
			self.age,
			self.relationshipStatusString,
            self.assets,
            self.butler];
}

@end
