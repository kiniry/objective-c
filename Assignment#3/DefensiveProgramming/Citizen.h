//
//  Citizen.h
//  Assignment#3
//
//  Created by Jacob Espersen on 18/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoggingCitizen.h"

@interface Citizen : NSObject


@property (copy) NSString* name;    //Name of the citizen
@property Sex sex;                  //Sex of the citizen
@property NSNumber* age;            //Age of the citizen
@property (nonatomic, readonly) BOOL single;        //Wether og not the citizen is available
@property (nonatomic, readonly) BOOL bastardChild;  //Wether or not the citizens parents where married
@property Citizen* spouse;          //pointer to the spouse of the citizen
@property Citizen* mother;          //pointer to the mother of the citizen
@property Citizen* father;          //pointer to the father of the citizen
@property NSMutableArray* children; //pointer to a array of the citizens children

- (Citizen*)initWithFirstName:(NSString*)fName sex:(Sex)sex age:(NSNumber*)age;     //Initializes the Citizen
- (Citizen*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age andMother:(Citizen*)aMother;
- (Citizen*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age mother:(Citizen*)mother andFather:(Citizen*)father;    //Initializes Citizen with mother and father
- (void)marry:(Citizen*)spouse;     //Marries the Citizen with a spouse
- (BOOL)impedimentToMarriage:(Citizen*)citizen;  //checks if the citizen is able to get married
- (Citizen*)haveChildWithName:(NSString*)name sex:(Sex)sex;     //Creating a new child
- (Citizen*)haveBastardChildWithName:(NSString*)aName andSex:(Sex)aSex;


@end
