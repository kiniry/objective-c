//
//  Citizen.m
//  Assignment3-Assertion
//
//  Created by Andreas Haure on 17/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "Citizen.h"

@interface Citizen()

@property(atomic,strong) NSString *sex;
@property(atomic,strong) NSNumber *age;
@property(atomic,strong) Citizen *spouse;
@property(atomic,strong) NSMutableArray *children;
@property(nonatomic,strong)Citizen *mother;
@property(nonatomic,strong)Citizen *father;

@end

@implementation Citizen

- (Citizen *)initWithName:(NSString *)name
                  withSex:(NSString *)sex
                  withAge:(NSNumber *)age
{
    self = [super init];
    if (self)
    {
        _name = name;
        _sex = sex;
        _age = age;
        _children = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSString* )single{
    BOOL status = !self.spouse;
    NSAssert(status == !self.spouse, @"Postcondition violation, the wrong value for whether the person was single or not was returned");
    return (status ? @"YES" : @"NO");
}
- (void)addChild:(Citizen *)Achild
{
    //Check that child to be added are not an empty object
    if (Achild == nil){
        NSException *emptyChildException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You must specify a child Citizen object to add" userInfo:nil];
        @throw emptyChildException;
    }
    if ([self.sex isEqualToString:@"Male"]){
        if (Achild.father == nil){
            [self.children addObject:Achild];
            Achild.father = self;
            
        }
        else {
            NSLog(@"The child already has a father");
            return;
        }
    }
    if ([self.sex isEqualToString:@"Female"]){
        if (Achild.mother == nil){
            [self.children addObject:Achild];
            Achild.mother = self;
        }
        else {
            NSLog(@"The child already has a mother");
            return;
        }
    }
}


- (BOOL)canMarry:(Citizen *)Aperson
{
    // Check for violation of preconditions
    NSAssert(Aperson,@"Precondition violation, you didn't specify a Citizen object to check for marriage possibilities with");
    
    BOOL result = [self.children indexOfObject:Aperson] == NSNotFound &&
    self.mother != Aperson &&
    self.father != Aperson &&
    self.sex != Aperson.sex &&
    !self.spouse &&
    !Aperson.spouse;
    
    // Check for violation of postconditions
    NSAssert(!result || [self.children indexOfObject:Aperson], @"Postcondition violation: The result of the check was wrong since your children weren't read and checked correctly");
    NSAssert(!result || self.mother != Aperson,@"Postcondition violation: The result of the check was wrong since your own mother wasn't read and checked correctly");
    NSAssert(!result || self.father != Aperson,@"Postcondition violation: The result of the check was wrong since your own father wasn't read and checked correctly");
    NSAssert(!result || self.sex != Aperson.sex,@"Postcondition violation: The result of the check was wrong since the check of whether your and your sweetheart had the same sex failed");
    NSAssert(!result || [self.single isEqualToString:@"YES"],@"Postcondition violation: The result of the check was wrong since your own status wasn't read and checked correctly");
    NSAssert(!result || [Aperson.single isEqualToString:@"YES"],@"Postcondition violation: The result of the check was wrong since your sweetheart's status wasn't read and checked correctly");
    
    return result;
}

- (void)marry:(Citizen *)Aperson
{
    // Check for violation of preconditions
    NSAssert(Aperson,@"Precondition violation, you didn't specify a Citizen object to marry");
    NSAssert([self canMarry:Aperson], @"Precondition violation, you yourself are not allowed to marry this person");
    NSAssert([Aperson canMarry:self], @"Precondition violation, your sweetheart are not allowed to marry you");
    
    //Legal marriage
    NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
    // Update properties
    self.spouse = Aperson;
    Aperson.spouse = self;
    
    // Check for violation of postconditions
    NSAssert(self.spouse == Aperson, @"Postcondition violation, your sweetheart were not set correctly as your spouse");
    NSAssert(Aperson.spouse == self, @"Postcondition violation, you yourself were not set correctly as your sweetheart's spouse");
}
- (void)divorce:(Citizen *)Aperson
{
    // Check preconditions
    NSAssert([self.single isEqualToString:@"YES"],@"Precondition violation: You are single and therefore not able to divorce anyone");
    if (self.spouse == Aperson && Aperson.spouse == self){
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    } else {
        NSLog(@"You were never married to this person and therefore not able to divorce him/her");
    }
    
    // Check postconditions
    NSAssert([self.single isEqualToString:@"YES"],@"Postcondition violation: You yourself were not set correctly as single after the divorce");
    NSAssert([Aperson.single isEqualToString:@"YES"],@"Postcondition violation: Your old spouse were not set correctly as single after the divorce");
}
- (NSString *)generateChildrenString
{
    NSMutableString *childrenNames = [[NSMutableString alloc] init];
    
    // Get all children
    for (Citizen * childObject in self.children)
    {
        if (childObject.name){
            [childrenNames appendString:[NSString stringWithFormat:@"%@, ",childObject.name]];
        }
    }
    return childrenNames;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"\nName: %@, Sex: %@, Age: %@, Single?: %@, Children: %@ Parents: %@ & %@, Spouse: %@",self.name,self.sex,self.age,[self single],[self generateChildrenString],self.mother.name,self.father.name,self.spouse.name];
}

@end
