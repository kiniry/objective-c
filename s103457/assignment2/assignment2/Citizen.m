//
//  Citizen.m
//  assignment2
//
//  Created by Anders Emil Nielsen on 10/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "Citizen.h"

@interface Citizen ()

@property (strong, nonatomic) Citizen *spouse;
@property (weak) Citizen *mother;
@property (weak) Citizen *father;
@property (strong, nonatomic) NSMutableSet *children;

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

-(NSSet *)children
{
    if (!_children) _children = [[NSMutableSet alloc] init];
    return (NSSet *)[_children mutableCopy];
}

-(void)makeChild:(Citizen *)child withParent:(Citizen *)otherParent
{
    if (child.parents || self.sex == otherParent.sex) {
        NSLog(@"ERROR: Invalid making of child");
        return;
    }
    [_children addObject:child];
    [self setAsParentFor:child];
    [otherParent setAsParentFor:child];
}

-(void)setAsParentFor:(Citizen *)child
{
    if (self.sex == male) [child setFather:self];
    else if (self.sex == female) [child setMother:self];
}

-(NSArray *)parents
{
    if (self.mother == nil || self.father == nil) {
        return nil;
    }
    return @[self.mother, self.father];
}

-(BOOL)isValidParents:(NSArray *)parents
{
    return parents.count == 2 ||
        ((Citizen *)[parents objectAtIndex:0]).sex != ((Citizen *)[parents objectAtIndex:1]).sex;
}

-(Citizen *)spouse
{
    return _spouse;
}

-(BOOL)single
{
    return self.spouse == nil;
}

-(NSString *)description
{
    return [NSString stringWithFormat:
            @"\nName: %@\nAge: %@ years\nSex: %@.\nCivil status: %@\nParents: %@ and %@\nAmount of children: %lu",
            self.name,
            self.age,
            self.sex == male ? @"Male" : @"Female",
            self.single ? @"single" : [NSString stringWithFormat:@"%s %@","married to",self.spouse.name],
            ((Citizen *)[self.parents objectAtIndex:0]).name,
            ((Citizen *)[self.parents objectAtIndex:1]).name,
            self.children.count
    ];
}

@end
