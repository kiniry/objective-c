#import "Citizen.h"
#import "Assertion.h"

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
  Assert([self.parents count] < 2, @"Precondition failed. Too many parents.");

  NSMutableSet* tmp = [self.parents mutableCopy];
  [tmp addObject:parent];
  self.parents = [tmp copy];
  
  Assert([self.parents containsObject:parent], @"Postcondition failed. Parent not added.");
}

- (void) removeParent:(Citizen*)parent
{
  NSMutableArray* tmp = [self.parents mutableCopy];
  [tmp removeObject:parent];
  self.parents = [NSArray arrayWithArray:tmp];
  
  [parent removeChild:self];
  
  AssertNot([self.parents containsObject:parent], @"Postcondition failed: 'self' still has parent");
  AssertNot([parent.children containsObject:self], @"Postcondition failed: Parent still has 'self' as child");
}

// Constraint: All children must have this person among their parents
- (void) addChild:(Citizen*)child
{
  AssertNot([self.children containsObject:child], @"Precondition failed: Cannot have duplicate children");

  [child addParent:self];

  NSMutableSet* tmp = [self.children mutableCopy];
  [tmp addObject:child];
  self.children = [tmp copy];

  Assert([child.parents containsObject:self], @"Postcondition failed. Child does not have Citizen as parent.");
  Assert([self.children containsObject:child], @"Postcondition failed. Citizen does not have child");
}

- (void) removeChild:(Citizen*)child
{
  NSMutableSet* tmp = [self.children mutableCopy];
  [tmp removeObject:child];
  self.children = [tmp copy];
  
  AssertNot([self.children containsObject:child], @"Postcondition failed: 'self' still has child");
  AssertNot([child.parents containsObject:self], @"Postcondition failed: Child still has 'self' as parent");
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
  AssertNot([self isSingle], @"Precondition failed: Cannot divorce a Citizen who is single.");
  // remove both references
  self.spouse.spouse = nil;
  self.spouse = nil;

  Assert([self isSingle], @"Precondition failed: Divorce failed, Citizen is still single.");
}

- (void) marryTo:(Citizen*)fiancee
{ 
  Assert([self canMarry:fiancee], @"Precondition failed: 'self' cannot marry fiancee.");
  Assert([fiancee canMarry:self], @"Precondition failed: fiancee cannot marry 'self'.");

  self.spouse = fiancee;
  fiancee.spouse = self;

  AssertNot([self isSingle], @"Postcondition failed: 'self' is still single after marriage.");
  AssertNot([self isSingle], @"Postcondition failed: fiancee is still single after marriage.");
}

@end
