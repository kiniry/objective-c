//
//  Citizen.m
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

//Running Xcode 4.4+ so no need to synthesize properties

-(Citizen *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName sex:(Sex)sex andAge:(NSNumber *)age
{
    self = [super init];
    
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.sex = sex;
        self.age = age;
    }
    return self;
}

-(void)marry:(Citizen *)citizen
{
    if (self.isSingle && citizen.isSingle) {
        self.spouse = citizen;
        citizen.spouse = self;
    }
}

-(void)divorce:(Citizen *)citizen
{
    self.spouse = nil;
    citizen.spouse = nil;
}

-(BOOL)isSingle;
{
    return self.spouse == nil;
}

@end
