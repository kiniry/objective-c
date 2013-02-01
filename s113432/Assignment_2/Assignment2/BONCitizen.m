//
//  BONCitizen.m
//  BONCITIZEN
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/21/13.
//  Copyright (c) 2013 Bastian Buch, s113432, and Jacob Gjerstrup, s113440. All rights reserved.
//

#import "BONCitizen.h"
#import "BONNoble.h"

@implementation BONCitizen

// At first, all properties are synthesized.
@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize hasSpouse = _hasSpouse;
@synthesize spouse = _spouse;
@synthesize hasChildren = _hasChildren;
@synthesize children = _children;
@synthesize parent1 = _parent1;
@synthesize parent2 = _parent2;

// The next part is the lazy instantiation of the getters and setters
// of the various properties
+ (id) create {
    return [[self alloc] init];
}

- (BONCitizen *)spouse {
    if (!_spouse){
        _spouse = [[BONCitizen alloc]init];
    }
    return _spouse;
}

- (NSString *)sex {
    if (!_sex){
        _sex= [[NSString alloc]init];
    }
    return _sex;
}

- (BONCitizen *)parent1 {
    if (!_parent1){
        _parent1 = [[self.class alloc]init];
    }
    return _parent1;
}

- (BONCitizen *)parent2 {
    if (!_parent2){
        _parent2 = [[self.class alloc]init];
    }
    return _parent2;
}

- (id)init {
    self = [super init];
    return self;
}

// The marry function takes one argument, the person the citizen is supposed to marry.
// It then proceeds to check if the person the citizen is marrying is a child, if you
// are married already, if your comming spouse is married, if you are his/her parent,
// if he/she is your parent, and if he/she is the same class - that is, has the same
// civil status - as you do, and it does so in that order. If it passes all these checks,
// you are allowed to marry and as such, the input civilian is set to be your spouse and
// you are set to be his/her spouse and the function then returns "true" to register that
// the persons have actually married.

- (bool) marry:(BONCitizen *)personToMarry{
    if (![personToMarry.sex isEqualToString: self.sex]){
        if (personToMarry.age > 18) {
            if (!self.hasSpouse) {
                if (!personToMarry.hasSpouse) {
                    if (![personToMarry.parent1.name isEqualToString: self.name] && ![personToMarry.parent2.name isEqualToString: self.name] && ![self.parent1.name isEqualToString: personToMarry.name] && ![self.parent2.name isEqualToString: personToMarry.name]){
                        if (![self.parent1.name isEqualToString: personToMarry.parent1.name] && ![self.parent2.name isEqualToString: personToMarry.parent2.name] && ![self.parent1.name isEqualToString: personToMarry.parent2.name] && ![self.parent2.name isEqualToString: personToMarry.parent2.name]){
                            if (self.class == personToMarry.class){
                                self.spouse = personToMarry;
                                self.hasSpouse = YES;
                                personToMarry.spouse = self;
                                personToMarry.hasSpouse = YES;
                                return YES;
                            }
                        }
                    }
                }
            }
        }
    }
    return NO;
}


// Divorce checks if the person that calls the function actually has a spouse.
// If the person does have that, the spouse's spouse is converted to a null-pointer,
// and the spouse's spouse is set to have no spouse. Then we repeat the process for
// the citizen himself. Finally, the function returns true to show that the divorce
// has gone through.

- (bool) divorce{
    if (self.hasSpouse){
        self.spouse.spouse = nil;
        self.spouse.hasSpouse = NO;
        self.spouse = nil;
        self.hasSpouse = NO;
        return true;
    }
    return false;
}
@end