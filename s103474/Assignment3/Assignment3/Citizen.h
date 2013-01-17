//
//  Citizen.h
//  Assignment3 (taken from Assignment 2-1)
//
//  Created by Andreas Graulund on 17/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"

typedef enum { undefined, male, female } sex;

@interface Citizen : NSObject {
	NSString* firstName;
	NSString* lastName;
	NSNumber* socialSecurity;
	Country* country;
	NSDate* birthDate;
	sex sex;
	Citizen *mother;
	Citizen *father;
	Citizen *spouse;
	NSMutableArray *children;
}

@property (copy) NSString* firstName;
@property (copy) NSString* lastName;

@property (copy) NSNumber* socialSecurity;

@property Country* country;
@property (copy) NSDate* birthDate;
@property sex sex;

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
