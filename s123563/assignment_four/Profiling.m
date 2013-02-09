#import "Profiling.h"

@implementation Profiling

+ (void) compareTask:(TimedTask*)task1 withTask:(TimedTask*)task2
{
  NSString* outp = @"comparison: '%@' is %f faster than '%@'";
  if ([task1.taskTime floatValue] < [task2.taskTime floatValue])
    NSLog(outp, task1.taskName, [task2.taskTime floatValue] / [task1.taskTime floatValue], task2.taskName);
  else  
    NSLog(outp, task2.taskName, [task1.taskTime floatValue] / [task2.taskTime floatValue], task1.taskName);
}

@end
