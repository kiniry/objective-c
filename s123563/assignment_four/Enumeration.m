#import "Enumeration.h"

@implementation Enumeration

- (void) run 
{

  NSLog(@"--- Running enumerations ---");

  int numElements = 10000000;
  NSLog(@"Creating a dictionary with %i integers", numElements);
  // init a collection to loop through
  NSMutableArray* arr = [[NSMutableArray alloc] initWithCapacity:numElements];
  for (int i = 0; i < numElements; ++i)
  {
    [arr addObject:[NSNumber numberWithInt:i]];
  }

  NSLog(@"-- enumerating the dictionary --");
  TimedTask* t1 = [TimedTask taskWithName:@"standard for loop"];
  TimeTask(for (int i = 0; i < [arr count]; ++i) {
      // noop
    }, t1);
  
  TimedTask* t2 = [TimedTask taskWithName:@"fast enumeration"];
  TimeTask(for (id obj in arr) {
      // noop
    }, t2);
  
  [Profiling compareTask:t1 withTask:t2];
}

@end
