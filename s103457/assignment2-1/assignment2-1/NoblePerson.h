//
//  NobelPerson.h
//  assignment2
//
//  Created by Anders Emil Nielsen on 11/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen

@property NSNumber *assets;
@property Citizen *butler;

@end
