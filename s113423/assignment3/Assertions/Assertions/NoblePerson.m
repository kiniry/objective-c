#import "NoblePerson.h"

@interface NoblePerson ()

@property NSNumber* assets;
@property Citizen* butler;
@property NoblePerson* spouse;

@end

@implementation NoblePerson

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children assets:(NSNumber*)assets butler:(Citizen*)butler {
  self = [super initWithName:name sex:sex age:age children:children];
  if (self) {
    _assets = assets;
    _butler = butler;
  }
  return self;
}

- (BOOL)canMarry:(Citizen*)other {
  NSAssert(other, @"Precondition failed");
  
  BOOL result = [super canMarry:other]
                && [other isKindOfClass:[NoblePerson class]]
                && (self.butler || ((NoblePerson*)other).butler); // this line is only evaluated if other is a NoblePerson

  NSAssert(!result || [self isSingle], @"Postcondition failed");
  NSAssert(!result || [other isSingle], @"Postcondition failed");
  NSAssert(!result || ![self.children containsObject:other], @"Postcondition failed");
  NSAssert(!result || self.father != other, @"Postcondition failed");
  NSAssert(!result || self.mother != other, @"Postcondition failed");
  NSAssert(!result || self.sex != other.sex, @"Postcondition failed");
  NSAssert(!result || [other isKindOfClass:[NoblePerson class]], @"Postcondition failed");
  NSAssert(!result || ([self butler] || ((NoblePerson*)other).butler), @"Postcondition failed");
  return result;
}

- (void)marry:(Citizen*)sweetheart {
  NSAssert(sweetheart, @"Precondition failed");
  NSAssert([self canMarry:sweetheart], @"Precondition failed");
  NSAssert([sweetheart canMarry:self], @"Precondition failed");
  double oldAssets = [self.assets doubleValue] + [((NoblePerson*)sweetheart).assets doubleValue];

  // this method should only be called if [self canMarry:sweetheart] returns true
  // sweetheart must therefore be a NoblePerson
  NoblePerson* fiancee = (NoblePerson*)sweetheart;

  self.spouse = fiancee;
  fiancee.spouse = self;

  // share assets after wedding is paid for
  NSNumber* sharedAssets = @( [self.assets doubleValue] + [fiancee.assets doubleValue] - 50000.0 );
  self.assets = sharedAssets; // aliasing intended
  fiancee.assets = sharedAssets;

  NSAssert(self.spouse == sweetheart, @"Postcondition failed");
  NSAssert(self.butler || fiancee.butler, @"Postcondition failed");
  NSAssert([self.assets doubleValue] <= oldAssets - 50000.0, @"Postcondition failed");
}

- (void)divorce {
  NSAssert(![self isSingle], @"Precondition failed");
  Citizen* oldSpouse = self.spouse;

  self.assets = @( [self.assets doubleValue] / 2.0 );
  self.spouse.assets = @( [self.spouse.assets doubleValue] / 2.0 );

  [super divorce];

  NSAssert([self isSingle], @"Postcondition failed");
  NSAssert([oldSpouse isSingle], @"Postcondition failed");
}

- (NSString*)description {
  NSString *sexString = ( self.sex == SexMale ? @"male" : @"female" );
  return [NSString stringWithFormat:@"( NoblePerson, name: %@, age: %lu, sex: %@, assets: %@ )", self.name, self.age, sexString, self.assets];
}

@end
