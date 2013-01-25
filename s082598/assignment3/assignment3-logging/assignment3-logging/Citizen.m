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
        
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] &&
           (!name || [name isEqualToString:@""]))
            NSLog(@"Citizen Init Failure: No name given");
        
        self.name = name;
        
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] &&
           sex != male && sex != female)
            NSLog(@"Citizen Init Failure: No sex argument is invalid");
        
        self.sex = sex;
        
        if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && age < 0)
            NSLog(@"Citizen Init Failure: age cannot be negative");
        
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
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !father){
        NSLog(@"Citizen setFather: argument (father) cannot be nil");
        return;
    }
    
    // if farther is already set to the right citizen, do nothing
    if (_father == father)
        return;
    
    // father can only be set once
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && _father){
        NSLog(@"Citizen setFather: father is already set");
        return;
    }
    
    _father = father;
    
    // make sure to list our self as child of father
    [father parentToCitizen:self];
}

- (void) setMother:(Citizen *)mother
{
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !mother){
        NSLog(@"Citizen setMother: argument (mother) cannot be nil");
        return;
    }

    // if mother is already set to the right citizen, do nothing
    if (_mother == mother)
        return;
    
    // mother can only be set once
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && _mother){
        NSLog(@"Citizen setMother: mother is already set");
        return;
    }
    
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
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !child){
        NSLog(@"Citizen parentToCitizen: argument (child) cannot be nil");
        return;
    }
    
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
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !sweetheart){
        NSLog(@"Citizen impedimentToMarriageWith: argument (sweetheart) cannot be nil");
        return YES;
    }
    
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
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && !sweetheart){
        NSLog(@"Citizen marryCitizen: argument (sweetheart) cannot be nil");
        return;
    }
    
    // if alredy married to sweetheart, do nothing
    if(self.spouse == sweetheart)
        return;
    
    // only marry if not impediment to marriage
    if([[NSUserDefaults standardUserDefaults] integerForKey:@"logging"] && [self impedimentToMarriageWith:sweetheart]){
        NSLog(@"Citizen marryCitizen: %@ and %@ is Impediment To Marriage", self.name ,sweetheart.name);
        return;
    }

    self.spouse = sweetheart;
    
    // if already sweatharts spouse, end here
    if(sweetheart.spouse == self)
        return;
    
    // make sure to also be sweatharts spouse
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
