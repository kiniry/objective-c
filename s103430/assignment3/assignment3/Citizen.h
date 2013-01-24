//
//  Citizen.h
//  assignment2
//
//  Created by Joachim on 16/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    male,
    female
} SEX;

@interface Citizen : NSObject

@property NSString *name;
@property int age;
@property SEX sex;
@property Citizen *spouse, *father, *mother;
@property NSMutableArray *children;
@property BOOL single;

-(Citizen*)initWithName:(NSString*)string andAge:(int)integer andSex:(SEX)maleorfemale;
-(void)marry:(Citizen*)citizen;
-(BOOL)canMarry:(Citizen*)citizen;
-(void)divorce;
-(void)addChild:(Citizen*)child;
-(NSString*)description;

@end
