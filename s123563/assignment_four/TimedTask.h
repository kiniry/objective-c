#import <Foundation/Foundation.h>

@interface TimedTask : NSObject
{
  NSNumber* _taskTime;
  NSString* _taskName;
}

@property (copy, readwrite) NSNumber* taskTime;
@property (copy, readwrite) NSString* taskName;

- (id) initWithName:(NSString*)name;

+ (TimedTask*) taskWithName:(NSString*)name;

@end
