//
//  Citizen.m
//  Assignment 3
//
//  Created by Sivanujann Selliah on 17/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize single = _single;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;

-(void)checkInvariant {
    if(_DEBUG && !(self.single || self.spouse.spouse == self))
        NSLog(@"Either you are single or your spouse's spouse is yourself!");
    if(_DEBUG && !([self.parents count] == 2))
        NSLog(@"How did you get born without two parents?");
    for (Citizen *child in self.children) {
        if(_DEBUG && !([child.parents containsObject:self]))
            NSLog(@"Your child %@ doesn't seem to have you set as %@ parent!", child.name, (child.sex == @"male" ? @"his" : @"her"));
    }
}

-(id)initWithName:(NSString *)aName Sex:(NSString *)aSex Age:(int) anAge {
    self = [super init];
    if(self) {
        self.name = aName;
        self.sex = aSex;
        self.age = anAge;
    
        // spouse will be nil from start
        // children and parents must be set afterwards
    
        NSLog(@"InitWithDefaultInfo Name: %@, Sex: %@, Age: %d", self.name, self.sex, self.age);
    }
    
    return self;
}

-(BOOL)single {
    BOOL isSingle = (self.spouse == nil);
    
    if(_DEBUG && !((isSingle && self.spouse == nil) || (!isSingle && self.spouse != nil)))
        NSLog(@"If you are single then you shouldn't have a spouse. If you are not single, then you should have a spouse!");
    
    return isSingle;
}


-(BOOL)impedimentToMarriage:(Citizen *)aCitizen {
    if(_DEBUG && !(aCitizen != nil))
        NSLog(@"Are you really marrying 'nil'?");
    
    BOOL bothAreSingle = self.single && aCitizen.single;
    BOOL theyAreNotRelated = ![self.children containsObject:aCitizen] && ![self.parents containsObject:aCitizen] && ![aCitizen.children containsObject:self] && ![aCitizen.parents containsObject:self];
    BOOL theyAreOfOppositeSex = self.sex != aCitizen.sex;
    
    BOOL anyImpediments = !bothAreSingle || !theyAreNotRelated || !theyAreOfOppositeSex;
    
    NSLog(@"impedimentToMarriage %d", anyImpediments);
    
    if(_DEBUG && !(bothAreSingle))
        NSLog(@"Both of you should be single, before you can get married!");
    if(_DEBUG && !(theyAreNotRelated))
       NSLog(@"A marriage of related people is not legal!");
    if(_DEBUG && !(theyAreOfOppositeSex))
        NSLog(@"A same sex marriage is not allowed here!");
    
    return anyImpediments;
}

-(void)marry:(Citizen *)sweetheart {
    if(_DEBUG && !(sweetheart != nil))
       NSLog(@"Your sweethart is 'nil'!");
    if(_DEBUG && !(![self impedimentToMarriage:sweetheart]))
        NSLog(@"There was an impediment to this marriage!");
    
    if(sweetheart != nil && ![self impedimentToMarriage:sweetheart]) {
        self.spouse = sweetheart;
        self.spouse.spouse = self;
        
        NSLog(@"Married");
        
        if(_DEBUG && !(self.spouse == sweetheart))
           NSLog(@"Your sweethart wasn't set as your spouse!");
    }
    else {
        NSLog(@"Could not be married");
    }
}

-(void)divorce {
    if(_DEBUG && !(!self.single))
        NSLog(@"You are already single, why do you need a divorce?");
    
    if(self.single == false) {
        Citizen *oldSpouse = self.spouse;
        
        self.spouse.spouse = nil;
        self.spouse = nil;
    
        NSLog(@"Divorced");
        
        if(_DEBUG && !(oldSpouse.single))
            NSLog(@"The divorce apperently didn't make your old spouse single!");
    } else {
        NSLog(@"Already single!");
    }
    
    if(_DEBUG && !(self.single))
        NSLog(@"The divorce apperently didn't make you single!");
}


-(NSString *)description {
    // Make sure there is no infinite loops, by only getting the names of the two parents!
    NSString *parent1 = ((Citizen *)[[self.parents allObjects] objectAtIndex:0]).name;
    NSString *parent2 = ((Citizen *)[[self.parents allObjects] objectAtIndex:1]).name;
    NSString *hisHer = (self.sex == @"male" ? @"his" : @"her");
    NSString *manWoman = (self.sex == @"male" ? @"man" : @"woman");
    NSString *singleMarriedSpouse = (self.single ? @"single" : [NSString stringWithFormat:@"married to %@", self.spouse.name]);
    NSString *heShe = (self.sex == @"male" ? @"he" : @"she");
    int childrenCount = (int)[self.children count];
    NSString *childrenNamesFormat = (childrenCount > 1 ? @"children: %@" : @"child: %@");
    NSString *childrenNames = [[self.children allObjects] componentsJoinedByString:@", "];
    NSString *childrenWithNames = [NSString stringWithFormat:childrenNamesFormat, childrenNames];
    NSString *children = (childrenCount > 0 ? childrenWithNames : @"children");
    
    return [NSString stringWithFormat:@"%@ who is a %@, %d years old, is %@, %@ parents are %@ and %@ and %@ has %d %@", self.name, manWoman, self.age, singleMarriedSpouse, hisHer, (parent1 == nil ? @"unknown" : parent1), (parent2 == nil ? @"unknown" : parent2), heShe, childrenCount, children];
}

@end
