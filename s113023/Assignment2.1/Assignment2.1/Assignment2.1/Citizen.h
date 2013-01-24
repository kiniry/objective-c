//
//  Citizen.h
//  Assignment2
//
//  Created by Andreas Haure on 10/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

@property(readonly, atomic,strong) NSString *name;

//Initialize object
- (Citizen *)initWithName:(NSString *)name
           withSex:(NSString *)sex
           withAge:(NSNumber *)age;

//Setters for object
- (void)addChild:(Citizen *)Achild;

//Commands for a citizen object (changes state of object)
- (void)marry:(Citizen *)Aperson;
- (void)divorce:(Citizen *)Aperson;

//Queries for a citizen object (returns value of object)
- (BOOL)canMarry:(Citizen *)Aperson;
- (NSString *)generateChildrenString;
- (NSString *)description;
@end
