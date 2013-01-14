//
//  Citizen.m
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize single = _single;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;

- (void) marry:(Citizen *)bride
{
    if (!self.spouse &&
        bride.sex != self.sex &&
        ![self.children containsObject:bride] &&
        ![self.parents containsObject:bride])
    {
        self.spouse = bride;
    }
}

- (void) divorce:(Citizen *)spouse
{
    if (self.spouse)
    {
        self.spouse = nil;
    }
}

@end
