//
//  Citizen.h
//  Assignment2_1
//
//  Created by Carsten Nilsson on 16/01/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
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
-(id)initWithName:(NSString *)aName Sex:(NSString *)aSex Age:(int) anAge;

// commands
-(void) marryWith:(Citizen *) aCitizen;
-(void) divorce;

@end