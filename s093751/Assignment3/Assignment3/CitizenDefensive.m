//
//  CitizenDefensive.m
//  Assignment3
//
//  Created by Carsten Nilsson on 17/02/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import "CitizenDefensive.h"

// Defendsive programming is using exceptions for illegal arguments in methods invokements.

@implementation CitizenDefensive

// commands
- (void)marryWith:(Citizen *) aCitizen {
    if (aCitizen == nil)
        @throw  [NSException exceptionWithName:@"Illegal argument" reason:@"Target citizen is nil" userInfo:nil];
    if (![self impedimentToMarriage:aCitizen])
        @throw [NSException exceptionWithName:@"Illegal argument" reason:@"Target citizen already married or another impediment." userInfo:nil];

    if (aCitizen && [self impedimentToMarriage:aCitizen]){
        self.spouse = aCitizen;
        self.spouse.spouse = self;
        NSLog(@"%@ married to %@.",self.name, aCitizen.name);
    } else {
        NSLog(@"%@ could not be married to %@.",self.name, aCitizen.name);
    }
}

- (void) divorce {
    if (self.single == NO)
        @throw [NSException exceptionWithName:@"Illegal argument" reason:@"The citizen is already single." userInfo:nil];
    
    if (self.single == NO){
        NSLog(@"%@ got divorced to %@.",self.name, self.spouse.name);
        self.spouse.spouse = nil;
        self.spouse = nil;
    } else {
        NSLog(@"%@ is single.",self.name);
    }
}

@end
