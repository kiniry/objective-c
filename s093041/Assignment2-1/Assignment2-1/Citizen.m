//
//  Citizen.m
//  Assignment2
//
//  Created by Philip Nielsen on 14/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age
{
    return [self initWithName:name sex:sex age:age parents:nil];
}

- (id)initWithName:(NSString *)name sex:(Sex)sex age:(int)age parents:(NSArray *)parents;
{
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _age = age;
        _parents = parents;
    }
    return self;
}

- (BOOL)single {
    return self.spouse ? NO : YES;
}

- (void)marryToCitizen:(Citizen *)newSpouse;
{
    // Already married
    if (self.spouse) return;
    
    // Check sexuality
    if (self.sex == newSpouse.sex) {
        NSLog(@"Marriage of same sex not allowed");
        return;
    }
    
    // Check parents
    for (Citizen *parent in self.parents) {
        if ([newSpouse isEqualTo:parent]) {
            NSLog(@"Marriage not allowed: %@ is a parent of %@", parent, self);
            return;
        }
    }
    
    // Check children
    for (Citizen *child in self.children) {
        if ([newSpouse isEqualTo:child]) {
            NSLog(@"Marriage not allowed: %@ is a child of %@", child, self);
            return;
        }
    }
    
    // Legal marriage
    _spouse = newSpouse;
    if (!self.spouse.spouse) [self.spouse marryToCitizen:self];
    NSLog(@"New marriage between %@ and %@", self, self.spouse);
}

- (void)divorce
{
    _spouse = nil;
    NSLog(@"%@ is now single", self.name);
}

- (void)setChildren:(NSArray *)children
{
    // Check that all children has self as parent
    for (Citizen *child in children) {
        // This child does not have self as parent => abort
        if (!child.parents || [child.parents indexOfObject:self] == NSNotFound) {
            NSLog(@"%@ does not have %@ as parent", child, self);
            return;
        }
    }
    // All children have self as parent => update ivar
    _children = children;
}

- (void)setParents:(NSArray *)parents
{
    // Only two parents
    if (parents.count > 2) return;
    _parents = parents;
}

/** Custom comparison
 @param object Other object to compare to
 @return Returns a Boolean value that indicates whether the receiver is equal to the other given object
 */
- (BOOL)isEqualTo:(id)object
{
    if (![object isKindOfClass:[Citizen class]]) return NO;
    Citizen *otherCitizen = (Citizen *)object;
    return [self.name isEqualTo:otherCitizen.name] && self.age == otherCitizen.age && self.sex == otherCitizen.sex;
}

/** Custom description returning the name of the Citizen
 */
- (NSString *)description
{
    return self.name;
}

@end
