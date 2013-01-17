//
//  NoblePerson.h
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

// Butler and assets not implemented yet
@property NSNumber *assets;
@property Citizen *butler;

- (void)marry:(Citizen *)spouse;
- (void)divorce:(Citizen *)spouse;
- (BOOL)isNoblePerson:(Citizen *)person;

@end
