#import "SABlox.h"

@interface SABlox ()

- (SimpleBlockWithArg) giveSomeBlock;

@end

@implementation SABlox

- (void) runSomeBlocks
{
  @try 
  {
    SimpleBlockWithArg block = [self giveSomeBlock];

    block(@"arg1");
    // Why does this throw an uncatchable exception?
    // block(@"arg2");
  }
  @catch (NSException* e) 
  {
    NSLog(@"Something bad happened when running blocks");
  }
}

- (void) runIteratorWithBlock
{
  NSLog(@"Iterating an array using a block and stopping");
  NSArray* arr = [NSArray arrayWithObjects:@"first", @"second", @"third", nil];
  [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
      NSLog(@"Enumeration from block: %d - %@", idx, obj);
      if ([obj isEqualToString:@"second"])
	*stop = YES;
    }];
}

- (SimpleBlockWithArg) giveSomeBlock
{
  __block NSNumber* localNum = [NSNumber numberWithInt:1];
  return Block_copy(^(NSString* msg) {
      NSLog(@"Block executing (and increasing localNum)");
      NSLog(@">passed arg: %@", msg);
      NSLog(@">localNum: %@", localNum);
      localNum++;
    });
}

@end
