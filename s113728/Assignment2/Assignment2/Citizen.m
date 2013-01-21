//
//  Citizen.m
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;

- (Citizen *)initWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.sex = sex;
        self.age = &age;
    }
    NSLog(@"initialized with name: %@, sex: %@, age %i", name, sex, age);
    return self;
}

- (BOOL)single{
    return (self.spouse == nil);
}

- (BOOL)impedimentToMarriage:(Citizen *)aSpouse{
    if (aSpouse != self
        && self.single
        && ![self.children containsObject:aSpouse]
        && ![self.parents containsObject:aSpouse])
        // TODO figure out how to check spouse gender
        //&& [self.sex != aSpouse.]
        {
            NSLog(@"Ready to marry");
            return YES;
        }
    else return NO;
}

- (void)marry:(Citizen *)imminentSpouse{
    if ( ![self impedimentToMarriage:imminentSpouse] ){
        NSLog(@"%@ is marrying %@", self.description, imminentSpouse.description);
        self.spouse = imminentSpouse;
    }
}

- (void)divorce:(Citizen *)spouse{
    NSLog(@"Divorcing scumbag spouse");
    self.spouse = nil;
    [spouse divorce:self];
}

// Overriding description for debugging.
- (NSString *)description {
    return [NSString stringWithFormat:@"Citizen = name: %@, sex : %@, age : %i years", self.name, self.sex, [[NSNumber numberWithInteger:*(self.age)] intValue] ];
}

@end    
