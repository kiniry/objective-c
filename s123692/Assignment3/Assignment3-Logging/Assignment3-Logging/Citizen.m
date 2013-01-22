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
    if ([self.parents count] > 2
        || [self.parents containsObject:parent]
        || [self.children containsObject:parent]
        || (parent == self.spouse))
    {
        return;
    }
    
    NSMutableSet* tmp = [self.parents mutableCopy];
    [tmp addObject:parent];
    self.parents = [tmp copy];
    
    [parent addChild:self];
}
-(void) removeParent:(Citizen *)parent
{
    if ([self.parents containsObject:parent])
    {
        
        NSMutableSet* tmp = [self.parents mutableCopy];
        [tmp removeObject:parent];
        self.parents = [tmp copy];
        
        [parent removeChild:self];
    }
}

// Children
-(void) addChild:(Citizen *)child
{
    if ([self.parents containsObject:child]
        || [self.children containsObject:child]
        || (child == self.spouse))
    {
        return;
    }

    NSMutableSet* tmp = [self.children mutableCopy];
    [tmp addObject:child];
    self.children = [tmp copy];
    
    [child addParent:self];
}
-(void) removeChild:(Citizen *)child
{
    if ([self.children containsObject:child])
    {
        NSMutableSet* tmp = [self.children mutableCopy];
        [tmp removeObject:child];
        self.children = [tmp copy];
        
        [child removeParent:self];
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
        self.single = NO;
        self.spouse = fiancee;
        fiancee.single = NO;
        fiancee.spouse = self;
    }
}

-(void) divorce: (Citizen *)spouse
{
    if (self.spouse)
    {
        self.single = YES;
        self.spouse = nil;
        [spouse divorce:self];
    }
}

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
