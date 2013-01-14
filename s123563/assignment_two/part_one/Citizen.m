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
    NSMutableSet* tmp = [NSMutableSet setWithSet:_parents];
    [tmp addObject:parent];
    self.parents = [tmp copy];
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
  [child addParent:self];
  if (![child.parents containsObject:self])
    return;

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
- (BOOL) isMarriableTo:(Citizen*)suitor
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
}

- (void) marryTo:(Citizen*)fiancee
{ 
  // Must be two-way marriable
  if ([self isMarriableTo:fiancee] && [fiancee isMarriableTo:self]) 
  {
    self.spouse = fiancee;
    fiancee.spouse = self;
  }
}

@end
