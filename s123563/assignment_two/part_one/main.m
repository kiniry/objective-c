#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main (int argc, const char * argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  NoblePerson* bob = [[NoblePerson alloc] initWithSex:male 
				      andName:@"Bob"
				       andAge:[NSNumber numberWithInt:24]];

  NoblePerson* alice = [[NoblePerson alloc] initWithSex:female 
				      andName:@"Alice"
				       andAge:[NSNumber numberWithInt:23]];

  NoblePerson* winston = [[NoblePerson alloc] initWithSex:male
						  andName:@"Winston"
						   andAge:[NSNumber numberWithInt:47]];

  NoblePerson* junior = [[NoblePerson alloc] initWithSex:male
						  andName:@"Junior"
						   andAge:[NSNumber numberWithInt:5]];

  bob.assets = [NSNumber numberWithInt:100000];
  bob.butler = winston;
  NSLog(@"Bobs spouse and assets before marriage:%@ and %@", bob.spouse, bob.assets);
  [bob marryTo:alice];
  NSLog(@"Bobs spouse and assets after marriage:%@ and %@", bob.spouse.name, bob.assets);
  
  [bob addChild:junior];
  NSLog(@"Bob now has a child: %@", bob.children);


  [pool drain];
  return 0;
}
