//
//  NoblePerson.h
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/13/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen

@property NSValue* assets;
@property Citizen* butler;
@property (nonatomic) NoblePerson* spouse;
@property (nonatomic) NoblePerson* marry;
@property (nonatomic) Citizen* mother;
@property (nonatomic) Citizen* father;
- (void) setMarry:(NoblePerson *)marry;
- (void) setSpouse:(NoblePerson*) spouse;
- (void) setMother:(Citizen *)mother;


@end
