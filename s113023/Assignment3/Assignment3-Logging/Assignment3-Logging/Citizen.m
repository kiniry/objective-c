//
//  Citizen.m
//  Assignment3-Logging
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
    //Check preconditions are not violated:
    
    //Check if the entered name is either set to nil or an empty name was entered, this leads to an exception: Precondition violation.
    if (debug && (!name || [name isEqualToString:@""])){
        NSLog(@"Precondition violation: You didn't specify a name or specified an empty name");
    }
    //Check if the entered sex is either Male or Female, else give exception: Precondition violation.
    if (debug && (!([sex isEqualToString:@"Male"]||[sex isEqualToString:@"Female"]))){
        NSLog(@"Precondition violation: You must enter either 'Male' or 'Female' as sex");
    }
    //Check if the entered age is an integer (we dont want floats for age) and greater than or equal to zero.
    if (debug && (!((strcmp([age objCType], @encode(int))) == 0)||[age isLessThan:@0])){
        NSLog(@"Precondition violation: You must enter a positive integer as age");
    }
    
    //No preconditions are violated, we can now initialize the object and initialize its instance variables:
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
    if (debug && !(status == !self.spouse)){
        NSLog(@"Postcondition violation, the wrong value for whether the person was single or not was returned");
        return NO;
    }
    return (self.spouse ? @"NO" : @"YES");
}
- (void)addChild:(Citizen *)Achild
{
    //Check that child to be added are not an empty object
    if (debug && !Achild){
        NSLog(@"Precondition violation: You didn't specify a Citizen object to add as child");
        return;
    }
    if (debug && (self.father == Achild || self.mother == Achild)){
        NSLog(@"Precondition violation: You can't add your own mother or father as your child");
        return;
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
    if (debug && Aperson == nil){
        NSLog(@"Precondition violation: You didn't specify a person to check for marriage with");
        return NO;
    }
    BOOL result = [self.children indexOfObject:Aperson] == NSNotFound &&
    self.mother != Aperson &&
    self.father != Aperson &&
    self.sex != Aperson.sex &&
    !self.spouse &&
    !Aperson.spouse;
    
    // Check for violation of postconditions
    if (debug){
        if(!(!result || [self.children indexOfObject:Aperson])){
            NSLog(@"Postcondition violation: The result of the check was wrong since your children weren't read and checked correctly");
        }
        if(!(!result || self.mother != Aperson )){
            NSLog(@"Postcondition violation: The result of the check was wrong since your own mother wasn't read and checked correctly");
        }
        if(!(!result || self.father != Aperson)){
            NSLog(@"Postcondition violation: The result of the check was wrong since your own father wasn't read and checked correctly");
        }
        if(!(!result || self.sex != Aperson.sex)){
            NSLog(@"Postcondition violation: The result of the check was wrong since the check of whether your and your sweetheart had the same sex failed");
        }
        if(!(!result || [self.single isEqualToString:@"YES"])){
            NSLog(@"Postcondition violation: The result of the check was wrong since your own status wasn't read and checked correctly");
        }
        if(!(!result || [Aperson.single isEqualToString:@"YES"])){
            NSLog(@"Postcondition violation: The result of the check was wrong since your sweetheart's status wasn't read and checked correctly");
        }

    }
    return result;
}

- (void)marry:(Citizen *)Aperson
{
    if (debug && Aperson == nil){
        NSLog(@"Precondition violation: You (%@) didn't specify a person to marry (%@)",self.name,Aperson.name);
        return;
    }
    if (debug && ![self canMarry:Aperson])
    {
        NSLog(@"Precondition violation: You (%@) are not allowed to marry this person (%@)",self.name,Aperson.name);
    } else {
        //Legal marriage
        NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
    }
    if (debug && (self.spouse != Aperson || Aperson.spouse != self)){
        NSLog(@"Postcondition violation: Your own spouse should be %@ and your sweetheart's spouse should be %@",Aperson.name,self.name);
    }
}
- (void)divorce:(Citizen *)Aperson
{
    if (debug && !self.single){
        NSLog(@"Precondition violation: You are single and therefore you are unable to divorce this person");
    }
    if (debug && !(self.spouse == Aperson && Aperson.spouse == self)){
        NSLog(@"Precondition violation: You (%@) were never married to %@, and therefore not able to divorce him/her",self.name,Aperson.name);
    } else {
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    }
    if (debug && !([self.single isEqualToString:@"YES"] && [Aperson.single isEqualToString:@"YES"])){
        NSLog(@"Postcondition violation: You (%@) and your old spouse (%@) should both be single after the divorce",self.name,self.spouse.name);
    }
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
