//
//  Citizen.m
//  Assignment#3
//
//  Created by Jacob Espersen on 18/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen


/*
 Initializes the Citizen with name, sex and age
 */
- (Citizen*)initWithFirstName:(NSString *)fName sex:(Sex)aSex
                          age:(NSNumber *)age{
    
    self = [super init];
    
    if (self) {
        self.name = fName;
        self.sex = aSex;
        self.age = age;
        self.Children = [[NSMutableArray alloc] init];
    }
    return self;
}
/*
 For initializing a bastard child
 */
- (Citizen*)initWithFirstName:(NSString *)fName sex:(Sex)sex age:(NSNumber *)age andMother:(Citizen *)aMother{
    self = [self initWithFirstName:fName sex:sex age:age];
    if (self) {
        self.mother = aMother;
    }
    return self;
}

/*
 Initializes the citizen with name, sex, age, mother and father
 */
- (Citizen*)initWithFirstName:(NSString *)fName sex:(Sex)aSex age:(NSNumber *)age mother:(Citizen *)mother andFather:(Citizen *)father{
    self = [self initWithFirstName:fName sex:aSex age:age andMother:mother];
    if (self) {
        self.father = father;
    }
    return self;
}
/*
 Checks if a Citizen is able to marry the current citizen, throws an exception if the the marriage is
 not possible.
 */
- (BOOL)impedimentToMarriage:(Citizen *)citizen{
    if (citizen == self)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can not marry yourself" userInfo:nil];
    if ([self.children containsObject:citizen] || self.father == citizen || self.mother == citizen)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Persons who are related can not get married" userInfo:nil];
    if (self.sex == citizen.sex)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Citizens of the same sex can not get married" userInfo:nil];
    if (!self.single || !citizen.single)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Both Citizens should be singles to get married" userInfo:nil];
    
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
- (void)marry:(Citizen *)aSpouse{
    if (aSpouse ==nil)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"The value of the passed spouse is nil" userInfo:nil];
    
    if ([self impedimentToMarriage:aSpouse] && aSpouse != nil) {
        self.spouse = aSpouse;
        aSpouse.spouse = self;
    }
    
}

/*
 Creates a new Citizen and sets the current Citizen and its spouse to its parents.
 Adds the new citizens to its parents array of children.
 and returns the new Citizen
 */
- (Citizen*)haveChildWithName:(NSString *)name sex:(Sex)sex{
    if (name == nil)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Your baby has to have a name" userInfo:nil];
    if (self.single && self.sex == male)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"A man can not give birth to a child without a woman" userInfo:nil];
    if (self.single && self.sex == female) {
        return [self haveBastardChildWithName:name andSex:sex];
    }else if(self.sex == female){
        Citizen* child = [[Citizen  alloc] initWithFirstName:name sex:sex age:@0 mother:self andFather:self.spouse];
        [self.children addObject:child];
        [self.spouse.children addObject:child];
        return child;
    }else{
        Citizen* child = [[Citizen alloc] initWithFirstName:name sex:sex age:@0 mother:self.spouse andFather:self];
        [self.children addObject:child];
        [self.spouse.children addObject:child];
        return child;
    }
}
/*
 If a single woman has a child;
 */
- (Citizen*)haveBastardChildWithName:(NSString *)aName andSex:(Sex)aSex{
    Citizen* child = [[Citizen alloc] initWithFirstName:aName sex:aSex age:@0 andMother:self];
    [self.children addObject:child];
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
