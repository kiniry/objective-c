//
//  Citizen.h
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    male,
    female
} Sex;

@interface Citizen : NSObject

// Name, Sex, Spouse, Children, Parents, Age, Single

@property (strong) NSString *firstName;
@property (strong) NSString *lastName;
@property Sex sex;
@property (strong) Citizen *spouse;
@property (strong) Citizen *mother;
@property (strong) Citizen *father;
@property (strong) NSMutableSet *children;
@property (strong) NSNumber *age;
@property (readonly, getter=isSingle)BOOL single;

-(Citizen *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName sex:(Sex)sex andAge:(NSNumber *)age;

-(bool)marry:(Citizen *)citizen;

-(void)divorce:(Citizen *)citizen;

-(void) addChild:(Citizen*) child;

-(NSString *) fullName;

@end
