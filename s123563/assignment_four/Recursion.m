#import "Recursion.h"

@interface Recursion ()

- (void) recurse;

@end

@implementation Recursion

@synthesize depth = _depth;

- (void) run
{
  [self recurse];
}

- (void) recurse
{
  self.depth++;

  //  if ([self.depth intValue] % 500 == 0)
  NSLog(@"Depth: %@", self.depth);
  if ([self.depth intValue] < 100)
    [self recurse];
}

@end
