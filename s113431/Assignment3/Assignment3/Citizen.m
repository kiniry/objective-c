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

- (BOOL) can_marry:(Citizen *)other {
    NSAssert(other.isSingle && self.sex != other.sex && self.father != other && self.mother != other, @"can_marry precondition failed");
    return YES;
}

- (void) divorce {  
    self.spouse = nil;
}

- (void) marry:(Citizen *)sweetheart {
    NSAssert(sweetheart.isSingle, @"marry precondition failed");
    sweetheart.spouse = self;
    self.spouse = sweetheart;   // I don't know
}


@end
