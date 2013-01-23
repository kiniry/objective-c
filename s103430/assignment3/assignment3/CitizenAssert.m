//
//  CitizenAssert.m
//  assignment3
//
//  Created by Joachim on 22/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "CitizenAssert.h"

@implementation CitizenAssert

-(void)marry:(Citizen*)citizen {
    NSAssert([super canMarry:citizen], @"Marriage invalid");
    [super marry:citizen];
    NSAssert(self.spouse.spouse == self, @"Spouses are incorrect");
    NSAssert(!self.single && !citizen.single, @"Couple is still singles");
}

-(void)divorce {
    NSAssert(!self.single, @"Citizen is single");
    [super divorce];
    NSAssert(self.single && self.spouse == nil, @"Citizen was not divorced");
}

-(void)addChild:(Citizen *)child {
    NSAssert(child.mother != self && child.father != self, @"Child already added");
    NSAssert(child != self && child != self.spouse, @"Child cannot be self or spouse");
    NSAssert(![child.children containsObject:self], @"Child cannot selfs parent");
    [super addChild:child];
    NSAssert([self.children containsObject:child], @"Child not added");
    NSAssert(child.mother == self || child.father == self, @"Parent not set");
}

@end
