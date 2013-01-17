//
//  Citizen.m
//  Assignment3-Defensive
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "Citizen.h"

@interface Citizen()

@property(atomic,strong) NSString *name;
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
    if (!name || [name isEqualToString:@""]){
        NSException *nameException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You must specify a name!" userInfo:nil];
        @throw nameException;
    }
    //Check if the entered sex is either Male or Female, else give exception: Precondition violation.
    if (!([sex isEqualToString:@"Male"]||[sex isEqualToString:@"Female"])){
        NSException *sexException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"The sex must be either Male or Female" userInfo:nil];
        @throw sexException;
    }
    //Check if the entered age is an integer (we dont want floats for age) and greater than or equal to zero.
    if (!((strcmp([age objCType], @encode(int))) == 0)||[age isLessThan:@0]){
        NSException *ageException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"The age must be a positive integer" userInfo:nil];
        @throw ageException;
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
    return (self.spouse ? @"NO" : @"YES");
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
    if (Aperson == nil){
        NSException *emptySweetheart = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You didn't specify a sweetheart to check for marriage possibilities with" userInfo:nil];
        @throw emptySweetheart;
    }
    return [self.children indexOfObject:Aperson] == NSNotFound &&
    self.mother != Aperson &&
    self.father != Aperson &&
    self.sex != Aperson.sex &&
    !self.spouse &&
    !Aperson.spouse;
}

- (void)marry:(Citizen *)Aperson
{
    if (Aperson == nil){
        NSException *emptySweetheart = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You didn't specify a sweetheart to marry" userInfo:nil];
        @throw emptySweetheart;
    }
    if ([self canMarry:Aperson])
    {
        //Legal marriage
        NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
    } else {
        NSException *illegalMarriageException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You are not allowed to marry this person" userInfo:nil];
        @throw illegalMarriageException;
    }
}
- (void)divorce:(Citizen *)Aperson
{
    if (self.single){
        NSException *illegalDivorceException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You are single and therefore you are unable to divorce this person" userInfo:nil];
        @throw illegalDivorceException;
    }
    if (self.spouse == Aperson && Aperson.spouse == self){
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    } else {
        NSException *illegalDivorceException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You were never married to this person and therefore not able to divorce him/her" userInfo:nil];
        @throw illegalDivorceException;
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
- (NSString *)printInfo
{
    return [NSString stringWithFormat:@"\nName: %@, Sex: %@, Age: %@, Single?: %@, Children: %@ Parents: %@ & %@",self.name,self.sex,self.age,[self single],[self generateChildrenString],self.mother.name,self.father.name];
}

@end
