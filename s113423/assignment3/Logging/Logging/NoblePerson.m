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
  PRECONDITION(other, @"other");
  
  BOOL result = [super canMarry:other]
                && [other isKindOfClass:[NoblePerson class]]
                && (self.butler || ((NoblePerson*)other).butler); // this line is only evaluated if other is a NoblePerson

  POSTCONDITION(!result || [self isSingle], @"!result || [self isSingle]");
  POSTCONDITION(!result || [other isSingle], @"!result || [other isSingle]");
  POSTCONDITION(!result || ![self.children containsObject:other], @"!result || ![self.children containsObject:other]");
  POSTCONDITION(!result || self.father != other, @"!result || self.father != other");
  POSTCONDITION(!result || self.mother != other, @"!result || self.mother != other");
  POSTCONDITION(!result || self.sex != other.sex, @"!result || self.sex != other.sex");
  POSTCONDITION(!result || [other isKindOfClass:[NoblePerson class]], @"!result || ![other isKindOfClass:[NoblePerson class]]");
  if ([other isKindOfClass:[NoblePerson class]])
    POSTCONDITION(!result || ([self butler] || ((NoblePerson*)other).butler), @"!result || ([self butler] || ((NoblePerson*)other).butler)");
  return result;
}

- (void)marry:(Citizen*)sweetheart {
  PRECONDITION(sweetheart, @"sweetheart");
  PRECONDITION([self canMarry:sweetheart], @"[self canMarry:sweetheart]");
  PRECONDITION([sweetheart canMarry:self], @"[sweetheart canMarry:self]");
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

  POSTCONDITION(self.spouse == sweetheart, @"self.spouse == sweetheart");
  POSTCONDITION(self.butler || fiancee.butler, @"self.spouse == sweetheart");
  POSTCONDITION([self.assets doubleValue] <= oldAssets - 50000.0, @"[self.assets doubleValue] <= oldAssets - 50000.0");
}

- (void)divorce {
  PRECONDITION(![self isSingle], @"![self isSingle]");
  Citizen* oldSpouse = self.spouse;

  self.assets = @( [self.assets doubleValue] / 2.0 );
  self.spouse.assets = @( [self.spouse.assets doubleValue] / 2.0 );

  [super divorce];

  POSTCONDITION([self isSingle], @"[self isSingle]");
  POSTCONDITION([oldSpouse isSingle], @"[oldSpouse isSingle]");
}

- (NSString*)description {
  NSString *sexString = ( self.sex == SexMale ? @"male" : @"female" );
  return [NSString stringWithFormat:@"( NoblePerson, name: %@, age: %lu, sex: %@, assets: %@ )", self.name, self.age, sexString, self.assets];
}

@end
