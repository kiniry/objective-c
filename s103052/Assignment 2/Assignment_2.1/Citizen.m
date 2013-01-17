/*************************************************************************
 *  File name   : Citizen.m
 *  Description : Class for citizens
 *
 *  Created on  : 15/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Citizen.h"

@interface Citizen ()

@property (readwrite, nonatomic, assign) NSMutableArray* children;
@property (readwrite, nonatomic, assign) Citizen* mother;
@property (readwrite, nonatomic, assign) Citizen* father;

@end

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize mother = _mother;
@synthesize father = _father;

- (id) initWithName:(NSString*)name withSex:(NSString*)sex withAge:(NSNumber*)age
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

- (NSString*)single
{
    return (self.spouse ? @"NO" : @"YES");
}

- (void)addChild:(Citizen*)Achild
{
    [self.children addObject:Achild];
}

- (void)setMother:(Citizen*)Amother
{
    if (self.mother == nil && [Amother.sex isEqualToString:@"Female"])
        _mother = Amother;
    else
        NSLog(@"The person already has a mother!");
}

- (void)setFather:(Citizen*)Afather
{
    if (self.father == nil && [Afather.sex isEqualToString:@"Male"])
        _father = Afather;
    else
        NSLog(@"The person already has a father!");
}

- (void)marry:(Citizen*)Aperson
{
	//Legal marriage
    if ([self IllegalMarriage:Aperson])
    {
        NSLog(@"Legal marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
    } 
	//Not legal marriage
	else
        NSLog(@"Not a legal marriage - leads to incest or homosexuality or polygyni");
}

- (void)divorce:(Citizen*)Aperson
{
    if (self.spouse == Aperson && Aperson.spouse == self)
	{
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    } 
	else
        NSLog(@"The divorce is not possible!");
}

- (BOOL)IllegalMarriage:(Citizen*)Aperson
{
    return [self.children indexOfObject:Aperson] == NSNotFound && self.mother != Aperson && 
	self.father != Aperson && self.sex != Aperson.sex && !self.spouse;
}

- (NSString*)generateChildrenString
{
    NSMutableString* childrenNames = [[NSMutableString alloc] init];
    // Load all children from array
    for (Citizen* childObject in self.children)
        if (childObject.name)
            [childrenNames appendString:[NSString stringWithFormat:@"%@, ",childObject.name]];
    return childrenNames;
}

- (NSString*)printInfo
{
    return [NSString stringWithFormat:@"\nName: %@, Sex: %@, Age: %@, Single?: %@, Children: %@ Parents: %@ & %@",self.name,self.sex,self.age,[self single],[self generateChildrenString],self.mother.name,self.father.name];
}

@end
