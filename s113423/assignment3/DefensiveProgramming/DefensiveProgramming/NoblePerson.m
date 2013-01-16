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
  if (!(other)) {
    [NSException raise:NSInvalidArgumentException format:@"Precondition failed: other = %@", other];
  }

  return [super canMarry:other]
         && [other isKindOfClass:[NoblePerson class]]
         && (self.butler || ((NoblePerson*)other).butler); // this line is only evaluated if other is a NoblePerson
}

- (void)marry:(Citizen*)sweetheart {
  if (!(sweetheart && [self canMarry:sweetheart] && [sweetheart canMarry:self])) {
    [NSException raise:NSInvalidArgumentException format:@"Precondition failed: sweetheart = %@, [self canMarry:sweetheart] = %d, [sweetheart canMarry:self] = %d", sweetheart, [self canMarry:sweetheart], [sweetheart canMarry:self]];
  }

  // this method should only be called if [self canMarry:sweetheart] returns true
  // sweetheart must therefore be a NoblePerson
  NoblePerson* fiancee = (NoblePerson*)sweetheart;

  self.spouse = fiancee;
  fiancee.spouse = self;

  // share assets after wedding is paid for
  NSNumber* sharedAssets = @( [self.assets doubleValue] + [self.assets doubleValue] - 50000.0 );
  self.assets = sharedAssets; // aliasing intended
  fiancee.assets = sharedAssets;
}

- (void)divorce {
  if (!(![self isSingle])) {
    [NSException raise:NSInvalidArgumentException format:@"Precondition failed: [self isSingle] = %d", [self isSingle]];
  }

  self.assets = @( [self.assets doubleValue] / 2.0 );
  self.spouse.assets = @( [self.spouse.assets doubleValue] / 2.0 );

  [super divorce];
}

- (NSString*)description {
  NSString *sexString = ( self.sex == SexMale ? @"male" : @"female" );
  return [NSString stringWithFormat:@"( NoblePerson, name: %@, age: %lu, sex: %@, assets: %@ )", self.name, self.age, sexString, self.assets];
}

@end
