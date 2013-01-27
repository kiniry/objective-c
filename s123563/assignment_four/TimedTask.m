#import "TimedTask.h"

@implementation TimedTask

@synthesize taskTime = _taskTime;
@synthesize taskName = _taskName;

- (id) initWithName:(NSString*)name
{
  if ((self = [super init]))
  {
    _taskName = name;
    // NOTE: this is really odd, if I set the value directly through  
    //       _taskTime the program crashed when the setter is used...
    self.taskTime = [NSNumber numberWithInt:0];
  }

  return self;
}


+ (TimedTask*) taskWithName:(NSString*)name 
{
  return [[TimedTask alloc] initWithName:name];
}

@end
