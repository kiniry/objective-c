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
@property (nonatomic, strong) Citizen *spouse;
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
        self.spouse = nil;
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
    return self.spouse == nil;
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

- (BOOL) marry: (Citizen *) person
{
    if([person getGender] != [self getGender] && [self isSingle] && [person isSingle]) {
        // Let these two people be united in whatever faith they believe in.
        [person setSpouse:self];
        self.spouse = person;
        return YES;
    }
    
    return NO;
}


- (BOOL) divorce
{
    if(self.isSingle != YES) {
        // Out of the door, now!
        [self.spouse setSpouse:nil];
        self.spouse = nil;
        return YES;
    }
    
    return NO;
}


// Description
- (NSString *) description
{
    // Don't output "self.spouse" here, that'll just result in an infinite loop.
    return [NSString stringWithFormat:@"Name: %@; age: %i; gender: %@; Spouse: %@", self.name, self.age, self.sex == M ? @"M" : @"F", [self.spouse getName]];
}


@end
