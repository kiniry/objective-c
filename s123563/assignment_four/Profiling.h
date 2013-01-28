#import "TimedTask.h"
#import <mach/mach.h>

#define TimeTask(task, timedTask) do {					\
    NSLog(@"run task: %@", timedTask.taskName);				\
    NSTimeInterval start = [[NSDate date] timeIntervalSince1970];	\
    task;								\
    timedTask.taskTime = [NSNumber numberWithFloat:[[NSDate date] timeIntervalSince1970] - start]; \
    NSLog(@"> finished in %@ sec", timedTask.taskTime);			\
  } while (0)								\

#define TimeTaskFor(task, timedTask, iterations) TimeTask(for (int i = 0; i < iterations; ++i) {task;}, timedTask);

@interface Profiling : NSObject

+ (void) compareTask:(TimedTask*)task1 withTask:(TimedTask*)task2;

@end
