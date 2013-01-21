//
//  CitizenAssertion.m
//  assignment3
//
//  Created by Anders Emil Nielsen on 20/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "CitizenAssertion.h"

@implementation CitizenAssertion

-(void)marry:(Citizen *)sweetheart
{
    NSAssert([super canMarry:sweetheart], @"marry: precondition failure");
    [super marry:sweetheart];
    NSAssert((self.spouse == sweetheart && sweetheart.spouse == self), @"marry: postcondition failure");
}

-(void)setMother:(Citizen *)mother andFather:(Citizen *)father
{
    NSAssert(!(self.parents || mother.sex != female || father.sex != male), @"setMother:andFather: precondition failed");
    [super setMother:mother andFather:father];
    NSAssert([father.children containsObject:self] &&
             [mother.children containsObject:self] &&
             self.parents.count == 2,
             @"setMother:andFather: postcondition failed"
    );
}

-(void)divorse
{
    NSAssert(!self.single, @"divorse precondition failed");
    Citizen *spouse = self.spouse;
    [super divorse];
    NSAssert(self.single && spouse.single, @"divorse postcondition failed");
}


@end
