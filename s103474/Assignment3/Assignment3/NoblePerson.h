//
//  NoblePerson.h
//  Assignment3 (taken from Assignment 2-1)
//
//  Created by Andreas Graulund on 17/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

// ASSETS: Assuming this means $$ in the bank, therefore numerics
@property NSNumber *assets;

// BUTLER: Another citizen working for the noble person
@property Citizen *butler;

// Overriding SPOUSE: A noble person can only marry another noble person
@property (nonatomic) NoblePerson *spouse;

@end
