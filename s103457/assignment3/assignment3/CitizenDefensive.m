//
//  CitizenDefensive.m
//  assignment3
//
//  Created by Anders Emil Nielsen on 20/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "CitizenDefensive.h"

@implementation CitizenDefensive

-(void)marry:(Citizen *)sweetheart
{
    if (sweetheart == nil || ![self canMarry:sweetheart]) {
        [NSException raise:@"Invalid marriage"
                    format:@"%@ can't marry %@", self, sweetheart];
    }
    [super marry:sweetheart];
}

-(void)setMother:(Citizen *)mother andFather:(Citizen *)father
{
    if (self.parents || mother.sex != female || father.sex != male) {
        [NSException raise:@"Invalid making of child"
                    format:@"%@ and %@ can't be parents to %@", mother, father, self];
    }
    [super setMother:mother andFather:father];
}

-(void)divorse
{
    if (self.single) {
        [NSException raise:@"Invalid divorse"
                    format:@"%@ is single", self];
    }
    [super divorse];
}

@end
