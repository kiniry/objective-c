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
        _firstName = firstName;
        _lastName = lastName;
        _sex = sex;
        _age = age;
    }
    return self;
}

-(bool)marry:(Citizen *)citizen
{
    //Can only get married if both are single
    if (self.isSingle &&
        citizen.isSingle &&
        ![self isEqual:citizen] &&
        ![citizen isEqual:self.father] &&
        ![citizen isEqual:self.mother] &&
        ![citizen isEqual:self.father] &&
        ![self.children containsObject:citizen] &&
        self.sex != citizen.sex) {
        
        self.spouse = citizen;
        citizen.spouse = self;
        
        return YES;
    }
    
    return NO;
}

-(void)divorce:(Citizen *)citizen
{
    // Can only get divorced if the citizen in the argument is the spouse
    if (self.spouse == citizen) {
        self.spouse = nil;
        citizen.spouse = nil;
    }
}

-(BOOL)isSingle
{
    return self.spouse == nil;
}

-(void) addChild:(Citizen*) child
{
    if (!self.children) self.children = [[NSMutableSet alloc] init];
    
    if (self.sex == male && child.father == nil) {
        child.father = self;
        [self.children addObject:child];
    }else if(self.sex == female && child.mother == nil){
        child.mother = self;
        [self.children addObject:child];
    }
}

-(NSString *) fullName
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
