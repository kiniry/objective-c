//
//  CitizenAsserting.m
//  Assignment3
//
//  Created by David Harboe on 1/24/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import "CitizenAsserting.h"

@implementation CitizenAsserting

-(void)marry:(Citizen *)spouse
{
    NSAssert((self.canMarry), @"marry assert fail: is not in a relationship, only if you first are in a relationship then you are allow to get married in this program, sorry");
    [super marry:spouse];
    NSAssert((self.spouse == spouse && spouse.spouse == self), @"marry post assert fail: you are marrying the wrong");
}

-(void)divorce
{
    NSAssert(self.isSingle, @"divorce assert fail: %@ is single therefore nobody to divorce", self);
    Citizen *spouse = self.spouse;
    [super divorce];
    NSAssert(!self.isSingle && !spouse.isSingle, @"divorce assert fail: both should be single after divorce");
}

@end
