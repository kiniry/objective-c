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

@property NSValue *assets;
@property Citizen *butler;
@property (nonatomic) NoblePerson *marry;

//- (void) setMarry:(NoblePerson *)sweetheart;
- (void) setSpouse:(NoblePerson *)spouse;


@end
