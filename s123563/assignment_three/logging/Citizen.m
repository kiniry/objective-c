#import "Citizen.h"
#import "Logging.h"

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
  LogIfNot([self.parents count] < 2, @"PRE: Too many parents.");

  NSMutableSet* tmp = [self.parents mutableCopy];
  [tmp addObject:parent];
  self.parents = [tmp copy];
  
  LogIfNot([self.parents containsObject:parent], @"POST: Parent not added.");
}

- (void) removeParent:(Citizen*)parent
{
  NSMutableArray* tmp = [self.parents mutableCopy];
  [tmp removeObject:parent];
  self.parents = [NSArray arrayWithArray:tmp];
  
  [parent removeChild:self];
  
  LogIf([self.parents containsObject:parent], @"POST: 'self' still has parent");
  LogIf([parent.children containsObject:self], @"POST: Parent still has 'self' as child");
}

// Constraint: All children must have this person among their parents
- (void) addChild:(Citizen*)child
{
  LogIf([self.children containsObject:child], @"PRE: Cannot have duplicate children");

  [child addParent:self];

  NSMutableSet* tmp = [self.children mutableCopy];
  [tmp addObject:child];
  self.children = [tmp copy];

  LogIfNot([child.parents containsObject:self], @"POST: Child does not have Citizen as parent.");
  LogIfNot([self.children containsObject:child], @"POST: Citizen does not have child");
}

- (void) removeChild:(Citizen*)child
{
  NSMutableSet* tmp = [self.children mutableCopy];
  [tmp removeObject:child];
  self.children = [tmp copy];
  
  LogIf([self.children containsObject:child], @"POST: 'self' still has child");
  LogIf([child.parents containsObject:self], @"POST: Child still has 'self' as parent");
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
  LogIf([self isSingle], @"PRE: Cannot divorce a Citizen who is single.");
  // remove both references
  self.spouse.spouse = nil;
  self.spouse = nil;

  LogIfNot([self isSingle], @"PRE: Divorce failed, Citizen is still single.");
}

- (void) marryTo:(Citizen*)fiancee
{ 
  LogIfNot([self canMarry:fiancee], @"PRE: 'self' cannot marry fiancee.");
  LogIfNot([fiancee canMarry:self], @"PRE: fiancee cannot marry 'self'.");

  self.spouse = fiancee;
  fiancee.spouse = self;

  LogIf([self isSingle], @"POST: 'self' is still single after marriage.");
  LogIf([self isSingle], @"POST: fiancee is still single after marriage.");
}

@end
