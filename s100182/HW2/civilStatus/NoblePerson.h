//
//  NoblePerson.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 15/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//
/*
 NoblePerson inherits from Citizen.
 NoblePerson adds to Citizen: 
    Assets
    Butler
 NobelPerson is constrained by:
    Enough property for independence.
    Can only marry other noble person.
    Wedding celebrated with style.
    Married nobility share their assets and must have a butler. 
 */

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen 

@property NSNumber *assets;     //int representing money
@property Citizen *butler;      

+ (void)shareAssetsBetweenSpouseOne:(NoblePerson *)p1
                         andSpouseTwo:(NoblePerson *)p2;

- (NSNumber *)displayNoblePersonsMoney:(id)person;
@end
