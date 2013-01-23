//
//  Citizen.m
//  assignment2
//
//  Created by Joachim on 16/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name = _name,
            age = _age,
            sex = _sex,
            spouse = _spouse,
            father = _father,
            mother = _mother,
            children = _children,
            single = _single;

-(Citizen*)initWithName:(NSString*)string andAge:(int)integer andSex:(SEX)maleorfemale {

    self = [super init];
    
    if(self) {
        self.name = string;
        self.age = integer;
        self.sex = maleorfemale;
        self.single = true;
        self.children =[[NSMutableArray alloc] init];
    }
    return self;
}

-(void)marry:(Citizen*)citizen {
    if([self canMarry:citizen]) {
        self.spouse = citizen;
        citizen.spouse = self;
        self.single = false;
        citizen.single = false;
    }
}

-(BOOL)canMarry:(Citizen*)citizen {
    return self.single &&
        citizen.single &&
        self.sex != citizen.sex &&
        self.father != citizen &&
        self.mother != citizen &&
        ![self.children containsObject:citizen];
}

-(void)divorce {
    if(!self.single) {
        self.spouse.single = true;
        self.spouse.spouse = nil;
        self.single = true;
        self.spouse = nil;
    }
}

-(void)addChild:(Citizen *)child {
    if(child.mother != self && child.father != self && child != self && child != self.spouse && ![child.children containsObject:self]) {
        [self.children addObject:child];
        if(self.sex == male) {
            child.father = self;
        } else {
            child.mother = self;
        }
    }
}

-(NSString*)description {
    return [NSString stringWithFormat:
            @"Name: %@\nAge: %d\nSex: %@\nFather: %@\nMother: %@\nChildren count: %d\nCivil status: %@\n",
            self.name,
            self.age,
            self.sex == male ? @"Male" : @"Female",
            self.father.name,
            self.mother.name,
            self.children.count,
            self.single ? @"single" : [NSString stringWithFormat:@"married to %@",self.spouse.name]];
}

@end
