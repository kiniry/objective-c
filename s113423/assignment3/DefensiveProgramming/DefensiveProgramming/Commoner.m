#import "Commoner.h"

@interface Citizen ()

@property Citizen* spouse;

@end

@implementation Commoner

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children {
  return [super initWithName:name sex:sex age:age children:children];
}

- (void)marry:(Citizen*)sweetheart {
  if (!(sweetheart && [self canMarry:sweetheart] && [sweetheart canMarry:self])) {
    [NSException raise:NSInvalidArgumentException format:@"Precondition failed: sweetheart = %@, [self canMarry:sweetheart] = %d, [sweetheart canMarry:self] = %d", sweetheart, [self canMarry:sweetheart], [sweetheart canMarry:self]];
  }

  self.spouse = sweetheart;
  sweetheart.spouse = self;
}

- (NSString*)description {
  NSString *sexString = ( self.sex == SexMale ? @"male" : @"female" );
  return [NSString stringWithFormat:@"( NoblePerson, name: %@, age: %lu, sex: %@ )", self.name, self.age, sexString];
}

@end
