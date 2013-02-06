//
//  Person.m
//  Assignment5
//
//  Created by Philip Nielsen on 22/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)name age:(int)age assests:(double)assets
{
    self = [super init];
    
    if (self) {
        _name = name;
        _age = age;
        _assets = assets;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@, Age: %i, Assets: %f", self.name, self.age, self.assets];
}

@end
