//
//  Citizen.m
//  Assignment2_1
//
//  Created by Carsten Nilsson on 16/01/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import "Citizen.h"
// Removes timestamps from console to make it clean.
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize single = _single;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;

// init
- (id) initWithName:(NSString *) aName Sex:(NSString *) aSex Age:(int) anAge {
    if(self = [super init]) {
        self.name = aName;
        self.sex = aSex;
        self.age = anAge;
        // The rest of the properties will be set to
        NSLog(@"CitizenInitWith Name: %@, Sex: %@, Age: %d", self.name, self.sex, self.age);
    }
    return self;
}

// override getter
- (BOOL) single{
    return (self.spouse == nil);
}

// Answers if the citizen can be married to a given citizen.
- (BOOL)impedimentToMarriage:(Citizen *) aCitizen {

    // Constraints
    BOOL bothSingle = aCitizen.single && self.single;
    BOOL notRelated = ![self.children containsObject:aCitizen] && ![self.parents containsObject:aCitizen] && ![aCitizen.children containsObject:self] && ![aCitizen.parents containsObject:self];
    BOOL notSameSex = self.sex != aCitizen.sex;

    // Both citizen or noble
    BOOL impediments = bothSingle && notRelated && notSameSex;

    NSLog(@"impedimentToMarriage: %d", impediments);
    
    return impediments;
}

// commands
- (void)marryWith:(Citizen *) aCitizen {
    if (aCitizen && [self impedimentToMarriage:aCitizen]){
        self.spouse = aCitizen;
        self.spouse.spouse = self;
        NSLog(@"%@ married to %@.",self.name, aCitizen.name);
    } else {
        NSLog(@"%@ could not be married to %@.",self.name, aCitizen.name);
    }
}

- (void) divorce {
    if (self.single == NO){
        NSLog(@"%@ got divorced to %@.",self.name, self.spouse.name);
        self.spouse.spouse = nil;
        self.spouse = nil;
    } else {
        NSLog(@"%@ is single.",self.name);
    }
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Name: %@, Sex: %@, Age: %d, Single: %d, Spouse: %@", self.name, self.sex,self.age,self.single, self.spouse.name];
}

@end
