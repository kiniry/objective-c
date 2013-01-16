#import "Citizen.h"

@interface Citizen ()

@property Citizen* spouse;
@property Citizen* mother;
@property Citizen* father;

@end

@implementation Citizen

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children {
  self = [super init];
  if (self) {
    _name = name;
    _sex = sex;
    _age = age;
    _children = [children copy]; // children could be NSMutableSet in disguise

    for (Citizen* child in _children) {
      // is child even a Citizen?
      if (![child isKindOfClass:[Citizen class]]) return nil;

      // set parent of child
      if (_sex == SexMale) {
        if (child.father) {
          return nil; // child already has a father
        } else {
          child.father = self;
        }
      } else {
        if (child.mother) {
          return nil; // child already has a mother
        } else {
          child.mother = self;
        }
      }
    }
  }
  return self;
}

- (BOOL)isSingle {
  BOOL result = !self.spouse;

  NSAssert(result == !self.spouse, @"Postcondition failed");
  return result;
}

- (BOOL)canMarry:(Citizen*)other {
  NSAssert(other, @"Precondition failed");
  
  BOOL result = [self isSingle]
                && [other isSingle]
                && ![self.children containsObject:other]
                && self.father != other
                && self.mother != other
                && self.sex != other.sex;

  NSAssert(!result || [self isSingle], @"Postcondition failed");
  NSAssert(!result || [other isSingle], @"Postcondition failed");
  NSAssert(!result || ![self.children containsObject:other], @"Postcondition failed");
  NSAssert(!result || self.father != other, @"Postcondition failed");
  NSAssert(!result || self.mother != other, @"Postcondition failed");
  NSAssert(!result || self.sex != other.sex, @"Postcondition failed");
  return result;
}

- (void)marry:(Citizen*)sweetheart {
  // abstract method, must be overriden in subclass
  [NSException raise:NSInternalInconsistencyException format:@"Invoked abstract method %@", NSStringFromSelector(_cmd)];
}

- (void)divorce {
  NSAssert(![self isSingle], @"Precondition failed");
  Citizen* oldSpouse = self.spouse;

  self.spouse.spouse = nil;
  self.spouse = nil;

  NSAssert([self isSingle], @"Postcondition failed");
  NSAssert([oldSpouse isSingle], @"Postcondition failed");
}

@end
