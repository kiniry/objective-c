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

@property (readwrite, nonatomic, assign) NSString* name;
@property (readwrite, nonatomic, assign) NSString* sex;
@property (readwrite, nonatomic, assign) NSNumber* age;
@property (readwrite, nonatomic, assign) Citizen* spouse;
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

- (void)addChild:(Citizen*)Aperson
{
    if ([self.sex isEqualToString:@"Male"])
	{
        if (Aperson.father == nil)
		{
            [self.children addObject:Aperson];
            Aperson.father = self;   
        }
        else 
            NSLog(@"The citizen already has a father!");
    }
    if ([self.sex isEqualToString:@"Female"])
	{
        if (Aperson.mother == nil)
		{
            [self.children addObject:Aperson];
            Aperson.mother = self;
        }
        else 
			NSLog(@"The citizen already has a mother!");
	}
}

- (void)marry:(Citizen*)Aperson
{
	//Legal marriage
    if ([self can_marry:Aperson])
    {
		NSLog(@"Legal marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
    } 
	//Not legal marriage
	else
        NSLog(@"Not a legal marriage. Invalid spouse!");
}

- (void)divorce:(Citizen*)Aperson
{
    if (self.spouse == Aperson && self == Aperson.spouse)
	{
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    } 
	else
        NSLog(@"The divorce is not possible!");
}

- (BOOL)can_marry:(Citizen*)Aperson
{
    return [self.children indexOfObject:Aperson] == NSNotFound && 
	self.mother != Aperson && self.father != Aperson && 
	self.sex != Aperson.sex && !self.spouse && !Aperson.spouse;
}

- (NSString*)getChildrenString
{
    NSMutableString* childrenNames = [[NSMutableString alloc] init];
    // Load all children from array
    for (Citizen* childObject in self.children)
        if (childObject.name)
            [childrenNames appendString:[NSString stringWithFormat:@"%@, ",childObject.name]];
    return childrenNames;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"\nName: %@, Sex: %@, Age: %@, Single?: %@, Children: %@ Parents: %@ & %@",self.name,self.sex,self.age,[self single],[self getChildrenString],self.mother.name,self.father.name];
}

@end
