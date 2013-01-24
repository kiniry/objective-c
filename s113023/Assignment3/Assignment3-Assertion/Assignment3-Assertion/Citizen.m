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
    //Check preconditions are not violated:
    
    //Check if legal name is entered
    NSAssert(name && ![name isEqualToString:@""],@"You must specify a name!");
    //Check if the entered sex is either Male or Female
    NSAssert([sex isEqualToString:@"Male"] || [sex isEqualToString:@"Female"], @"The sex must be either Male or Female");
    //Check if the entered age is an integer (we dont want floats for age) and greater than or equal to zero.
    NSAssert(((strcmp([age objCType], @encode(int))) == 0) && [age isGreaterThanOrEqualTo:@0], @"The age must be a positive integer");
           
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
    // Check if postcondition has been violated
    NSAssert((status && !self.spouse)||(!status && self.spouse),@"Postconditions violation: If you are single then you shoudn't have a spouse and if you have a spouse then you shoudn't be single");
    return (status ? @"YES" : @"NO");
}
- (void)addChild:(Citizen *)Achild
{
    //Check that child to be added are not an empty object
    NSAssert(Achild,@"Precondition violation: You must specify a child Citizen object to add");
    //Check that the child to be added is not either your own mom or dad
    NSAssert(!(self.father == Achild || self.mother == Achild),@"Precondition violation: You are not allowed to add your own father or mother as your child");
    //Check whether the child to be added already has a father
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
    //Check whether the child to be added already has a mother
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
    //Check that the child was added correctly
    NSAssert((Achild.mother == self || Achild.father == self) || [self.children containsObject:self],@"Postcondition violation: The child (%@) was not added correctly to parent (%@)",Achild.name,self.name);
}


- (BOOL)canMarry:(Citizen *)Aperson
{
    // Check whether a valid Citizen was passed in
    NSAssert(Aperson,@"Precondition violation: you didn't specify a Citizen object to check for marriage possibilities with");
    
    BOOL isNoIncest = [self.children indexOfObject:Aperson] == NSNotFound && self.mother != Aperson && self.father != Aperson;
    BOOL isNoHomosexuality = self.sex != Aperson.sex;
    BOOL bothAreSingle = !self.spouse && !Aperson.spouse;
    BOOL result = isNoIncest && isNoHomosexuality && bothAreSingle;
    
    // Check for violation of postconditions
    NSAssert(isNoIncest,@"Postcondition violation: A marriage is only possible if it leads to no incest");
    NSAssert(isNoHomosexuality,@"Postcondition violation: A marriage is only possible if the two persons have opposite sex");
    NSAssert(bothAreSingle,@"Postcondition violation: A marriage is only possible if the two persons are single");
    
    return result;
}

- (void)marry:(Citizen *)Aperson
{
    // Check for violation of preconditions
    NSAssert(Aperson,@"Precondition violation, you didn't specify a Citizen object to marry");
    NSAssert([self canMarry:Aperson], @"Precondition violation, you (%@) are not allowed to marry this person (%@)",self.name,Aperson.name);
    NSAssert([Aperson canMarry:self], @"Precondition violation, your sweetheart (%@) are not allowed to marry you (%@)",Aperson.name,self.name);
    
    //Legal marriage
    NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
    // Update properties
    self.spouse = Aperson;
    Aperson.spouse = self;
    
    // Check for violation of postconditions
    NSAssert(self.spouse == Aperson, @"Postcondition violation, your sweetheart (%@) were not set correctly as your spouse",Aperson.name);
    NSAssert(Aperson.spouse == self, @"Postcondition violation, you (%@) were not set correctly as your sweetheart's spouse",self.name);
}
- (void)divorce:(Citizen *)Aperson
{
    // Check whether the Citizen asking for a divorce is single or not
    NSAssert([self.single isEqualToString:@"NO"],@"Precondition violation: You are single and therefore not able to divorce anyone");
    // Check whether the Citizen asking for a divorce and his/her spouse were ever married
    NSAssert(self.spouse == Aperson && Aperson.spouse == self,@"Precondition violation: You were never married to this person and therefore not able to divorce him/her");
    Aperson.spouse = nil;
    self.spouse = nil;
    NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);

    // Check postconditions
    NSAssert([self.single isEqualToString:@"YES"],@"Postcondition violation: You yourself were not set correctly as single after the divorce");
    NSAssert([Aperson.single isEqualToString:@"YES"],@"Postcondition violation: Your old spouse were not set correctly as single after the divorce");
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
