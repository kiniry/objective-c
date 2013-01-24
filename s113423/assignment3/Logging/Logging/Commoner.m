#import "Commoner.h"

@interface Citizen ()

@property Citizen* spouse;

@end

@implementation Commoner

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children {
  return [super initWithName:name sex:sex age:age children:children];
}

- (void)marry:(Citizen*)sweetheart {
  PRECONDITION(sweetheart, @"sweetheart");
  PRECONDITION([self canMarry:sweetheart], @"[self canMarry:sweetheart]");
  PRECONDITION([sweetheart canMarry:self], @"[sweetheart canMarry:self]");

  self.spouse = sweetheart;
  sweetheart.spouse = self;

  POSTCONDITION(self.spouse == sweetheart, @"self.spouse == sweetheart");
}

- (NSString*)description {
  NSString *sexString = ( self.sex == SexMale ? @"male" : @"female" );
  return [NSString stringWithFormat:@"( Commoner, name: %@, age: %lu, sex: %@ )", self.name, self.age, sexString];
}

@end
