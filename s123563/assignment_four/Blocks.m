#import "Blocks.h"

@implementation Blocks

const long long NUM_CALLS_BLX = 200000000;

- (void) run
{
  NSLog(@"--- Running block tests ---");
  NSLog(@"-- performing simple operation %lld times", NUM_CALLS_BLX);

  TimedTask* t1 = [TimedTask taskWithName:@"simple op as msg send"];
  TimeTaskFor([self simpleOp], t1, NUM_CALLS_BLX);
  
  TimedTask* t2 = [TimedTask taskWithName:@"simple op as block"];
  void (^simpleBlock)(void) = ^{		
    int a = 2;							
    int b = a;							
    a = b + a;							
  };

  TimeTaskFor(simpleBlock(), t2, NUM_CALLS_BLX);

  [Profiling compareTask:t1 withTask:t2];

  NSLog(@"");
}

- (void) simpleOp
{
  int a = 2;
  int b = a;
  a = b + a;
}

@end
