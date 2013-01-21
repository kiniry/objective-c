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
@property (readonly) BOOL single;
@property Citizen *spouse;
@property NSSet *children;
@property NSSet *parents;
-(BOOL) impedimentToMarriage:(Citizen *)aCitizen;

// init
-(id)initWithName:(NSString *)aGivenName Sex:(NSString *)aSex Age:(int) anAge;

// commands
-(void)marry:(Citizen *)sweetheart;
-(void)divorce;

@end
