//
//  Citizen.h
//  Homework 2
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

@interface Citizen : Person

@property NSString* firstName;
@property NSString* lastName;

@property NSNumber* socialSecurity;

@end
