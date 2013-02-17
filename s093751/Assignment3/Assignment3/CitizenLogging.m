//
//  CitizenLogging.m
//  Assignment3
//
//  Created by Carsten Nilsson on 17/02/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import "CitizenLogging.h"

@implementation CitizenLogging

// commands
- (void)marryWith:(Citizen *) aCitizen {
    
    if (_debugging && aCitizen == nil)
        NSLog(@"Target citizen is nil.");
    if (_debugging && ![self impedimentToMarriage:aCitizen])
        NSLog(@"Target citizen already married or another impediment.");
    
    if (aCitizen && [self impedimentToMarriage:aCitizen]){
        self.spouse = aCitizen;
        self.spouse.spouse = self;
        NSLog(@"%@ married to %@.",self.name, aCitizen.name);
    } else {
        NSLog(@"%@ could not be married to %@.",self.name, aCitizen.name);
    }
}

- (void) divorce {
    if (_debugging && !(self.single == NO)) {
        NSLog(@"The citizen is single and can therefore not be divorced.");
    }
    if (self.single == NO){
        NSLog(@"%@ got divorced to %@.",self.name, self.spouse.name);
        self.spouse.spouse = nil;
        self.spouse = nil;
    } else {
        NSLog(@"%@ is single.",self.name);
    }
}

@end
