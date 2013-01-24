//
//  Citizen.m
//  assignment2
//
//  Created by Jonas Eriksen on 18/01/13.
//  Copyright (c) 2013 s082598. All rights reserved.
//

#import "Citizen.h"

@interface Citizen ()

@property (retain, readwrite) Citizen *spouse;
@property (nonatomic, retain, readwrite) NSSet *children;

@end

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize spouse = _spouse;
@synthesize mother = _mother;
@synthesize father = _father;
@synthesize children = _children;


- (id) initWithName:(NSString *)name withSex:(Sex)sex withAge:(int)age
{
    self = [super init];
    if(self){
        
        NSAssert(name && ![name isEqualToString:@""], @"No name given");
        self.name = name;
        NSAssert([name isEqualToString:name], @"name was not set properly");
        
        NSAssert(sex == male || sex == female, @"No sex given");
        self.sex = sex;
        NSAssert(self.sex == sex, @"sex was not set properly");
        
        NSAssert(age >= 0, @"age has to be possitive");
        self.age = age;
        NSAssert(self.age == age, @"age was not set properly");
    }
    
    return self;
}

- (BOOL)single
{
    // return true if spouse is not nil otherwise return false
    if(self.spouse == nil){
        return YES;
    }
    return NO;
}

- (void) setFather:(Citizen *)father
{
    NSAssert(father, @"argument (father) cannot be nil");
    
    // if farther is already set to the right citizen, do nothing
    if (_father == father)
        return;
    
    // father can only be set once
    NSAssert(!_father, @"father is already set");
    
    _father = father;
    NSAssert(_father == father, @"father was not set properly");
    // make sure to list our self as child of father
    [father parentToCitizen:self];
    NSAssert([father.children member:self] != 0, @"was not correctly set as child of father");
}

- (void) setMother:(Citizen *)mother
{
    NSAssert(mother, @"argument (mother) cannot be nil");

    // if mother is already set to the right citizen, do nothing
    if (_mother == mother)
        return;
    
    // mother can only be set once
    NSAssert(!_mother, @"mother is already set");
        
    _mother = mother;
    NSAssert(_mother == mother, @"mother was not set properly");
    // make sure to be listed as child of mother
    [mother parentToCitizen:self];
    NSAssert([mother.children member:self] != 0, @"was not correctly set as child of mother");

}

- (NSSet *) parents
{
    // make sure to return an empty list if mother and father is not set
    // make sure not to end set too early
    if(!self.mother)
        return [NSSet setWithObjects: self.father, nil];
    
    return [NSSet setWithObjects: self.mother, self.father, nil];
}

- (void) parentToCitizen:(Citizen *)child
{
    NSAssert(child, @"argument (child) cannot be nil");
    
    if(!_children){
        // lazy init
        _children = [[NSSet alloc] initWithObjects:child, nil];
    }else{
        _children = [_children setByAddingObject:child];
    }
    NSAssert([_children member:child] != 0, @"child was not properly added");
        
    // add self as parent to child
    if(self.sex == male){
        child.father = self;
        NSAssert(child.father == self, @"was not correctly set at father for child");
    }else{
        child.mother = self;
        NSAssert(child.mother == self, @"was not correctly set at mother for child");
    }
   
}

- (NSSet *) children
{
    // lazy init, make sure to always return a NSSet and not nil
    if(!_children)
        _children = [[NSSet alloc] init];
    
    return _children;
}


- (BOOL) impedimentToMarriageWith:(Citizen *)sweetheart
{
    NSAssert(sweetheart, @"argument (sweathart) cannot be nil");
    
    // sweathart cannot be nil
    if(sweetheart == nil){
        return YES;
    }
    // sweathart cannot be a child of self
    if([self.children containsObject:sweetheart]){
        return YES;
    }
    // sweathart cannot be parrent to self
    if([self.parents containsObject:sweetheart]){
        return YES;
    }
    // sweathart cannot be same sex as self
    if(self.sex == sweetheart.sex){
        return YES;
    }

    return NO;
}

- (void) marryCitizen:(Citizen *)sweetheart
{
    NSAssert(sweetheart, @"argument (sweetheart) cannot be nil");
    
    // if alredy married to sweetheart, do nothing
    if(self.spouse == sweetheart)
        return;
    
    // only marry if not impediment to marriage
    NSAssert(![self impedimentToMarriageWith:sweetheart], @"%@ and %@ is Impediment To Marriage", self.name ,sweetheart.name);
    
    self.spouse = sweetheart;
    NSAssert(self.spouse == sweetheart, @"sweetheart was not properly set");
    
    // if already sweatharts spouse, end here
    if(sweetheart.spouse == self)
        return;
    
    // make sure to also be sweatharts spouse
    [sweetheart marryCitizen:self];
    NSAssert(sweetheart.spouse == self, @"was not correctly set as spouse of sweetheart");
}

- (void) divorce
{
    Citizen *ex_spouse = self.spouse;
    self.spouse = nil;
    NSAssert(!self.spouse && self.single, @"spouse was not set to nil");
    // make sure ex is also diverced
    if(ex_spouse.spouse == self)
        [ex_spouse divorce];
    
    NSAssert(!ex_spouse.spouse && ex_spouse.single, @"ex_spouse spouse was not set to nil");
}

@end
