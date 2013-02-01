#import "LogManager.h"

@interface LogManager ()
@property (assign) NSMutableSet* loggers;
@end

@implementation LogManager

@synthesize loggers = _loggers;

- (id) init
{
  if ((self = [super init]))
  {
    _loggers = [[NSMutableSet alloc] init];
  }

  return self;
}

- (BOOL) addLogger:(Logger*)logger
{
  // check if a logger with the same name already exist
  for (Logger* logger in self.loggers) {
    if ([logger.name isEqualToString:logger.name])
      return NO;
  }

  [self.loggers addObject:logger];
  
  return YES;
}

- (Logger*) getLogger:(NSString*)loggerName
{
  for (Logger* logger in self.loggers) {
    if ([loggerName isEqualToString:logger.name])
      return logger;
  }
  return nil;
}

- (void) checkAccess
{
  NSLog(@"Not implemented");
}

- (NSString*) getProperty:(NSString*)propertyName
{
  NSLog(@"Not implemented");
  return nil;
}

- (void) readConfiguration
{
  NSLog(@"Not implemented");
}

- (void) readConfiguration:(NSString*)configFilePath
{
  NSLog(@"Not implemented");
}

- (void) reset
{
  NSLog(@"Not implemented");
}

// Singleton; This is a very strict singleton implementation
// overriding the allocation and release/retain methods (to prevent
// outside instantiation)
// Edit: so, that resulted in a crash, only retainCount is now overriden
// which prevents releasing the shared instance in ARC.
static LogManager* instance;

+ (LogManager*) getInstance
{
  if (instance == nil)
    instance = [[LogManager alloc] init];

  return instance;
}
 
- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

@end
