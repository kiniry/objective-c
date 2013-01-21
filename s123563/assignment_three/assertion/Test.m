#import "Test.h"
#import "NoblePerson.h"

@implementation Test

- (void) run
{
  
  // Tests - setup

  NoblePerson* bob = [[NoblePerson alloc] initWithSex:male 
				      andName:@"Bob"
				       andAge:[NSNumber numberWithInt:24]];

  NoblePerson* robert = [[NoblePerson alloc] initWithSex:male 
				      andName:@"Robert"
				       andAge:[NSNumber numberWithInt:27]];

  NoblePerson* alice = [[NoblePerson alloc] initWithSex:female 
				      andName:@"Alice"
				       andAge:[NSNumber numberWithInt:23]];

  NoblePerson* winston = [[NoblePerson alloc] initWithSex:male
						  andName:@"Winston"
						   andAge:[NSNumber numberWithInt:47]];

  NoblePerson* junior = [[NoblePerson alloc] initWithSex:male
						  andName:@"Junior"
						   andAge:[NSNumber numberWithInt:5]];
  // Tests - assertions
  AssertThrows([alice marryTo:winston], @"noble persons must only marry other noble persons");
  AssertThrows([bob marryTo:alice], @"must not marry without a butler");
  bob.assets = [NSNumber numberWithInt:100000];
  bob.butler = winston;
  [bob marryTo:alice];
  AssertThrows([bob marryTo:junior], @"must not marry person of same sex");
  [bob addChild:junior];
  AssertThrows([bob addChild:junior], @"must not add duplicate child");
  AssertThrows([alice marryTo:junior], @"must not marry own child");
  AssertEqual(bob.assets, alice.assets, @"assets of married persons must be equal");
  AssertThrows([alice marryTo:robert], @"must not marry if not single");

  // All must have passed
  NSLog(@"Tests passed");

  NSLog(@"Now failing an assertion, on purpose. For kicks...");
  [alice marryTo:junior];

}

@end
