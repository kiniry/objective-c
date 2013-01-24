//
//  CitizenAssertion.m
//  Assignment#3
//
//  Created by Jacob Espersen on 21/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "CitizenAssertion.h"

@implementation CitizenAssertion

/*
 Initializes the Citizen with name, sex and age
 */
- (CitizenAssertion*)initWithFirstName:(NSString *)fName sex:(Sex)aSex
                                   age:(NSNumber *)age{
    
    NSAssert(fName != nil
             && age != nil,
             @"Precondition failure in initialization without parents");    // checks if the pretcondition is ok
    self = [super init];
    
    if (self) {
        self.name = fName;
        self.sex = aSex;
        self.age = age;
        self.Children = [[NSMutableArray alloc] init];
        NSAssert(self.name != nil
                 && self.age != nil
                 && self.name == fName
                 && self.age == age
                 && self.sex == aSex,
                 @"Postcondtion failure in initialization without parents "); // checks if the postcondition is ok
    }
    return self;
}
/*
 For initializing a bastard child
 */
- (CitizenAssertion*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age andMother:(CitizenAssertion *)aMother{
    NSAssert(aMother != nil,
             @"Precondition failure in initialization with a mother");  // checks if the pretcondition is ok
    self = [self initWithFirstName:fName sex:sex age:age];
    if (self) {
        self.mother = aMother;
        NSAssert(self.mother == aMother
                 && self.mother != nil,
                 @"Postcondition failure in initialization with a mother"); // checks if the postcondition is ok
    }
    return self;
}

/*
 Initializes the citizen with name, sex, age, mother and father
 */
- (CitizenAssertion*)initWithFirstName:(NSString *)fName sex:(Sex)aSex age:(NSNumber *)age mother:(CitizenAssertion *)mother andFather:(CitizenAssertion *)father{
    NSAssert(father != nil,
             @"Precondition failure in initialization with a father");  // checks if the pretcondition is ok
    self = [self initWithFirstName:fName sex:aSex age:age andMother:mother];
    if (self) {
        self.father = father;
        NSAssert(self.father == father
                 && self.father != nil,
                 @"Postcondition failure in initialization with a father"); // checks if the postcondition is ok
    }
    return self;
}
/*
 Checks if a Citizen is able to marry the current citizen, throws an exception if the the marriage is
 not possible.
 */
- (BOOL)impedimentToMarriage:(CitizenAssertion *)citizen{
        NSAssert(citizen != self,
                 @"You can not marry yourself");    // checks if the pretcondition is ok
        NSAssert(![self.children containsObject:citizen]
                 || self.father != citizen
                 || self.mother != citizen,
                 @"Citizens who are related can not get married");  // checks if the pretcondition is ok
        NSAssert(citizen.sex != self.sex,
                 @"Citizens of the same sex can not get married");  // checks if the pretcondition is ok
        NSAssert(self.single && citizen.single,
                 @"Citizens can not be married to more than one");    // checks if the pretcondition is ok

    if (![self.children containsObject:citizen]
        && self.father != citizen
        && self.mother != citizen
        && self.sex != citizen.sex
        && self.single
        && citizen.single
        && citizen != self){
        return YES;
        
    }else{
        return NO;
    }
}

/*
 Marries a spouse if possible, throws an exception if the spouse has no a nil value
 */
- (void)marry:(CitizenAssertion *)aSpouse{
    NSAssert(aSpouse != nil,
             @"Precondition failure for getting married");    // checks if the pretcondition is ok
    if ([self impedimentToMarriage:aSpouse] && aSpouse != nil) {
        self.spouse = aSpouse;
        aSpouse.spouse = self;
        NSAssert(self.spouse == aSpouse
                 && aSpouse.spouse == self,
                 @"Postcondition failure for getting married"); // checks if the postcondition is ok
    }
    
}

/*
 Creates a new Citizen and sets the current Citizen and its spouse to its parents.
 Adds the new citizens to its parents array of children.
 and returns the new Citizen
 */
- (CitizenAssertion*)haveChildWithName:(NSString *)name sex:(Sex)sex{
    NSAssert(name != nil
             , @"Precondition failure, name is pointing to nil");     // checks if the pretcondition is ok
   
    
    if (self.single && self.sex == female) {
        NSAssert(self.single
                 && self.sex == female ,
                 @"Precondition failure, a man can not give birth to a child without a woman");    // checks if the pretcondition is ok
        return [self haveBastardChildWithName:name andSex:sex];
    }else if(self.sex == female){
        CitizenAssertion* child = [[CitizenAssertion  alloc] initWithFirstName:name sex:sex age:@0 mother:self andFather:self.spouse];
        [self.children addObject:child];
        [self.spouse.children addObject:child];
        NSAssert(child.father == self.spouse
                 && child.mother == self
                 && [self.children containsObject:child]
                 && [self.spouse.children containsObject:child],
                 @"Postcondition failure, something went wrong while having a child for a woman"); // checks if the postcondition is ok
        return child;
    }else{
        CitizenAssertion* child = [[CitizenAssertion alloc] initWithFirstName:name sex:sex age:@0 mother:self.spouse andFather:self];
        [self.children addObject:child];
        [self.spouse.children addObject:child];
        NSAssert(child.mother == self.spouse
                 && child.father == self
                 && [self.children containsObject:child]
                 && [self.spouse.children containsObject:child],
                 @"Postcondition failure, something went wrong while having a child for a man"); // checks if the postcondition is ok
        return child;
    }
}
/*
 If a single woman has a child;
 */
- (CitizenAssertion*)haveBastardChildWithName:(NSString *)aName andSex:(Sex)aSex{
    CitizenAssertion* child = [[CitizenAssertion alloc] initWithFirstName:aName sex:aSex age:@0 andMother:self];
    [self.children addObject:child];
    NSAssert(child.mother == self
             && [self.children containsObject:child],
                 @"Postcondition failure, something went wrong with having a bastard child"); // checks if the postcondition is ok
    return child;
}
/*
 Custom gettet method for the single boolean
 */
- (BOOL)single{
    if (self.spouse) {
        return NO;
    }else{
        return YES;
    }
}

@end
