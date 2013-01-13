#import "Citizen.h"

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
  }

  return self;
}

// Constraint: each citizen has two parents
- (void) addParent:(Citizen*)parent
{
  if ([self.parents count] < 2)
  {
    NSMutableArray* tmp = [NSMutableArray arrayWithArray:_parents];
    [tmp addObject:parent];
    _parents = [tmp copy];
  }
}

- (void) removeParent:(Citizen*)parent
{
    NSMutableArray* tmp = [self.parents mutableCopy];
    [tmp removeObject:parent];
    _parents = [NSArray arrayWithArray:tmp];
}

// Constraint: All children must have this person among their parents
- (void) addChild:(Citizen*)child
{
  [child addParent:self];
  if (![child hasParent:self])
    return;

  NSMutableArray* tmp = [NSMutableArray arrayWithArray:_children];
  [tmp addObject:child];
  _children = [tmp copy];
}

- (void) removeChild:(Citizen*)child
{
    NSMutableArray* tmp = [self.children mutableCopy];
    [tmp removeObject:child];
    _children = [NSArray arrayWithArray:tmp];
}

- (BOOL) hasParent:(Citizen*)person
{
  for (Citizen* parent in self.parents) 
  {
    if (person == parent)
      return YES;
  }
  return NO;
}

- (BOOL) hasChild:(Citizen*)person
{
  for (Citizen* child in self.children) 
  {
    if (person == child)
      return YES;
  }
  return NO; 
}

// Constraints: 
// #1: May not marry own children
// #2: May not marry own parents
// #3: May not marry a person of same sex (wth?)
- (BOOL) isMarriableTo:(Citizen*)suitor
{
  // #1 + #2
  NSMutableArray* nonMarriables = [NSMutableArray arrayWithArray:self.children];
  [nonMarriables addObjectsFromArray: self.parents];
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
