//
//  Citizen.m
//  Assignment3-Assertion
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
    NSAssert(!([self.parents count] >= 2), @"addParent constraint failure: Already has two parents");
    NSAssert(![self.parents containsObject:parent], @"addParent constraint failure: Already has that parent");
    NSAssert(![self.children containsObject:parent], @"addParent constraint failure: Cannot have child as parent");
    NSAssert(!(parent == self.spouse), @"addParent constraint failure: Cannot have spouse as parent");
    
    NSMutableSet* tmp = [self.parents mutableCopy];
    [tmp addObject:parent];
    self.parents = [tmp copy];
    
    if (![parent.children containsObject:self]) [parent addChild:self];
    
    NSAssert([self.parents containsObject:parent], @"addParent failure: parent was not added");
}

-(void) removeParent:(Citizen *)parent
{
    NSAssert([self.parents containsObject:parent], @"removeParent constraint failure: Cannot remove unexisting parent");
    
    NSMutableSet* tmp = [self.parents mutableCopy];
    [tmp removeObject:parent];
    self.parents = [tmp copy];
    
    if ([parent.children containsObject:self]) [parent removeChild:self];
    
    NSAssert(![self.parents containsObject:parent], @"removeParent failure: parent was not removed");
}

// Children
-(void) addChild:(Citizen *)child
{
    NSAssert(![self.parents containsObject:child], @"addChild constraint failure: Cannot have parent as child");
    NSAssert(![self.children containsObject:child], @"addChild constraint failure: Already has that child");
    NSAssert(!(child == self.spouse), @"addChild constraint failure: Cannot have spouse as child");
    
    NSMutableSet* tmp = [self.children mutableCopy];
    [tmp addObject:child];
    self.children = [tmp copy];
    
    if (![child.parents containsObject:self]) [child addParent:self];
    
    NSAssert([self.children containsObject:child], @"addChild failure: child was not added");
}

-(void) removeChild:(Citizen *)child
{
    NSAssert([self.children containsObject:child], @"removeParent constraint failure: Cannot remove unexisting child");
    
    NSMutableSet* tmp = [self.children mutableCopy];
    [tmp removeObject:child];
    self.children = [tmp copy];
    
    if ([child.parents containsObject:self]) [child removeParent:self];
    
    NSAssert(![self.children containsObject:child], @"removeChild failure: child was not removed");
}

// Civil status
-(void) marry: (Citizen *)fiancee
{
    NSAssert(self.single, @"marryTo constraint failure: Is not single");
    NSAssert(!self.spouse, @"marryTo constraint failure: Already has a spouse");
    NSAssert(fiancee.sex != self.sex, @"marryTo constraint failure: Cannot marry same sex");
    NSAssert(![self.children containsObject:fiancee], @"marryTo constraint failure: Cannot marry child");
    NSAssert(![self.parents containsObject:fiancee], @"marryTo constraint failure: Cannot marry parent");
    
    self.single = NO;
    self.spouse = fiancee;
    
    if (!fiancee.spouse) [fiancee marry:self];
    
    NSAssert(self.spouse == fiancee, @"marry failure: you were not married");
}

-(void) divorce: (Citizen *)spouse
{
    NSAssert(self.spouse, @"divorceFrom constraint failure: Cannot divorce nonexistent spouse");
    NSAssert(!self.single, @"divorceFrom constraint failure: Cannot divorce when single");
    
    self.single = YES;
    self.spouse = nil;
    
    if (spouse.spouse) [spouse divorce:self];
    
    NSAssert(self.spouse != spouse, @"divorce failure: you were not divorced");
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
