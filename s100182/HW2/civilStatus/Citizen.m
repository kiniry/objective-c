//
//  Citizen.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 10/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (Citizen *)initWithFirstName:(NSString *)firstName
                   andLastName:(NSString *)lastName
                        andAge:(NSNumber *)age;
{
    self = [super init];  //std. init pattern. +[super init] needs to be called and only once per class
    if (self)               
    {
        self.firstName = firstName;
        self.lastName = lastName;
        self.age = age;
    }
    return self;
}

//WARNING: politically incorrect code may occour!
- (void)marry:(Citizen *)aSpouse
{                                                                   //Impediments to marriage:
    if (![self.children containsObject:(Citizen *)aSpouse] &&       //can not marry own children
        self.mother != aSpouse &&                                   //and mother
        self.father != aSpouse &&                                   //and father
        !(aSpouse == self) &&                                       //and self
        (self.isSingle) &&                                          //and self needs to be single
        aSpouse.isSingle &&                                         //and aSpouse needs to be single
        !(self.spouse) &&                                           //and only one spouse
        !(self.sex == aSpouse.sex))                                 //and not same sex 
    {
        self.spouse = aSpouse;
        aSpouse.spouse = self;      //spouse's spouse is self !!CANNOT MAKE THIS WORK!!ARGH!!!!!!!
    }
}

- (void)divorce
{
    self.spouse.spouse = nil;       //spouse's spouse is nil
    self.spouse = nil;              //self's spouse is also nil
}

- (BOOL)isSingle
{
    return (self.spouse == nil);    //if no spouse isSingle == YES   !!!DOES NOT WORK!!!
//    return (self.spouse == nil) ? YES : NO;
}

- (void)addChild:(Citizen *)child
{
    if (!self.children) {self.children = [[NSMutableArray alloc] init];}    //lazy instantiation
    switch (self.sex)  //set parent type
    {
        case 0:
            child.father = self;
            break;
        case 1:
            child.mother = self;
    }
    [self.children addObject:(Citizen *)child]; //add child to self's children
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@ %@ \nSex %d \nAge: %@ \nIs single: %d \nSpouse %@",
            self.firstName,
            self.lastName,
            self.sex,
            self.age,
            self.isSingle,
            self.spouse.firstName];
}
@end
