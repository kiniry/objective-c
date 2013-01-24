//
//  Citizen.h
//  Assignment2
//
//  Created by Philip Nielsen on 14/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    male,
    female
} Sex;

@interface Citizen : NSObject

@property (copy) NSString *name;
@property Sex sex;
@property int age;
@property (readonly) BOOL single;       // Property is readonly, but instance variable is read/write -> public getter + private setter
@property (readonly) Citizen *spouse;   // Property is readonly, but instance variable is read/write -> public getter + private setter
@property (nonatomic) NSArray *children;
@property (nonatomic) NSArray *parents;

- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age;
- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age parents:(NSArray *)parents;

- (void)marryToCitizen:(Citizen *)newSpouse;
- (void)divorce;

@end
