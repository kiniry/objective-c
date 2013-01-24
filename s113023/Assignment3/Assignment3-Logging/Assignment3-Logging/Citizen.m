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
        NSLog(@"You must specify a name!");
    }
    //Check if the entered sex is either Male or Female, else give exception: Precondition violation.
    if (debug && (!([sex isEqualToString:@"Male"]||[sex isEqualToString:@"Female"]))){
        NSLog(@"The sex must be either Male or Female");
    }
    //Check if the entered age is an integer (we dont want floats for age) and greater than or equal to zero.
    if (debug && (!((strcmp([age objCType], @encode(int))) == 0)||[age isLessThan:@0])){
        NSLog(@"The age must be a positive integer");
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
        NSLog(@"Postconditions violation: If you are single then you shoudn't have a spouse and if you have a spouse then you shoudn't be single");
        return @"ERROR";
    }
    return (self.spouse ? @"NO" : @"YES");
}
- (void)addChild:(Citizen *)Achild
{
    //Check that child to be added are not an empty object
    if (debug && !Achild){
        NSLog(@"Precondition violation: You must specify a child Citizen object to add");
        return;
    }
    //Check that the child to be added is not either your own mom or dad
    if (debug && (self.father == Achild || self.mother == Achild)){
        NSLog(@"Precondition violation: You are not allowed to add your own father or mother as your child");
        return;
    }
    //Check whether the child to be added already has a father
    if ([self.sex isEqualToString:@"Male"]){
        if (Achild.father == nil){
            [self.children addObject:Achild];
            Achild.father = self;
        }
        else if (debug){
            NSLog(@"The child already has a father");
            return;
        }
    }
    //Check whether the child to be added already has a mother
    if ([self.sex isEqualToString:@"Female"]){
        if (Achild.mother == nil){
            [self.children addObject:Achild];
            Achild.mother = self;
        }
        else if (debug){
            NSLog(@"The child already has a mother");
            return;
        }
    }
    if (debug && (!(Achild.mother == self || Achild.father == self) || [self.children containsObject:self])){
        NSLog(@"Postcondition violation: The child (%@) was not added correctly to parent (%@)",Achild.name,self.name);
    }
}


- (BOOL)canMarry:(Citizen *)Aperson
{
    // Check whether a valid Citizen was passed in
    if (debug && Aperson == nil){
        NSLog(@"Precondition violation: You didn't specify a sweetheart to check for marriage possibilities with");
        return NO;
    }
    
    BOOL isNoIncest = [self.children indexOfObject:Aperson] == NSNotFound && self.mother != Aperson && self.father != Aperson;
    BOOL isNoHomosexuality = self.sex != Aperson.sex;
    BOOL bothAreSingle = !self.spouse && !Aperson.spouse;
    BOOL result = isNoIncest && isNoHomosexuality && bothAreSingle;
    
    // Check for violation of postconditions
    if (debug && !isNoIncest){
        NSLog(@"Postcondition violation: A marriage is only possible if it leads to no incest: %@ and %@",self.name,Aperson.name);
    }
    if (debug && !isNoHomosexuality){
        NSLog(@"Postcondition violation: A marriage is only possible if the two persons have opposite sex: %@ and %@",self.name,Aperson.name);
    }
    if (debug && !bothAreSingle){
        NSLog(@"Postcondition violation: A marriage is only possible if the two persons are single: %@ and %@",self.name,Aperson.name);
    }
    return result;
}

- (void)marry:(Citizen *)Aperson
{
    // Check for violation of preconditions
    if (debug && Aperson == nil){
        NSLog(@"Precondition violation: You didn't specify a person to marry");
        return;
    }
    if (debug && (![self canMarry:Aperson] || ![Aperson canMarry:self]))
    {
        NSLog(@"Precondition violation, you (%@) and your sweetheart (%@) are not allowed to marry each other",self.name,Aperson.name);
    } else {
        //Legal marriage
        NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
        // Update properties
        self.spouse = Aperson;
        Aperson.spouse = self;
    }
    // Check for violations of postconditions
    if (debug && (self.spouse != Aperson || Aperson.spouse != self)){
        NSLog(@"Postcondition violation: Your spouse should be %@ and your sweetheart's spouse should be %@",Aperson.name,self.name);
    }
}
- (void)divorce:(Citizen *)Aperson
{
    // Check whether the Citizen asking for a divorce is single or not
    if (debug && !self.single){
        NSLog(@"Precondition violation: You are single and therefore not able to divorce anyone");
    }
    // Check whether the Citizen asking for a divorce and his/her spouse were ever married
    if (debug && !(self.spouse == Aperson && Aperson.spouse == self)){
        NSLog(@"Precondition violation: You were never married to this person and therefore not able to divorce him/her");
    } else {
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    }
    // Check postconditions
    if (debug && !([self.single isEqualToString:@"YES"] && [Aperson.single isEqualToString:@"YES"])){
        NSLog(@"Postcondition violation: You (%@) and your old spouse (%@) should both be single after the divorce",self.name,self.spouse.name);
    }
}
- (NSString *)generateChildrenString
{
    NSMutableString *childrenNames = [[NSMutableString alloc] init];
    
    // Get all children and return string with names
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
