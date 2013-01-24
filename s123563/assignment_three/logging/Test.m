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
  NSLog(@"--- SHOULD LOG: noble persons must only marry other noble persons");
  [alice marryTo:winston];
  NSLog(@"");

  NSLog(@"--- SHOULD LOG: must not marry without a butler");
  [bob marryTo:alice];
  NSLog(@"");

  bob.assets = [NSNumber numberWithInt:100000];
  bob.butler = winston;
  [bob marryTo:alice];

  NSLog(@"--- SHOULD LOG: must not marry person of same sex");
  [bob marryTo:junior];
  NSLog(@"");
  
  [bob addChild:junior];
  
  NSLog(@"--- SHOULD LOG: must not add duplicate child");
  [bob addChild:junior];
  NSLog(@"");

  NSLog(@"--- SHOULD LOG: cannot marry own child");
  [alice marryTo:junior];
}

@end
