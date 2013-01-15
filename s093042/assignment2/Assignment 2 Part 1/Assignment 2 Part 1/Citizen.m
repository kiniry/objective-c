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

-(id)initWithDefaultInfo:(NSString *)name :(NSString *)sex :(int)age {
    self = [super init];
    
    self.name = name;
    self.sex = sex;
    self.age = age;
    
    // single will be false/NO from start, so it needs to be set:
    self.single = YES;
    
    // spouse will be nil from start
    // children and parents must be set afterwards
    
    NSLog(@"InitWithDefaultInfo Name: %@, Sex: %@, Age: %d", self.name, self.sex, self.age);
    
    return self;
}

-(BOOL)impedimentToMarriage:(Citizen *)aCitizen {
    BOOL anyImpediments = !(self.single && self.spouse == nil && aCitizen.single && aCitizen.spouse == nil && (self.sex != aCitizen.sex) && ![self.children containsObject:aCitizen] && ![self.parents containsObject:aCitizen] && ![aCitizen.children containsObject:self] && ![aCitizen.parents containsObject:self]);
    
    NSLog(@"impedimentToMarriage %d", anyImpediments);
    
    return anyImpediments;
}

-(void)marry:(Citizen *)aCitizen {
    if(![self impedimentToMarriage:aCitizen]) {
        self.spouse = aCitizen;
        self.spouse.spouse = self;
        
        self.single = false;
        self.spouse.single = false;
        
        NSLog(@"Married");
    }
    else {
        NSLog(@"Could not be married");
    }
}

-(void)divorce {
    self.spouse.single = true;
    self.single = true;
    
    self.spouse.spouse = nil;
    self.spouse = nil;
    
    NSLog(@"Divorced");
}

@end
