//
//  Citizen.m
//  assignment2
//
//  Created by Joseph Kiniry on 11/1/2013.
//  Copyright (c) 2013 Joseph Kiniry. All rights reserved.
//

#import "Citizen.h"
#import "assert.h"

//@interface Citizen ()
//@end

@implementation Citizen

- (Citizen*)init:(NSString *)a_name
             sex:(Sex)a_sex
             age:(ushort)an_age {
    self = [super init];
    self.name = a_name;
    self.sex = a_sex;
    self.age = an_age;
    self.children = [NSSet set];
    self.parents = [NSSet set];
    return self;
}

- (BOOL)canMarry:(Citizen*)fiance {
    return self.spouse == nil && self.sex != fiance.sex &&
      (![self.children containsObject:fiance]) &&
      (![self.parents containsObject:fiance]);
}

- (void)marry:(Citizen*)spouse {
    if ([self canMarry:spouse]) {
        self.spouse = spouse;
        spouse.spouse = self;
    }
}

- (void)divorce {
    self.spouse = nil;
}

- (BOOL)single {
    return self.spouse == nil;
}

- (BOOL)invariant {
    BOOL result = true;
    result &= [self.parents count] <= 2;
    result &= (!self.single ? (self.spouse.sex != self.sex &
                               self.spouse.spouse == self) : true);
    for (Citizen *child in self.children)
        result &= [child.parents containsObject:self];
    for (Citizen *parent in self.parents)
        result &= [parent.children containsObject:self];
    return result;
}

@end
