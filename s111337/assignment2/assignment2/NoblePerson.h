//
//  NoblePerson.h
//  assignment2
//
//  Created by Radu Gatej on 1/13/13.
//  Copyright (c) 2013 Radu Gatej. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

@property Citizen *butler;
@property int assets;
@property (readonly) int independenceAssets;
@property (readonly) int styledWeddingCost;

-(NoblePerson*)init:(NSString *)name
             sex:(Sex)sex
             age:(unsigned int)age
             assets:(int)assets
             butler:(Citizen*)butler;
@end
