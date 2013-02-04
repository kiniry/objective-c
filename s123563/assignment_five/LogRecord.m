#import "LogRecord.h"

@implementation LogRecord

@synthesize level = _level;
@synthesize loggerName = _loggerName;
@synthesize message = _message;
@synthesize seconds = _seconds;
@synthesize parameters = _parameters;
@synthesize sequenceNumber = _sequenceNumber;
@synthesize sourceClassName = _sourceClassName;
@synthesize threadID = _threadID;
@synthesize exception = _exception;

- (id) initWithMessage:(NSString*)message 
	      andLevel:(Level*)level 
	 andLoggerName:(NSString*)loggerName
{
  if ((self = [super init]))
  {
    _message = message;
    _level = level;
    _loggerName = loggerName;
    _seconds = [[NSDate date] timeIntervalSince1970];
  }

  return self;
}

@end
