//
//  CitizenSuperClass.m
//  Assignment3
//
//  Created by user on 1/21/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "CitizenSuperClass.h"

@implementation CitizenSuperClass

- (CitizenSuperClass *)initWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _sex = sex;
        _age = &age;
    }
    NSLog(@"initialized with name: %@, sex: %@, age %i", name, sex, age);
    return self;
}
- (BOOL)single{
    return (self.spouse == nil);
}

- (BOOL)impedimentToMarriage:(CitizenSuperClass *)aSpouse{
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

- (void)marry:(CitizenSuperClass *)imminentSpouse{
    if ( ![self impedimentToMarriage:imminentSpouse] ){
        NSLog(@"%@ is marrying %@", self.description, imminentSpouse.description);
        self.spouse = imminentSpouse;
    }
}

- (void)divorce:(CitizenSuperClass *)spouse{
    NSLog(@"Divorcing scumbag spouse");
    self.spouse = nil;
    self.spouse.spouse = nil;
}

// Overriding description for debugging.
- (NSString *)description {
    return [NSString stringWithFormat:@"Citizen = name: %@, sex : %@, age : %i years", self.name, self.sex, [[NSNumber numberWithInteger:*(self.age)] intValue] ];
}

@end

