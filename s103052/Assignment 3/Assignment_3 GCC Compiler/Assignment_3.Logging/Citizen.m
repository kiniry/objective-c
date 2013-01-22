/*************************************************************************
 *  File name   : Citizen.m
 *  Description : Class for citizens
 *
 *  Created on  : 18/01/2013
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
    if (DEBUG && (!name || [name isEqualToString:@""]))
		NSLog(@"Precondition violation: You must specify a real name!");
    // Check 2) Sex (only "Male" or "Female")
    if (DEBUG && (!([sex isEqualToString:@"Male"]||[sex isEqualToString:@"Female"])))
		NSLog(@"Precondition violation: The sex must be either Male or Female!");
    //Check 3) Age (only positive integer)
	if (DEBUG && (!([age isKindOfClass:[NSNumber class]]) || ([age isLessThan:[NSNumber numberWithInt:ILLEGAL_AGE]])))
		NSLog(@"Precondition violation: The age must be a positive integer!");
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
    if (DEBUG && Aperson == nil)
		{ NSLog(@"Precondition violation: You must specify a citizen!"); return; }
	//Check 2) Already mother or father
	if (DEBUG && (self.father == Aperson || self.mother == Aperson)) 
		{ NSLog(@"Precondition violation: You are not allowed to add one of your own parents!"); return; }
	//Check 3) Father (add)
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
	//Check 3) Mother (add)
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
	//Check 1) Not legal marriage / Legal marriage
    if (DEBUG && Aperson == nil)
		{ NSLog(@"Postcondition violation: You must specify a spouse!"); return; }  
	if (DEBUG && ![self can_marry:Aperson])
		NSLog(@"Precondition violation: Not a legal marriage. Invalid spouse!"); 
	else
	{
		NSLog(@"Legal marriage between %@ and %@",self.name,Aperson.name);
        self.spouse = Aperson;
        Aperson.spouse = self;
	}
	//Check 2) Marriage completed
	if (DEBUG && (self.spouse != Aperson || self != Aperson.spouse))
        NSLog(@"Postcondition violation: Marriage failed!");
}

- (void)divorce:(Citizen*)Aperson
{
	//Check 1) Self (Single)
	if (DEBUG && self.spouse == nil)
		{ NSLog(@"Precondition violation: You are single and therefore unable to divorce this person!"); return; }
	//Check 2) Aperson (Divorce possible or not possible)
    if (DEBUG && !(self.spouse == Aperson && self == Aperson.spouse))
		NSLog(@"Precondition violation: The divorce is not possible!");
	else
	{
		Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
	}
	//Check 3) Divorce completed
	if (DEBUG && !(self.spouse == nil || Aperson.spouse == nil))
        NSLog(@"Postcondition violation: Divorce failed!");
}

- (BOOL)can_marry:(Citizen*)Aperson
{
	// Check 1) Spouse (nil)
	if (DEBUG && (Aperson == nil))
		{ NSLog(@"Postcondition violation: You must specify a spouse!"); return NO; }
    
    BOOL Result = [self.children indexOfObject:Aperson] == NSNotFound && 
	self.mother != Aperson && self.father != Aperson && 
	self.sex != Aperson.sex && !self.spouse && !Aperson.spouse;
	
	 if (DEBUG)
	 {
        if (!(!Result || [self.children indexOfObject:Aperson]))
            NSLog(@"Postcondition violation: You are not allowed to marry your own child!");
        if (!(!Result || self.mother != Aperson))
            NSLog(@"Postcondition violation: You are not allowed to marry your own mother!");
        if (!(!Result || self.father != Aperson))
            NSLog(@"Postcondition violation: You are not allowed to marry your own father!");
        if (!(!Result || self.sex != Aperson.sex))
            NSLog(@"Postcondition violation: You are not allowed to marry a citizen of same sex!");
        if (!(!Result || self.spouse == nil))
            NSLog(@"Postcondition violation: You are not single!");
        if (!(!Result || Aperson.spouse == nil))
            NSLog(@"Postcondition violation: The citizen you want to marry are not single!");
    }
	return Result;
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
