//
//  Citizen.h
//  Assignment 2 Part 1
//
//  Created by Sivanujann Selliah on 14/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

// queries
@property NSString *name;
@property NSString *sex;
@property int age;
@property BOOL single;
@property Citizen *spouse;
@property NSSet *children;
@property NSSet *parents;
-(BOOL) impedimentToMarriage:(Citizen *)aCitizen;

// init
-(id)initWithDefaultInfo:(NSString *)name :(NSString *)sex :(int) age;

// commands
-(void)marry:(Citizen *)aCitizen;
-(void)divorce;

@end
