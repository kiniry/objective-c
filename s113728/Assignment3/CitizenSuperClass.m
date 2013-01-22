//
//  CitizenSuperClass.m
//  Assignment3
//
//  Created by user on 1/21/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "CitizenSuperClass.h"

@implementation CitizenSuperClass

// no requirements or ensurements here in superclass
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
// requires single() and !impedimentToMarriage()
// ensures imminentSpouse.spouse == self
- (void)marry:(CitizenSuperClass *)imminentSpouse{
    [self impedimentToMarriage:imminentSpouse];
    self.spouse = imminentSpouse;
    imminentSpouse.spouse = self;
    NSAssert(self == imminentSpouse.spouse, @"Postcondition for marriage not satisfied");
}
// Asserts the preconditions for marriage from marry()
- (void)impedimentToMarriage:(CitizenSuperClass *)aSpouse{
    NSAssert(   self.single
             && self != aSpouse
             && ![self.children containsObject:aSpouse]
             && ![self.parents containsObject:aSpouse]
             && ![aSpouse.sex isEqualToString:self.sex], @"Precondition for marriage not satisfied");
   }
- (BOOL)single{
    return (self.spouse == nil);
}
// requires self.spouse == spouse
// ensures self.spouse == nil && spouse.spouse == nil
- (void)divorce:(CitizenSuperClass *)spouse{
    NSAssert(self.spouse == spouse, @"precondition for divortion not satisfied");
    self.spouse = nil;
    self.spouse.spouse = nil;
    NSAssert(self.spouse == nil && self.spouse.spouse == nil, @"postcondition for divortion not satisfied");
}

// Overriding description for debugging.
- (NSString *)description {
    return [NSString stringWithFormat:@"Citizen = name: %@, sex : %@, age : %i years", self.name, self.sex, [[NSNumber numberWithInteger:*(self.age)] intValue] ];
}

@end

