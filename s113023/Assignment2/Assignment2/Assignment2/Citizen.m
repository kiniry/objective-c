//
//  Citizen.m
//  Assignment2
//
//  Created by Andreas Haure on 10/01/13.
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
    self = [super init];
    if (self)
    {
        self.name = name;
        self.sex = sex;
        self.age = age;
        self.children = [[NSMutableArray alloc] init];
    }
    return self;
}
- (NSString* )single{
    return (self.spouse ? @"NO" : @"YES");
}
- (void)addChild:(Citizen *)Achild
{
    [self.children addObject:Achild];
}
- (void)setMother:(Citizen *)Amother
{
    if (self.mother == nil && [Amother.sex isEqualToString:@"Female"]){
        _mother = Amother;
    } else {
        NSLog(@"The person already has a mother");
    }
    
}
- (void)setFather:(Citizen *)Afather
{
    if (self.father == nil && [Afather.sex isEqualToString:@"Male"]){
        _father = Afather;
    } else {
        NSLog(@"The person already has a father");
    }
}

- (void)marryCitizen:(Citizen *)Aperson
{
    if (    [self.children indexOfObject:Aperson] == NSNotFound &&
            self.mother != Aperson &&
            self.father != Aperson &&
            self.sex != Aperson.sex &&
            !self.spouse    )
    {
        //Legal marriage
        NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
    } else {
        //Not legal marriage
        NSLog(@"Not a legal marriage - leads to incest or homosexuality or polygyni");
    }
}
- (void)divorceCitizen:(Citizen *)Aperson
{
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