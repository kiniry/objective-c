//
//  Citizen.m
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Citizen.h"

@interface Citizen()

// Private
@property (readwrite, nonatomic) NSSet* children;
@property (readwrite, nonatomic) NSSet* parents;

@end


@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize single = _single;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;

// Constructor
-(id) initWithName: (NSString *)name
            andSex: (Sex)sex
            andAge: (int)age
{
    if (self = [super init])
    {
        _name = name;
        _sex = sex;
        _age = age;
        _single = YES;
        _children = [[NSSet alloc] init];
        _parents = [[NSSet alloc] init];
    }
    return self;
}

// Parents
-(void) addParent:(Citizen *)parent
{
    [parent addChild:self];
    if ([self.parents count] < 2
        && ![self.parents containsObject:parent])
    {
        NSMutableSet* tmp = [self.parents mutableCopy];
        [tmp addObject:parent];
        self.parents = [tmp copy];
    }
}
-(void) removeParent:(Citizen *)parent
{
    [parent removeChild:self];
    if ([self.parents containsObject:parent])
    {
        NSMutableSet* tmp = [self.parents mutableCopy];
        [tmp removeObject:parent];
        self.parents = [tmp copy];
    }
}

// Children
-(void) addChild:(Citizen *)child
{
    [child addParent:self];
    if (![self.parents containsObject:child]
        && ![self.children containsObject:child]
        && self.spouse != child)
    {
        NSMutableSet* tmp = [self.children mutableCopy];
        [tmp addObject:child];
        self.children = [tmp copy];
    }
}
-(void) removeChild:(Citizen *)child
{
    [child removeParent:self];
    if ([self.children containsObject:child])
    {
        NSMutableSet* tmp = [self.children mutableCopy];
        [tmp removeObject:child];
        self.children = [tmp copy];
    }
}

// Civil status
-(void) marryTo: (Citizen *)fiancee
{
    if (!self.spouse &&
        fiancee.sex != self.sex &&
        ![self.children containsObject:fiancee] &&
        ![self.parents containsObject:fiancee])
    {
        self.single = NO;
        self.spouse = fiancee;
        [fiancee marryTo:self];
    }
}

-(void) divorceFrom: (Citizen *)spouse
{
    if (self.spouse)
    {
        self.single = YES;
        self.spouse = nil;
        [spouse divorceFrom:self];
    }
}

@end
