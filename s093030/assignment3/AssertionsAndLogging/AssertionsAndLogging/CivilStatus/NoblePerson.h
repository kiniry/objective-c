//
//  NoblePerson.h
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

// Propertiers
@property (nonatomic) NSNumber *assets;
@property (nonatomic) Citizen *butler;

// Methods
-(NSNumber *) getAssets;
-(BOOL) marry:(NoblePerson*) nobleFiancee andHireButler: (Citizen*)butler;

@end
