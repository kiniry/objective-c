//
//  CitizenLogging.m
//  assignment3
//
//  Created by Anders Emil Nielsen on 20/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "CitizenLogging.h"

static BOOL debug = NO;

@implementation CitizenLogging

-(void)marry:(Citizen *)sweetheart
{
    if (debug && (sweetheart == nil || ![self canMarry:sweetheart])) {
        NSLog(@"marry: precondition failure: %@ cannot marry %@", self.name, sweetheart.name);
    }
    [super marry:sweetheart];
    if (debug && (self.spouse != sweetheart || sweetheart.spouse != self)) {
        NSLog(@"marry: postcondition failure: self's spouse should be %@ and sweethearts spouse should be %@",
              sweetheart, self);
    }
    
}

-(void)setMother:(Citizen *)mother andFather:(Citizen *)father
{
    if (debug && (self.parents || mother.sex != female || father.sex != male)) {
        NSLog(@"makeChild:withParent: precondition failure: %@ and %@ can't be parents to %@",
              mother, father, self);
    }
    [super setMother:mother andFather:father];
    if (debug && (![father.children containsObject:self] &&
                  ![mother.children containsObject:self] &&
                  !self.parents.count == 2)
    ) {
        NSLog(@"makeChild:withParent: precondition failure: %@ and %@ should be parents for %@",
              mother, father, self);
    }
}

-(void)divorse
{
    if (debug && (self.single)) {
        NSLog(@"divorse precondition failure: %@ is single and can't be divorsed", self);
    }
    Citizen *spouse = self.spouse;
    [super divorse];
    if (debug && !(self.single && spouse.single)) {
        NSLog(@"divorse postcondition failure: %@ and %@ should be single after divorse", self, spouse);
    }
}

@end
