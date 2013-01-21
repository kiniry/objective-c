//
//  Citizen.m
//  CivilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "Citizen.h"
#import "CitizenProtocol.h"
#import "CitizenPrivate.h"

@implementation Citizen

@synthesize name = _name, age = _age, spouse = _spouse,
mother = _mother, father = _father, impedimentToMarriage = _impedimentToMarriage, children = _children, mChildren = _mChildren,
sex = _sex; // sex = true means man, false means woman

-(id) initWithMother:(Citizen*) mother andFather:(Citizen*) father andSex:(BOOL) sex
{
    if (self = [super init])
    {
        self.mother = mother;
        self.father = father;
        self.sex = sex;
    }
    return self;
}

-(id) initWithMother:(Citizen*) mother andFather:(Citizen*) father andSex:(BOOL) sex andName:(NSString*) name
{
    if(self = [self initWithMother:mother andFather:father andSex:sex])
        self.name = name;
    return self;
}

-(NSArray *) children
{
    // Return a readonly immutable copy of the children array
    return [NSArray arrayWithArray:self.mChildren];
}

// Override getter and make lazy instantiation
-(NSMutableArray *) mChildren
{
    if(_mChildren == nil) _mChildren = [NSMutableArray array];
    return _mChildren;
}

-(BOOL) single
{
    return self.spouse == nil;
}

-(BOOL) marry:(Citizen*) fiancee
{
    if(![self canMarry:fiancee]) return false;
    
    // If we got through to here everything must be alright    
    self.spouse = fiancee;
    
    // Also remember to set the citizen's, which we just married, spouse to our self !
    return (fiancee.spouse = self) != nil;
}

-(BOOL) canMarry:(Citizen*) fiancee
{
    return !(
              // There must be fiancee
              fiancee == nil ||
              
              // If the citizens are not single they can definitely not get married again.
              // No polygamy here !
              !self.single || !fiancee.single ||
              
              // We cannot marry our parents either
              [self.father isEqual:fiancee] ||
              [self.mother isEqual:fiancee] ||
              
              // Same sex does not work either
              self.sex == fiancee.sex ||
              
              // Marriage to one of the citizen's children is also no go !
              [self.mChildren containsObject:fiancee]
              );
}

-(BOOL) divorce
{
    if(!self.canDivorce) return false;
    self.spouse.spouse = nil;
    return (self.spouse = nil) == nil;
}

-(BOOL) canDivorce
{
    return self.single;
}

-(Citizen *) giveBirthAndNameChild:(NSString*) name
{
    // Generate random number from 0-99. First half represents male, second half represents woman
    return [self giveBirthToSpecificSex:
                (arc4random() % 100 < 50)
                           andNameChild: name];
}

-(Citizen *) giveBirthToSpecificSex:(BOOL) sex andNameChild:(NSString*) name
{
    // Men cannot give birth and neither can singles
    if(!self.canGiveBirth) return nil;
    
    // Set mother and father according to sex
    Citizen *father = self.sex ? self : self.spouse;
    Citizen *mother = self.sex ? self.spouse : self;
    
    // Create child
    Citizen *child = [[Citizen alloc] initWithMother:mother andFather:father andSex:sex andName:name];
    child.age = [NSNumber numberWithFloat: 0.0];
    
    // Add child to father and mother
    [father.mChildren addObject:child];
    [mother.mChildren addObject:child];
    
    return child;
}

-(BOOL) canGiveBirth
{
    return !(self.sex || self.single);
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Person: name: %@, age: %@, sex: %d, mother's name: %@, father's name: %@, children: %ld",
            self.name, self.age, self.sex, self.mother.name
            , self.father.name, self.children.count];
}

@end
