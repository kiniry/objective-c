//
//  CitizenAssertion.h
//  Assignment#3
//
//  Created by Jacob Espersen on 21/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoggingCitizen.h"

@interface CitizenAssertion : NSObject



@property (copy) NSString* name;    //Name of the citizen
@property Sex sex;                  //Sex of the citizen
@property NSNumber* age;            //Age of the citizen
@property (nonatomic, readonly) BOOL single;        //Wether og not the citizen is available
@property (nonatomic, readonly) BOOL bastardChild;  //Wether or not the citizens parents where married
@property CitizenAssertion* spouse;          //pointer to the spouse of the citizen
@property CitizenAssertion* mother;          //pointer to the mother of the citizen
@property CitizenAssertion* father;          //pointer to the father of the citizen
@property NSMutableArray* children; //pointer to a array of the citizens children

- (CitizenAssertion*)initWithFirstName:(NSString*)fName sex:(Sex)sex age:(NSNumber*)age;     //Initializes the Citizen
- (CitizenAssertion*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age andMother:(CitizenAssertion*)aMother;
- (CitizenAssertion*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age mother:(CitizenAssertion*)mother andFather:(CitizenAssertion*)father;    //Initializes Citizen with mother and father
- (void)marry:(CitizenAssertion*)spouse;     //Marries the Citizen with a spouse
- (BOOL)impedimentToMarriage:(CitizenAssertion*)citizen;  //checks if the citizen is able to get married
- (CitizenAssertion*)haveChildWithName:(NSString*)name sex:(Sex)sex;     //Creating a new child
- (CitizenAssertion*)haveBastardChildWithName:(NSString*)aName andSex:(Sex)aSex;


@end
