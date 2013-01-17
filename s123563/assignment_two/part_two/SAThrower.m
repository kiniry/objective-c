#import "SAThrower.h"

@interface SAThrower ()
- (void) doSomethingBad;
@end

@implementation SAThrower

- (id) initAndThrow
{
  if ((self = [super init]))
    [self doSomethingBad];

  return self;
}

- (void) doSomethingBad
{
  NSLog(@"Doing something bad from SAThrower");
  [NSException raise:@"This is an exception raised intentionally" format:nil];  
}

@end
