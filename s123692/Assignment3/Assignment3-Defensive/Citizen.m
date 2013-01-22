//
//  Citizen.m
//  Assignment3-Defensive
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "Citizen.h"

@interface Citizen()

// Private
@property BOOL single;
@property (readwrite, nonatomic) NSSet* children;
@property (readwrite, nonatomic) NSSet* parents;

@end


@implementation Citizen

@synthesize name = _name,
sex = _sex,
age = _age,
single = _single,
spouse = _spouse,
children = _children,
parents = _parents;

// Constructor
-(id) initWithName: (NSString *)name
            andSex: (Sex)sex
            andAge: (int)age
{
    self = [super init];
    if (self)
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
    if ([self.parents count] >= 2)
    {
        @throw [NSException exceptionWithName:@"addParent constraint failure"
                                       reason:@"Already has two parents"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if ([self.parents containsObject:parent])
    {
        @throw [NSException exceptionWithName:@"addParent constraint failure"
                                       reason:@"Already has that parent"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if ([self.children containsObject:parent])
    {
        @throw [NSException exceptionWithName:@"addParent constraint failure"
                                       reason:@"Cannot have child as parent"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if (parent == self.spouse)
    {
        @throw [NSException exceptionWithName:@"addParent constraint failure"
                                       reason:@"Cannot have spouse as parent"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        NSMutableSet* tmp = [self.parents mutableCopy];
        [tmp addObject:parent];
        self.parents = [tmp copy];
        
        if (![parent.children containsObject:self]) [parent addChild:self];
    }
    
}

-(void) removeParent:(Citizen *)parent
{    
    if (![self.parents containsObject:parent])
    {
        @throw [NSException exceptionWithName:@"removeParent constraint failure"
                                       reason:@"Cannot remove unexisting parent"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        NSMutableSet* tmp = [self.parents mutableCopy];
        [tmp removeObject:parent];
        self.parents = [tmp copy];
        
        if ([parent.children containsObject:self]) [parent removeChild:self];
    }
}

// Children
-(void) addChild:(Citizen *)child
{
    if ([self.parents containsObject:child])
    {
        @throw [NSException exceptionWithName:@"addChild constraint failure"
                                       reason:@"Cannot have parent as child"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if ([self.children containsObject:child])
    {
        @throw [NSException exceptionWithName:@"addChild constraint failure"
                                       reason:@"Already has that child"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if (child == self.spouse)
    {
        @throw [NSException exceptionWithName:@"addChild constraint failure"
                                       reason:@"Cannot have spouse as child"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        NSMutableSet* tmp = [self.children mutableCopy];
        [tmp addObject:child];
        self.children = [tmp copy];
        
        if (![child.parents containsObject:self]) [child addParent:self];
    }
}

-(void) removeChild:(Citizen *)child
{
    if (![self.children containsObject:child])
    {
        @throw [NSException exceptionWithName:@"removeParent constraint failure"
                                       reason:@"Cannot remove unexisting child"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else {
        NSMutableSet* tmp = [self.children mutableCopy];
        [tmp removeObject:child];
        self.children = [tmp copy];
        
        if ([child.parents containsObject:self]) [child removeParent:self];
    }
}

// Civil status
-(void) marry: (Citizen *)fiancee
{
    if (self.single &&
        !self.spouse &&
        (fiancee.sex != self.sex) &&
        ![self.children containsObject:fiancee] &&
        ![self.parents containsObject:fiancee])
    {
    }
    
    if (!self.single)
    {
        @throw [NSException exceptionWithName:@"marryTo constraint failure"
                                       reason:@"Is not single"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if (self.spouse)
    {
        @throw [NSException exceptionWithName:@"marryTo constraint failure"
                                       reason:@"Already has a spouse"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if (fiancee.sex == self.sex)
    {
        @throw [NSException exceptionWithName:@"marryTo constraint failure"
                                       reason:@"Cannot marry same sex"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if ([self.children containsObject:fiancee])
    {
        @throw [NSException exceptionWithName:@"marryTo constraint failure"
                                       reason:@"Cannot marry child"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if ([self.parents containsObject:fiancee])
    {
        @throw [NSException exceptionWithName:@"marryTo constraint failure"
                                       reason:@"Cannot marry parent"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        self.single = NO;
        self.spouse = fiancee;
        
        if (!fiancee.spouse) [fiancee marry:self];
    }
}

-(void) divorce: (Citizen *)spouse
{
    if (!self.spouse)
    {
        @throw [NSException exceptionWithName:@"divorceFrom constraint failure"
                                       reason:@"Cannot divorce nonexistent spouse"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else if (self.single)
    {
        @throw [NSException exceptionWithName:@"divorceFrom constraint failure"
                                       reason:@"Cannot divorce when single"
                                     userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
    } else
    {
        self.single = YES;
        self.spouse = nil;
        
        if (spouse.spouse) [spouse divorce:self];
    }
}

// Util
+(NSString*) sexToString: (Sex)sex
{
    switch (sex) {
        case Male:
            return @"Male";
            break;
        case Female:
            return @"Female";
            break;
        default:
            return nil;
            break;
    }
}

@end
