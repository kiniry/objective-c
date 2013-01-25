//
//  BONCitizen.m
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import "BONCitizen.h"
#import "BONNoble.h"

@implementation BONCitizen
@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize hasSpouse = _hasSpouse;
@synthesize spouse = _spouse;
@synthesize hasChildren = _hasChildren;
@synthesize children = _children;
@synthesize parent1 = _parent1;
@synthesize parent2 = _parent2;

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
                                NSLog(@"%@",self.spouse.name);
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