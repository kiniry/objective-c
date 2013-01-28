#import "MethodInvocation.h"
#import "Profiling.h"

@interface MethodInvocation ()

- (void) runDirect;
- (void) runSelector;

+ (void) staticNoop;
- (void) noop;

@end

@implementation MethodInvocation

const int NUM_CALLS = 100000000;

- (void) run
{
  NSLog(@"--- Running method invocation tests ---");
  TimedTask* t1 = [TimedTask taskWithName:@"method access"];
  TimedTask* t2 = [TimedTask taskWithName:@"performSelector"];
  TimedTask* t3 = [TimedTask taskWithName:@"static method access"];
  TimedTask* t4 = [TimedTask taskWithName:@"static performSelector"];
  TimeTask([self runDirect], t1);
  TimeTask([self runSelector], t2);
  TimeTask([self runStaticDirect], t3);
  TimeTask([self runStaticSelector], t4);
  [Profiling compareTask:t1 withTask:t2];
  [Profiling compareTask:t3 withTask:t4];
  [Profiling compareTask:t1 withTask:t3];
  [Profiling compareTask:t2 withTask:t4];
  NSLog(@"");
}


- (void) runDirect
{
  for (int i = 0; i < NUM_CALLS; ++i)
  {
    [self noop];
  }  
}

- (void) runStaticDirect
{
  for (int i = 0; i < NUM_CALLS; ++i)
  {
    [MethodInvocation staticNoop];
  }  
}

- (void) runStaticSelector
{
  SEL sel = @selector(staticNoop);
  for (int i = 0; i < NUM_CALLS; ++i)
  {
    [MethodInvocation performSelector:sel];
  }  
}

- (void) runSelector
{
  SEL sel = @selector(noop);
  for (int i = 0; i < NUM_CALLS; ++i)
  {
    [self performSelector:sel];
  }  
}

+ (void) staticNoop {}
- (void) noop {}

@end
