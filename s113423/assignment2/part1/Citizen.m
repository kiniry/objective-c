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
  return !self.spouse;
}

- (BOOL)canMarry:(Citizen*)other {
  return [self isSingle]
         && [other isSingle]
         && ![self.children containsObject:other]
         && self.father != other
         && self.mother != other
         && self.sex != other.sex;
}

- (void)marry:(Citizen*)sweetheart {
  // abstract method, must be overriden in subclass
  [NSException raise:NSInternalInconsistencyException format:@"Invoked abstract method %@", NSStringFromSelector(_cmd)];
}

- (void)divorce {
  self.spouse.spouse = nil;
  self.spouse = nil;
}

@end
