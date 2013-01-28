#import "MethodInvocation.h"
#import "Profiling.h"

@interface MethodInvocation ()

+ (void) staticNoop;
- (void) noop;

@end

@implementation MethodInvocation

const int NUM_CALLS_METH = 100000000;

- (void) run
{
  NSLog(@"--- Running method invocation tests ---");
  TimedTask* t0 = [TimedTask taskWithName:@"direct IMP call"];
  TimedTask* t1 = [TimedTask taskWithName:@"method access"];
  TimedTask* t2 = [TimedTask taskWithName:@"performSelector"];

  TimedTask* t3 = [TimedTask taskWithName:@"static method access"];
  TimedTask* t4 = [TimedTask taskWithName:@"static performSelector"];

  SEL staticSel = @selector(staticNoop);
  SEL sel = @selector(noop);
  IMP iMeth = [self methodForSelector:sel];

  TimeTaskFor(iMeth(self, sel), t0, NUM_CALLS_METH);
  TimeTaskFor([self noop], t1, NUM_CALLS_METH);
  TimeTaskFor([self performSelector:sel], t2, NUM_CALLS_METH);

  TimeTaskFor([MethodInvocation staticNoop], t3, NUM_CALLS_METH);
  TimeTaskFor([MethodInvocation performSelector:staticSel], t4, NUM_CALLS_METH);

  [Profiling compareTask:t0 withTask:t1];
  [Profiling compareTask:t1 withTask:t2];
  [Profiling compareTask:t3 withTask:t4];
  [Profiling compareTask:t1 withTask:t3];
  [Profiling compareTask:t2 withTask:t4];
  NSLog(@"");
}

+ (void) staticNoop {}
- (void) noop {}

@end
