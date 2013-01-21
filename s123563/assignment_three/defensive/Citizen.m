#import "Citizen.h"

@interface Citizen ()
// make the sets privately settable
@property (readwrite, nonatomic, assign) NSSet* children;
@property (readwrite, nonatomic, assign) NSSet* parents;
@end

@implementation Citizen

@synthesize name = _name;
@synthesize sex = _sex;
@synthesize age = _age;
@synthesize spouse = _spouse;
@synthesize children = _children;
@synthesize parents = _parents;

- (id) initWithSex:(Sex)sex andName:(NSString*)name andAge:(NSNumber*)age
{
  self = [super init];

  if (self) 
  {
    _sex = sex;
    _name = name;
    _age = age;
    _children = [[NSSet alloc] init];
    _parents = [[NSSet alloc] init];
  }

  return self;
}

// Constraint: each citizen has two parents
- (void) addParent:(Citizen*)parent
{
  if ([self.parents count] < 2)
  {
    NSMutableSet* tmp = [self.parents mutableCopy];
    [tmp addObject:parent];
    self.parents = [tmp copy];
  }
  else
  {
    @throw [NSException exceptionWithName:@"Precondition failure" 
				   reason:@"Cannot add parent, Citizen already has two parents" 
				 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
  }
}

- (void) removeParent:(Citizen*)parent
{
    NSMutableArray* tmp = [self.parents mutableCopy];
    [tmp removeObject:parent];
    self.parents = [NSArray arrayWithArray:tmp];
}

// Constraint: All children must have this person among their parents
- (void) addChild:(Citizen*)child
{
  if ([self.children containsObject:child])
    @throw [NSException exceptionWithName:@"Precondition failure" 
				   reason:@"Cannot add child, Citizen already this citizen as child" 
				 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
  [child addParent:self];

  NSMutableSet* tmp = [self.children mutableCopy];
  [tmp addObject:child];
  self.children = [tmp copy];
}

- (void) removeChild:(Citizen*)child
{
    NSMutableSet* tmp = [self.children mutableCopy];
    [tmp removeObject:child];
    self.children = [tmp copy];
}

// Constraints: 
// #1: May not marry own children
// #2: May not marry own parents
// #3: May not marry a person of same sex (wth?)
- (BOOL) canMarry:(Citizen*)suitor
{
  // #1 + #2
  NSMutableSet* nonMarriables = [self.children mutableCopy];
  [nonMarriables unionSet: self.parents];
  for (Citizen* prohibitedSpouse in nonMarriables)
  {
    if (suitor == prohibitedSpouse)
      return NO;
  }
  
  // #3
  if (self.sex == suitor.sex)
     return NO;

  // can only marry if single
  if (!self.isSingle)
    return NO;
  
  return YES;
}

- (BOOL) isSingle
{
  return !self.spouse;
}

//Commands
- (void) divorce 
{
  if (self.isSingle)
  {
    // remove both references
    self.spouse.spouse = nil;
    self.spouse = nil;
  }
  else
  {
    @throw [NSException exceptionWithName:@"Precondition failure" 
				   reason:@"Citizen is single, cannot divorce"
				 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen", self, nil]];
  }
}

- (void) marryTo:(Citizen*)fiancee
{ 
  // Must be two-way marriable
  if ([self canMarry:fiancee] && [fiancee canMarry:self]) 
  {
    self.spouse = fiancee;
    fiancee.spouse = self;
  }
  else 
  {
    @throw [NSException exceptionWithName:@"Precondition failure" 
				   reason:@"canMarry precondition failure" 
				 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Citizen 1", self, @"Citizen 2", fiancee, nil]];
  }
}

@end
