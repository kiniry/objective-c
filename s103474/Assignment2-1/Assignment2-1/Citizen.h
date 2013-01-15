//
//  Citizen.h
//  Assignment2-1
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

// This object based on the BOM model given.

#import "Country.h"

typedef enum { undefined, male, female } Sex;

@interface Citizen : NSObject

@property (copy) NSString* firstName;
@property (copy) NSString* lastName;

@property (copy) NSNumber* socialSecurity;

@property Country* country;
@property (copy) NSDate* birthDate;
@property Sex sex;

@property Citizen *mother;
@property Citizen *father;
@property (nonatomic) Citizen *spouse; // nonatomic because I'm manually overriding only setter

@property NSMutableArray *children;

-(Citizen*) initWithFirstName: (NSString*) n1
				  andLastName: (NSString*) n2;

-(NSString*) fullName;
-(NSString*) sexString;
-(NSString*) description;
-(NSInteger) age;

-(BOOL) isSingle;

-(NSMutableArray *) getChildren; // Overriding getter for lazy initialisation
-(void) addChild:(Citizen*) child;

-(void) setSpouse:(Citizen *) aSpouse; // Overriding setter to apply constraints

-(void) marry:(Citizen *) aSpouse;
-(void) divorce;

@end
