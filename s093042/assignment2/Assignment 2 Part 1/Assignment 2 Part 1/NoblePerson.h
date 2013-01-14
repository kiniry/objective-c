//
//  NoblePerson.h
//  Assignment 2 Part 1
//
//  Created by Sivanujann Selliah on 14/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Citizen.h"

@interface NoblePerson : Citizen

@property int assets;
@property Citizen* butler;

-(BOOL) impedimentToMarriage:(Citizen *)aCitizen;

-(void) marry:(Citizen *)aCitizen;

@end
