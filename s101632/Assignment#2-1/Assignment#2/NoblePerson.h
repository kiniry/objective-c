//
//  NobelPerson.h
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen

@property NSNumber* assets;
@property Citizen* butler;

- (void)shareAssetsWith:(NoblePerson*)spouse;
- (void)marry:(NoblePerson *)spouse andAssignButler:(Citizen*)butler;


@end
