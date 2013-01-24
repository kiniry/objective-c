//
//  Citizen.h
//  assignment2
//
//  Created by Joseph Kiniry on 11/1/2013.
//  Copyright (c) 2013 Joseph Kiniry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CivilStatus.h"

// Person born or living in a country.

@interface Citizen : NSObject

@property NSString *name;
@property Sex sex;
@property ushort age;
@property (readonly) BOOL single;
@property Citizen *spouse;
@property NSSet *children;
@property NSSet *parents;

- (Citizen*)init:(NSString *)a_name
             sex:(Sex)a_sex
             age:(ushort)an_age;

// Impediment to marriage?
- (BOOL)canMarry:(Citizen*)fiance;
- (void)marry:(Citizen*)spouse;
- (void)divorce;

// Each citizen has two parents.

// At most one spouse allowed.
// @design enforced by architecture

// May not marry children or parents or person of same sex.

// Spouse's spouse must be this person.

// All children, if any, must have this person among their parents.
- (BOOL)invariant;

@end
