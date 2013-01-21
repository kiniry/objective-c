//
//  LoggingCitizen.m
//  Assignment#3
//
//  Created by Jacob Espersen on 20/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "LoggingCitizen.h"

@implementation LoggingCitizen

#define Log(What) NSLog(@"<%@>, [%@], line: %d, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, What)
#define Fail(What) NSLog(@"FAILURE <%@>, [%@], line: %d, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, What)

/*
 Initializes the Citizen with name, sex and age
 */
- (LoggingCitizen*)initWithFirstName:(NSString*)fName sex:(Sex)sex age:(NSNumber*)age{
    if (fName == nil || age == nil)
        Fail(@"A parameter is not allowed to have a the nil value");
    self = [super init];
    
    if (self) {
        self.name = fName;
        self.sex = sex;
        self.age = age;
        self.Children = [[NSMutableArray alloc] init];
        Log(@"Initialization without parents succes");
    }else{
        Fail(@"Problem with initialization");
    }
    return self;
}

/*
 For initializing a bastard child
 */
- (LoggingCitizen*)initWithFirstName:(NSString *)fName
                                 sex:(Sex)sex
                                 age:(NSNumber *)age
                           andMother:(LoggingCitizen*)aMother{
    if (aMother == nil)
        Fail(@"A parameter is not allowed to have a the nil value");
    
    self = [self initWithFirstName:fName sex:sex age:age];
    if (self) {
        self.mother = aMother;
        [self.mother.children addObject:self];
        Log(@"Initialization with mother succes");
    }else{
        Fail(@"Problem with initialization");
    }
    return self;
}

/*
 Initializes the citizen with name, sex, age, mother and father
 */
- (LoggingCitizen*)initWithFirstName:(NSString *)fName
                                 sex:(Sex)sex
                                 age:(NSNumber *)age
                              mother:(LoggingCitizen*)mother
                           andFather:(LoggingCitizen*)father{
    if (father == nil)
        Fail(@"A parameter is not allowed to have a the nil value");
    self = [self initWithFirstName:fName sex:sex age:age andMother:mother];
    if (self) {
        self.father = father;
        [self.father.children addObject:self];
        Log(@"Initialization with both parents succes");
    }else{
        Fail(@"Problem with initialization");
    }
    return self;
}

/*
 Marries a spouse if possible, throws an exception if the spouse has no a nil value
 */
- (void)marry:(LoggingCitizen*)spouse{
    if (spouse ==nil)
         Fail(@"A parameter is not allowed to have a the nil value");
    if ([self impedimentToMarriage:spouse] && spouse != nil) {
        self.spouse = spouse;
        spouse.spouse = self;
        Log(@"succesful marriage");
    }else{
        Fail(@"Problem with marriage");
    }
}

- (BOOL)impedimentToMarriage:(LoggingCitizen*)citizen{
    if (citizen == self)
        Fail(@"You can not marry yourself");
    if ([self.children containsObject:citizen] || self.father == citizen || self.mother == citizen)
        Fail(@"Persons who are related can not get married");
    if (self.sex == citizen.sex)
        Fail(@"Citizens of the same sex can not get married");
    if (!self.single || !citizen.single)
        Fail(@"Both Citizens should be singles to get married");
    
    if (![self.children containsObject:citizen]
        && self.father != citizen
        && self.mother != citizen
        && self.sex != citizen.sex
        && self.single
        && citizen.single
        && citizen != self){
        Log(@"Impediment to marriage succesful");
        return YES;
        
    }else{
        Fail(@"Impediment to marriage failure");
        return NO;
    }
}

/*
 Creates a new Citizen and sets the current Citizen and its spouse to its parents.
 Adds the new citizens to its parents array of children.
 and returns the new Citizen
 */
- (LoggingCitizen*)haveChildWithName:(NSString*)name sex:(Sex)sex{
    if (name == nil)
        Fail(@"the name parameter is nil");
    if (self.single && self.sex == female) {
        return [self haveBastardChildWithName:name andSex:sex];
    }else if(self.sex == female){
        LoggingCitizen* child = [[LoggingCitizen  alloc] initWithFirstName:name sex:sex age:@0 mother:self andFather:self.spouse];
        [self.children addObject:child];
        [self.spouse.children addObject:child];
        Log(@"A child has been born and registred");
        return child;
    }else if (self.sex == male && !self.single){
        LoggingCitizen* child = [[LoggingCitizen alloc] initWithFirstName:name sex:sex age:@0 mother:self.spouse andFather:self];
        [self.children addObject:child];
        [self.spouse.children addObject:child];
        Log(@"A child has been born and registred");
        return child;
    }else{
        Fail(@"A man can not give birth to a child without a woman");
        return nil;
    }
}

/*
 If a single woman has a child;
 */
- (LoggingCitizen*)haveBastardChildWithName:(NSString*)aName andSex:(Sex)aSex{
    LoggingCitizen* child = [[LoggingCitizen alloc] initWithFirstName:aName sex:aSex age:@0 andMother:self];
    [self.children addObject:child];
    Log(@"A bastard child has been born and registred");
    return child;
}

/*
 Custom getter method for the single boolean
 */

- (BOOL)single{
    if (self.spouse) {
        return NO;
    }else{
        return YES;
    }
}

@end
