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

  POSTCONDITION(result == !self.spouse, @"result == !self.spouse");
  return result;
}

- (BOOL)canMarry:(Citizen*)other {
  PRECONDITION(other, @"other");
  
  BOOL result = [self isSingle]
                && [other isSingle]
                && ![self.children containsObject:other]
                && self.father != other
                && self.mother != other
                && self.sex != other.sex;

  POSTCONDITION(!result || [self isSingle], @"!result || [self isSingle]");
  POSTCONDITION(!result || [other isSingle], @"!result || [other isSingle]");
  POSTCONDITION(!result || ![self.children containsObject:other], @"!result || ![self.children containsObject:other]");
  POSTCONDITION(!result || self.father != other, @"!result || self.father != other");
  POSTCONDITION(!result || self.mother != other, @"!result || self.mother != other");
  POSTCONDITION(!result || self.sex != other.sex, @"!result || self.sex != other.sex");
  return result;
}

- (void)marry:(Citizen*)sweetheart {
  // abstract method, must be overriden in subclass
  [NSException raise:NSInternalInconsistencyException format:@"Invoked abstract method %@", NSStringFromSelector(_cmd)];
}

- (void)divorce {
  PRECONDITION(![self isSingle], @"![self isSingle]");
  Citizen* oldSpouse = self.spouse;

  self.spouse.spouse = nil;
  self.spouse = nil;

  POSTCONDITION([self isSingle], @"[self isSingle]");
  POSTCONDITION([oldSpouse isSingle], @"[oldSpouse isSingle]");
}

@end
