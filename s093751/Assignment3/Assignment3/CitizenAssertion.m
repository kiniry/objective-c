//
//  CitizenAssertion.m
//  Assignment3
//
//  Created by Carsten Nilsson on 17/02/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import "CitizenAssertion.h"

@implementation CitizenAssertion

// commands
- (void)marryWith:(Citizen *) aCitizen {
    
    NSAssert(aCitizen == nil, @"Target citizen is nil.");
    NSAssert(![self impedimentToMarriage:aCitizen], @"Target citizen already married or another impediment.");
    
    if (aCitizen && [self impedimentToMarriage:aCitizen]){
        self.spouse = aCitizen;
        self.spouse.spouse = self;
        NSLog(@"%@ married to %@.",self.name, aCitizen.name);
    } else {
        NSLog(@"%@ could not be married to %@.",self.name, aCitizen.name);
    }
}

- (void) divorce {
    NSAssert(self.single == NO, @"The citizen is single and can therefore not be divorced.");

    if (self.single == NO){
        NSLog(@"%@ got divorced to %@.",self.name, self.spouse.name);
        self.spouse.spouse = nil;
        self.spouse = nil;
    } else {
        NSLog(@"%@ is single.",self.name);
    }
}

@end
