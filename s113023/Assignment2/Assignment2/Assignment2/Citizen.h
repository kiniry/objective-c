//
//  Citizen.h
//  Assignment2
//
//  Created by Andreas Haure on 10/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject



//Initialize object
- (Citizen *)initWithName:(NSString *)name
           withSex:(NSString *)sex
           withAge:(NSNumber *)age;

//Setters for object
- (void)addChild:(Citizen *)Achild;
- (void)setMother:(Citizen *)Amother;
- (void)setFather:(Citizen *)Afather;

//Commands for a citizen object (changes state of object)
- (void)marryCitizen:(Citizen *)Aperson;
- (void)divorceCitizen:(Citizen *)Aperson;

//Queries for a citizen object (returns value of object)
- (NSString *)generateChildrenString;
- (NSString *)printInfo;
@end
