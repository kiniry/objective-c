//
//  Citizen.m
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import "Citizen.h"

@interface Citizen()

@property NSString *name;
@property int age;
@property Citizen *spouse;
@property gender sex;

@property (weak) Citizen *father;
@property (weak) Citizen *mother;
@property NSSet * children;

@end

@implementation Citizen

- (id) initWithName:(NSString *)name Age:(int) age Sex:(gender) sex Children: (NSSet *) children
{
    self = [super init];
    if(self) {
        _name = name;
        _age = age;
        _sex = sex;
        
        _children = [children copy];
        
        // Assign "self" as parent for the child. (Unless child already has given parent)
        for(Citizen * child in _children) {
            if (![child isKindOfClass:[Citizen class]]) {
                return nil;
            }
            
            if(_sex == M) {
                if(child.father == nil) {
                    child.father = self;
                } else {
                    return nil;
                }
            } else {
                if(child.mother == nil) {
                    child.mother = self;
                } else {
                    return nil;
                }
            }
        }
        
    }
    
    return self;
}


// Queries

- (NSString *) getName;
{
    return self.name;
}

- (int) getAge;
{
    return self.age;
}

- (BOOL) isSingle;
{
    return self.spouse == nil;
}

- (Citizen *) getSpouse;
{
    return self.spouse;
}

- (gender) getGender
{
    return self.sex;
}

// Commands

- (BOOL) marry: (Citizen *) person
{
    if([person getGender] != [self getGender] && [self isSingle] && [person isSingle]) {
        // Let these two people be united in whatever faith they believe in.
        [person setSpouse:self];
        self.spouse = person;
        return YES;
    }
    
    return NO;
}


- (BOOL) divorce
{
    if(self.isSingle != YES) {
        // Out of the door, now!
        [self.spouse setSpouse:nil];
        self.spouse = nil;
        return YES;
    }
    
    return NO;
}


// Description
- (NSString *) description
{
    // Don't output "self.spouse" here, that'll just result in an infinite loop.
    return [NSString stringWithFormat:@"Name: %@; age: %i; gender: %@; Spouse: %@; Father: %@; Mother: %@", self.name, self.age, self.sex == M ? @"M" : @"F", [self.spouse getName], [self.father getName], [self.mother getName]];
}


@end
