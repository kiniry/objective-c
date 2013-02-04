#import "Handler.h"
#import "OOUtils.h"

@implementation Handler

@synthesize encoding = _encoding;
@synthesize errorManager = _errorManager;
@synthesize filter = _filter;
@synthesize formatter = _formatter;
@synthesize level = _level;

- (void) close
{
  MustImplement();  
}

- (void) flush
{
  MustImplement();
}

- (BOOL) isLoggableRecord:(LogRecord*) record
{  
  BOOL result = YES;
  if (self.filter)
    result = result && [(id)self.filter isLoggableRecord:record];

  if (self.level)
    result = result && self.level.intValue <= record.level.intValue;

  return result;
}

- (void) publishRecord:(LogRecord*) record
{
  MustImplement();  
}


- (void) reportErrorWithMessage:(NSString*)msg  andException:(NSException*)ex andCode:(LogError) code
{
  
}

@end
