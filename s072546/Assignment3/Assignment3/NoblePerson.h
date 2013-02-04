//
//  NoblePerson.h
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

@property (retain) Citizen *butler;
@property (retain) NSNumber *assets;

-(bool)marry:(NoblePerson*) fiance;

@end
