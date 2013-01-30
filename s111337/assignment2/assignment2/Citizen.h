//
//  Citizen.h
//  assignment2
//
//  Created by Radu Gatej on 1/13/13.
//  Copyright (c) 2013 Radu Gatej. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

typedef enum {
    MALE,
    FEMALE
} Sex;

@property NSString *name;
@property Sex sex;
@property unsigned int age;
@property (readonly) BOOL single;
@property Citizen *spouse;
@property NSArray *children;
@property (nonatomic) NSArray *parents;//nonatomic for modifying the setter

-(Citizen*)init:(NSString *)name
            sex:(Sex)sex
            age:(unsigned int)age;
-(void)marry:(Citizen *)citizen;
-(void)divorce;
-(BOOL)canMarry:(Citizen *)citizen;
-(BOOL)meetsConstraints;//for constraints that cannot be imposed through design or implementation;can be used for assertions after commands execution
@end
