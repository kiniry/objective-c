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

- (id) initWithName:(NSString *)name Age:(int) age Sex:(gender) sex Children: (NSSet *) children;

// Queries
- (NSString *) getName;
- (int) getAge;
- (BOOL) isSingle;
- (Citizen *) getSpouse;
- (gender) getGender;


// Commands
- (BOOL) marry: (Citizen *) person;
- (BOOL) divorce;


// Description
- (NSString *) description;

@end
