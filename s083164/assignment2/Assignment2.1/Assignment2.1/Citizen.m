//
//  Citizen.m
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

//Running Xcode 4.4+ so no need to synthesize properties

-(Citizen *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName sex:(Sex)sex andAge:(NSNumber *)age
{
    self = [super init];
    
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _sex = sex;
        _age = age;
    }
    return self;
}

-(void)marry:(Citizen *)citizen
{
    //Can only get married if both are single
    if (self.isSingle && citizen.isSingle) {
        _spouse = citizen;
        citizen.spouse = self;
    }
}

-(void)divorce:(Citizen *)citizen
{
    // Can only get divorced if the citizen in the argument is the spouse
    if (_spouse == citizen) {
        _spouse = nil;
        citizen.spouse = nil;
    }
}

-(BOOL)isSingle
{
    return _spouse == nil;
}

-(void) addChild:(Citizen*) child
{
    if (!_children) _children = [[NSMutableSet alloc] init];
    
    if (_sex == male && child.father == nil) {
        child.father = self;
        [_children addObject:child];
    }else if(_sex == female && child.mother == nil){
        child.mother = self;
        [_children addObject:child];
    }
}

-(NSSet *) getChildren
{
    if (!_children) _children = [[NSMutableSet alloc] init];
    return (NSSet *)[_children mutableCopy];
}

-(NSString *) fullName
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
