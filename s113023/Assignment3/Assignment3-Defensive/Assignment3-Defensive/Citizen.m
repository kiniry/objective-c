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
    //Check whether child object is empty (nil) if this is the case, throw an exception
    if (Achild == nil){
        NSException *noChildException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You didn't specify a child to be added" userInfo:nil];
        @throw noChildException;
    }
    [self.children addObject:Achild];
}
- (void)setMother:(Citizen *)Amother
{
    //Check whether a Citizen has been specified as potential mother
    if (Amother == nil){
        NSException *emptyMotherException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You didn't specify a mother to be added" userInfo:nil];
        @throw emptyMotherException;
    }
    //Check whether the potential mother has the correct sex
    if (!([Amother.sex isEqualToString:@"Female"])){
        NSException *motherHasWrongSexException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"The specified citizen can't be a mother since it's a Male" userInfo:nil];
        @throw motherHasWrongSexException;
    }
    //Check whether the citizen himself/herself don't already have a mother
    if (!(self.mother == nil)){
        NSException *tooManyMothersException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can only specify one mother per Citizen" userInfo:nil];
        @throw tooManyMothersException;
    }
    _mother = Amother;
    
}
- (void)setFather:(Citizen *)Afather
{
    //Check whether a Citizen has been specified as potential father
    if (Afather == nil){
        NSException *emptyFatherException = [NSException exceptionWithName:NSInvalidArgumentException reason:@"You didn't specify a father to be added" userInfo:nil];
        @throw emptyFatherException;
    }
    //Check whether the potential father has the correct sex
    if (!([Afather.sex isEqualToString:@"Male"])){
        NSException *fatherHasWrongSexException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"The specified citizen can't be a father since it's a Female" userInfo:nil];
        @throw fatherHasWrongSexException;
    }
    //Check whether the citizen himself/herself don't already have a father
    if (!(self.father == nil)){
        NSException *tooManyFathersException = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"You can only specify one father per Citizen" userInfo:nil];
        @throw tooManyFathersException;
    } 
    _father = Afather;
    
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
    }
    if (self.spouse == Aperson && Aperson.spouse == self){
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    } else {
        NSLog(@"The divorce is not possible since the two persons were never married");
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
