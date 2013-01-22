//
//  Citizen.m
//  Assignment3-Logging
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
        NSLog(@"addParent constraint failure: Already has two parents");
        return;
    } else if ([self.parents containsObject:parent])
    {
        NSLog(@"addParent constraint failure: Already has that parent");
        return;
    } else if ([self.children containsObject:parent])
    {
        NSLog(@"addParent constraint failure: Cannot have child as parent");
        return;
    } else if (parent == self.spouse)
    {
        NSLog(@"addParent constraint failure: Cannot have spouse as parent");
        return;
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
        NSLog(@"removeParent constraint failure: Cannot remove unexisting parent");
        return;
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
        NSLog(@"addChild constraint failure: Cannot have parent as child");
        return;
    } else if ([self.children containsObject:child])
    {
        NSLog(@"addChild constraint failure: Already has that child");
        return;
    } else if (child == self.spouse)
    {
        NSLog(@"addChild constraint failure: Cannot have spouse as child");
        return;
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
        NSLog(@"removeParent constraint failure: Cannot remove unexisting child");
        return;
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
    if (!self.single)
    {
        NSLog(@"marryTo constraint failure: Is not single");
        return;
    } else if (self.spouse)
    {
        NSLog(@"marryTo constraint failure: Already has a spouse");
        return;
    } else if (fiancee.sex == self.sex)
    {
        NSLog(@"marryTo constraint failure: Cannot marry same sex");
        return;
    } else if ([self.children containsObject:fiancee])
    {
        NSLog(@"marryTo constraint failure: Cannot marry child");
        return;
    } else if ([self.parents containsObject:fiancee])
    {
        NSLog(@"marryTo constraint failure: Cannot marry parent");
        return;
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
        NSLog(@"divorceFrom constraint failure: Cannot divorce nonexistent spouse");
        return;
    } else if (self.single)
    {
        NSLog(@"divorceFrom constraint failure: Cannot divorce when single");
        return;
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
