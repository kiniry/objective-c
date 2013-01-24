//
//  NoblePerson.h
//  Assignment2_1
//
//  Created by Carsten Nilsson on 16/01/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

// queries
@property int assets;
@property Citizen *butler;

-(id)initWithName:(NSString *)aName
              Sex:(NSString *)aSex
              Age:(int) anAge
           Assets:(int) assets
           Butler:(Citizen *) aButler;

@end
