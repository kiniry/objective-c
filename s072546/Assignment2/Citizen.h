//
//  Citizen.h
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/13/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

typedef enum
{
    male,
    female
} Sex;

@property (copy) NSString *firstName;
@property (copy) NSString *lastName;

@property Sex sex;
@property (retain) Citizen *spouse;

//Init function
-(id) initWithName: (NSString*) firstname andLastName: (NSString*) lastname;

-(NSString*) info;
-(bool) single;

@end
