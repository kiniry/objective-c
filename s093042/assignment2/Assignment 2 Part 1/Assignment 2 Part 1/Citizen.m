//
//  Citizen.m
//  Assignment 2 Part 1
//
//  Created by Sivanujann Selliah on 14/01/13.
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

-(id)initWithName:(NSString *)aName Sex:(NSString *)aSex Age:(int) anAge {
    if(self = [super init]) {
    
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
    return (self.spouse == nil);
}


-(BOOL)impedimentToMarriage:(Citizen *)aCitizen {
    BOOL bothAreSingle = self.single && aCitizen.single;
    BOOL theyAreNotRelated = ![self.children containsObject:aCitizen] && ![self.parents containsObject:aCitizen] && ![aCitizen.children containsObject:self] && ![aCitizen.parents containsObject:self];
    BOOL theyAreOfOppositeSex = self.sex != aCitizen.sex;
    
    BOOL anyImpediments = !bothAreSingle || !theyAreNotRelated || !theyAreOfOppositeSex;
    
    NSLog(@"impedimentToMarriage %d", anyImpediments);
    
    return anyImpediments;
}

-(void)marry:(Citizen *)sweetheart {
    if(sweetheart != nil && ![self impedimentToMarriage:sweetheart]) {
        self.spouse = sweetheart;
        self.spouse.spouse = self;
        
        NSLog(@"Married");
    }
    else {
        NSLog(@"Could not be married");
    }
}

-(void)divorce {
    if(self.single == false) {
        self.spouse.spouse = nil;
        self.spouse = nil;
    
        NSLog(@"Divorced");
    } else {
        NSLog(@"Already single!");
    }
}


-(NSString *)description {
    NSArray *parents = [self.parents allObjects];
    
    return [NSString stringWithFormat:@"%@ is a %@, who is %d years old, is %@, %@ parents are %@ and %@", self.name, (self.sex == @"male" ? @"man" : @"woman"), self.age, (self.single ? @"single" : [NSString stringWithFormat:@"married to %@", self.spouse.name]), (self.sex == @"male" ? @"his" : @"her"), ((Citizen *)[parents objectAtIndex:0]).name, ((Citizen *)[parents objectAtIndex:1]).name];
}

@end
