//
//  Citizen.m
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import "Citizen.h"

@interface Citizen()

@property (strong) NSString *name;
@property int age;
@property (strong) Citizen *mother;
@property (strong) Citizen *father;
@property (strong) Citizen *spouse;
@property gender sex;

@end

@implementation Citizen


- (id) initWithName:(NSString *)name AndAge:(int) age AndSex:(gender) sex
{
    self = [super init];
    if(self) {
        self.name = name;
        self.age = age;
        self.sex = sex;
    }
    
    return self;
}


// Queries

- (NSString *) getName;
{
    return self.name;
}

- (int) getAge;
{
    return self.age;
}

- (BOOL) isSingle;
{
    return YES;
}

- (Citizen *) getSpouse;
{
    return self.spouse;
}

- (gender) getGender
{
    return self.sex;
}

// Commands

- (BOOL) marry: (Citizen *) Person
{
    return NO;
}


- (BOOL) divorce
{
    return NO;
}


// Description
- (NSString *) description
{
    return [NSString stringWithFormat:@"Name: %@; age: %i; gender: %@", self.name, self.age, self.sex == M ? @"M" : @"F"];
}


@end
