//
//  Citizen.m
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/11/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (BOOL) isSingle {
    return !self.spouse; // return the negated value of a spouse
}

- (BOOL) can_marry:(Citizen*)other {
    if ( // should not be your mother, father, self or same sex.
        [other isSingle] &&
        self.sex != other.sex &&
        self.father != other &&
        self.mother != other)
    {
        return YES;
    }
    return NO;
}

- (void) divorce {
    self.spouse = nil;
}

@end
