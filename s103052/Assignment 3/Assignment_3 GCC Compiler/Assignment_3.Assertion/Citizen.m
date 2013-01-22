/*************************************************************************
 *  File name   : Citizen.m
 *  Description : Class for citizens
 *
 *  Created on  : 18/01/2013
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
	// Assert 1: Aperson is nil
    NSAssert(Aperson,@"Precondition violation: You must specify a citizen!");
	// Assert 2: Already have a mother or father
    NSAssert(!(self.father == Aperson || self.mother == Aperson),@"Precondition violation: You are not allowed to add one of your own parents!");
    //Check 1) Father (add)
	if ([self.sex isEqualToString:@"Male"])
	{
        if (Aperson.father == nil)
		{
            [self.children addObject:Aperson];
            Aperson.father = self;
        }
        else 
            NSLog(@"The citizen already has a father!"); 	// NSLOG FAIL MESSAGE
    }
    if ([self.sex isEqualToString:@"Female"])
	{
        if (Aperson.mother == nil)
		{
            [self.children addObject:Aperson];
            Aperson.mother = self;
        }
        else 
            NSLog(@"The citizen already has a mother!");	// NSLOG FAIL MESSAGE
    }
}

- (void)marry:(Citizen*)Aperson
{
	// Assert 1: Aperson is nil
    NSAssert(Aperson,@"Precondition violation: You must specify a citizen!");
	// Assert 2: Can marry Aperson/Self
    NSAssert([self can_marry:Aperson] || [Aperson can_marry:self], @"Precondition violation: Not a legal marriage. Invalid spouse!");
    
    //Legal marriage
    NSLog(@"Legal Marriage between %@ and %@",self.name,Aperson.name);
    self.spouse = Aperson;
    Aperson.spouse = self;
	
    // Assert 3: Marriage completed
    NSAssert(self.spouse == Aperson || self == Aperson.spouse, @"Postcondition violation: Marriage failed!");
}

- (void)divorce:(Citizen*)Aperson
{
	// Assert 1: Aperson is nil
    NSAssert(self.spouse != nil,@"Precondition violation: You are single and therefore unable to divorce this person!");
   
	if (self.spouse == Aperson && self == Aperson.spouse)
	{
        Aperson.spouse = nil;
        self.spouse = nil;
        NSLog(@"%@ has succesfully divorced %@",self.name,Aperson.name);
	} 
	else 
        NSLog(@"The divorce is not possible!"); // NSLOG FAIL MESSAGE
		
    // Assert 2: Divorce failed
    NSAssert(self.spouse == nil || Aperson.spouse == nil,@"Postcondition violation: Divorce failed!");
}

- (BOOL)can_marry:(Citizen*)Aperson
{
	// Assert 1: Aperson is nil
    NSAssert(Aperson,@"Precondition violation: You must specify a spouse!");
    
    BOOL Result = [self.children indexOfObject:Aperson] == NSNotFound && 
	self.mother != Aperson && self.father != Aperson && 
	self.sex != Aperson.sex && !self.spouse && !Aperson.spouse;
	
    // Assert 2: Aperson not member of children
    NSAssert(!Result || [self.children indexOfObject:Aperson], @"Postcondition violation: You are not allowed to marry your own child!");
    // Assert 3 & 4: Aperson not member of pertens
	NSAssert(!Result || self.mother != Aperson,@"Postcondition violation: You are not allowed to marry your own mother!");
    NSAssert(!Result || self.father != Aperson,@"Postcondition violation: You are not allowed to marry your own father!");
    // Assert 5: Aperson not same sex
	NSAssert(!Result || self.sex != Aperson.sex,@"Postcondition violation: You are not allowed to marry a citizen of same sex!");
	// Assert 6 % 7: Aperson/self are single
	NSAssert(!Result || self.spouse == nil,@"Postcondition violation: You are not single!");
    NSAssert(!Result || Aperson.spouse == nil,@"Postcondition violation: The citizen you want to marry are not single!");
	
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
