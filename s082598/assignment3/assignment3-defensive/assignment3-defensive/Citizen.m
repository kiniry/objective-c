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
        // throw exception if argument is invalid
        if(!name || [name isEqualToString:@""])
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"No name given" userInfo:nil];
        
        self.name = name;
        
        if(sex != male && sex != female)
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"No sex given" userInfo:nil];
        
        self.sex = sex;
        
        if(age < 0)
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Age has to be positive" userInfo:nil];
        
        self.age = age;
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
    // if farther is nil throw exception
    if(!father)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"father cannot be nil" userInfo:nil];
    
    // if farther is already set to the right citizen, do nothing
    if (_father == father)
        return;
    
    // father can only be set once
    if(_father)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"father is already set" userInfo:nil];
    
    _father = father;
    // make sure to list our self as child of father
    [father parentToCitizen:self];
}

- (void) setMother:(Citizen *)mother
{    
    // if mother is nil throw exception
    if(!mother)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"mother cannot be nil" userInfo:nil];

    // if mother is already set to the right citizen, do nothing
    if (_mother == mother)
        return;
    
    // mother can only be set once
    if(_mother)
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"mother is already set" userInfo:nil];
        
    _mother = mother;
    // make sure to be listed as child of mother
    [mother parentToCitizen:self];
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
    // if child is nil throw exception
    if(!child)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"child cannot be nil" userInfo:nil];
    
    if(!_children){
        // lazy init
        _children = [[NSSet alloc] initWithObjects:child, nil];
    }else{
        _children = [_children setByAddingObject:child];
    }
        
    // add self as parent to child
    if(self.sex == male){
        child.father = self;
    }else{
        child.mother = self;
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
    if(!sweetheart)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"sweetheart canno be nil" userInfo:nil];
    
    // sweetheart cannot be nil
    if(sweetheart == nil){
        return YES;
    }
    // sweetheart cannot be a child of self
    if([self.children containsObject:sweetheart]){
        return YES;
    }
    // sweetheart cannot be parrent to self
    if([self.parents containsObject:sweetheart]){
        return YES;
    }
    // sweetheart cannot be same sex as self
    if(self.sex == sweetheart.sex){
        return YES;
    }

    return NO;
}

- (void) marryCitizen:(Citizen *)sweetheart
{
    if(!sweetheart)
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"sweetheart canno be nil" userInfo:nil];
    
    // if alredy married to sweetheart, do nothing
    if(self.spouse == sweetheart)
        return;
    
    // only marry if impediment to marriage
    if([self impedimentToMarriageWith:sweetheart])
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Impediment To Marriage" userInfo:nil];
    
    self.spouse = sweetheart;
    
    // if already sweetheart spouse, end here
    if(sweetheart.spouse == self)
        return;
    
    // make sure to also be sweetheart spouse
    [sweetheart marryCitizen:self];
}

- (void) divorce
{
    Citizen *ex_spouse = self.spouse;
    self.spouse = nil;
    // make sure ex is also diverced
    if(ex_spouse.spouse == self)
    [ex_spouse divorce];
}

@end
