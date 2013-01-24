//
//  Citizen.m
//  assignment2
//
//  Created by Anders Emil Nielsen on 10/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "Citizen.h"

@interface Citizen ()

@property (weak) Citizen *mother;
@property (weak) Citizen *father;
@property (readwrite) Citizen *spouse;

@end

@implementation Citizen

@synthesize children = _children,
            father   = _father,
            mother   = _mother,
            spouse   = _spouse;

-(Citizen *)initWithName:(NSString *)name
                  andSex:(SEX)sex
                  andAge:(NSNumber *)age

{
    self = [super init];

    if (self) {
        self.name = name;
        self.sex  = sex;
        self.age  = age;
    }

    return self;
}

-(void)marry:(Citizen *)sweetheart
{
    if (![self canMarry:sweetheart]) {
        NSLog(@"ERROR: Cannot marry own sex, marry parents or marry children");
        return;
    }
    self.spouse = sweetheart;
    sweetheart.spouse = self;
}

-(BOOL)canMarry:(Citizen *)sweetheart
{
    return [self single] &&
        [sweetheart single] &&
        self.sex != sweetheart.sex &&
        ![self.parents containsObject:sweetheart] &&
        ![self.children containsObject:sweetheart];
}

-(void)divorse
{
    if (!self.single) {
        self.spouse.spouse = nil;
        self.spouse = nil;
    }
}

-(void)setMother:(Citizen *)mother andFather:(Citizen *)father
{
    if (self.parents || mother.sex != female || father.sex != male) {
        NSLog(@"ERROR: Invalid parents %@ and %@ for child %@", mother, father, self);
        return;
    }
    self.mother = mother;
    self.father = father;
    [mother.children addObject:self];
    [father.children addObject:self];
}

-(NSArray *)parents
{
    if (self.mother == nil || self.father == nil) {
        return nil;
    }
    return @[self.mother, self.father];
}

-(NSMutableSet *)children
{
    if (!_children) _children = [[NSMutableSet alloc] init];
    return _children;
}

-(BOOL)single
{
    return self.spouse == nil;
}

-(NSString *)description
{
    return [NSString stringWithFormat:
            @"Citizen: name: %@, age: %@ years, sex: %@, civil status: %@, parents: %@ and %@, amount of children: %lu",
            self.name,
            self.age,
            self.sex == male ? @"Male" : @"Female",
            self.single ? @"single" : [NSString stringWithFormat:@"%s %@","married to",self.spouse.name],
            self.mother.name,
            self.father.name,
            self.children.count
    ];
}

@end
