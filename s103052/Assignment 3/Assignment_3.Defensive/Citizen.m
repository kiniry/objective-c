/*************************************************************************
 *  File name   : Citizen.m
 *  Description : Class for citizens
 *
 *  Created on  : 17/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Citizen.h"

#define ILLEGAL_AGE 0

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
	// Check 1) Name (no nil or empty string)
    if (!name || [name isEqualToString:@""])
	{
        NSException* exception_Name = [NSException exceptionWithName:@"Precondition violation" reason:@"You must specify a real name!" userInfo:nil];
        @throw exception_Name;
    }
    // Check 2) Sex (only "Male" or "Female")
    if (!([sex isEqualToString:@"Male"]||[sex isEqualToString:@"Female"]))
	{
        NSException* exception_Sex = [NSException exceptionWithName:@"Precondition violation" reason:@"The sex must be either Male or Female!" userInfo:nil];
        @throw exception_Sex;
    }
    //Check 3) Age (only positive integer)
	if (!([age isKindOfClass:[NSNumber class]]) || ([age isLessThan:[NSNumber numberWithInt:ILLEGAL_AGE]]))
	{
        NSException* exception_Age = [NSException exceptionWithName:@"Precondition violation" reason:@"The age must be a positive integer!" userInfo:nil];
        @throw exception_Age;
    }
    // Initialize
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
	//Check 1) Child (nil)
    if (Aperson == nil)
	{
        NSException* exception_ChildEmpty = [NSException exceptionWithName:@"Precondition violation" reason:@"You must specify a citizen!" userInfo:nil];
        @throw exception_ChildEmpty;
    }
	//Check 2) Already mother or father
	if(self.father == Aperson || self.mother == Aperson) 
	{
		NSException* exception_ParentsExist = [NSException exceptionWithName:@"Precondition violation" reason:@"You are not allowed to add one of your own parents!" userInfo:nil];
        @throw exception_ParentsExist;
	}
	//Check 3) Father (add)
    if ([self.sex isEqualToString:@"Male"])
	{
        if (Aperson.father == nil)
		{
            [self.children addObject:Aperson];
            Aperson.father = self;   
        }
        else 
		{
            NSException* exception_FatherExist = [NSException exceptionWithName:@"Precondition violation" reason:@"The citizen already has a father!" userInfo:nil];
            @throw exception_FatherExist;
        }
    }
	//Check 3) Mother (add)
    if ([self.sex isEqualToString:@"Female"])
	{
        if (Aperson.mother == nil)
		{
            [self.children addObject:Aperson];
            Aperson.mother = self;
        }
        else 
		{
			NSException* exception_MotherExist = [NSException exceptionWithName:@"Precondition violation" reason:@"The citizen already has a mother!" userInfo:nil];
			@throw exception_MotherExist;
		}
	}
}

- (void)marry:(Citizen*)Aperson
{
	//Check 1) Legal marriage
    if (!(Aperson == nil) && [self can_marry:Aperson])
    {
        NSLog(@"Legal marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
    } 
	//Check 2) Not legal marriage
	else
	{
		NSException* exception_SpouseEmpty = [NSException exceptionWithName:@"Precondition violation" reason:@"Not a legal marriage. Invalid spouse!" userInfo:nil];
		@throw exception_SpouseEmpty;
	}
}

- (void)divorce:(Citizen*)Aperson
{
	//Check 1) Self (Single)
	if (self.spouse == nil)
	{
		NSException* exception_SpouseSingle = [NSException exceptionWithName:@"Precondition violation" reason:@"You are single and therefore unable to divorce this person!" userInfo:nil];
		@throw exception_SpouseSingle;
	}
	//Check 2) Aperson (Divorce possible or not possible)
    if (self.spouse == Aperson && self == Aperson.spouse)
	{
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
    } 
	else
	{
		NSException* exception_SpouseEmpty = [NSException exceptionWithName:@"Precondition violation" reason:@"The divorce is not possible!" userInfo:nil];
		@throw exception_SpouseEmpty;
	}
}

- (BOOL)can_marry:(Citizen*)Aperson
{
	// Check 1) Spouse (nil)
	if (Aperson == nil)
	{
		NSException* exception_SpouseEmpty = [NSException exceptionWithName:@"Precondition violation" reason:@"You must specify a spouse!" userInfo:nil];
        @throw exception_SpouseEmpty;
	}
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
