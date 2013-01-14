//
//  Citizen.h
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

// Gender definition
typedef enum {M, F} gender;

- (id) initWithName:(NSString *)name AndAge:(int) age AndSex:(gender) sex;

// Queries
- (NSString *) getName;
- (int) getAge;
- (BOOL) isSingle;
- (Citizen *) getSpouse;
- (gender) getGender;


// Commands
- (BOOL) marry: (Citizen *) Person;
- (BOOL) divorce;


// Description
- (NSString *) description;

@end
