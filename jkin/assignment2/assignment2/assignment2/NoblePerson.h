//
//  NoblePerson.h
//  assignment2
//
//  Created by Joseph Kiniry on 11/1/2013.
//  Copyright (c) 2013 Joseph Kiniry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

// Person of noble rank.

@interface NoblePerson : Citizen

// @design Consider what it means for a married couple to have enough
// assets for independence.

@property long assets;
@property Citizen* butler;
@property (readonly)long enoughAssetsForIndependence;
@property (readonly)int costOfWedding;

- (NoblePerson*)init:(NSString *)a_name
                 sex:(Sex)a_sex
                 age:(ushort)an_age
              assets:(long)some_assets
              butler:(Citizen*)a_butler;

// Enough property for independence.
// @design readonly property introduced to express minimum

// Can only marry other noble person.
// @design dynamic type restriction on spouse

// Wedding celebrated with style.
// @design cost of wedding encoded by introduced readonly property

// Married nobility share their assets and must have a butler.
// @design meaning of "share" implementation-dependent (could mean
// all assets go to man, e.g.)

- (BOOL)invariant;

@end
