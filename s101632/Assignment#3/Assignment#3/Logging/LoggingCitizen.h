//
//  LoggingCitizen.h
//  Assignment#3
//
//  Created by Jacob Espersen on 20/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoggingCitizen : NSObject

typedef enum{
    male,
    female,
} Sex;

@property (copy) NSString* name;    //Name of the citizen
@property Sex sex;                  //Sex of the citizen
@property NSNumber* age;            //Age of the citizen
@property (nonatomic, readonly) BOOL single;        //Wether og not the citizen is available
@property (nonatomic, readonly) BOOL bastardChild;  //Wether or not the citizens parents where married
@property LoggingCitizen* spouse;          //pointer to the spouse of the citizen
@property LoggingCitizen* mother;          //pointer to the mother of the citizen
@property LoggingCitizen* father;          //pointer to the father of the citizen
@property NSMutableArray* children; //pointer to a array of the citizens children

- (LoggingCitizen*)initWithFirstName:(NSString*)fName sex:(Sex)sex age:(NSNumber*)age;     //Initializes the Citizen
- (LoggingCitizen*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age andMother:(LoggingCitizen*)aMother;
- (LoggingCitizen*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age mother:(LoggingCitizen*)mother andFather:(LoggingCitizen*)father;    //Initializes Citizen with mother and father
- (void)marry:(LoggingCitizen*)spouse;     //Marries the Citizen with a spouse
- (BOOL)impedimentToMarriage:(LoggingCitizen*)citizen;  //checks if the citizen is able to get married
- (LoggingCitizen*)haveChildWithName:(NSString*)name sex:(Sex)sex;     //Creating a new child
- (LoggingCitizen*)haveBastardChildWithName:(NSString*)aName andSex:(Sex)aSex;

@end
