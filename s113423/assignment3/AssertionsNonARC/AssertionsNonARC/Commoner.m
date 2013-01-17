#import "Commoner.h"

@interface Citizen ()

@property (readwrite, retain) Citizen* spouse;

@end

@implementation Commoner

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children {
  return [super initWithName:name sex:sex age:age children:children];
}

- (void)marry:(Citizen*)sweetheart {
  NSAssert(sweetheart, @"Precondition failed");
  NSAssert([self canMarry:sweetheart], @"Precondition failed");
  NSAssert([sweetheart canMarry:self], @"Precondition failed");

  self.spouse = sweetheart;
  sweetheart.spouse = self;

  NSAssert(self.spouse == sweetheart, @"Postcondition failed");
}

- (NSString*)description {
  NSString *sexString = ( self.sex == SexMale ? @"male" : @"female" );
  return [NSString stringWithFormat:@"( NoblePerson, name: %@, age: %lu, sex: %@ )", self.name, self.age, sexString];
}

@end
