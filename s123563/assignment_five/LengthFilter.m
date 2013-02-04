#import "LengthFilter.h"

@implementation LengthFilter

@synthesize length = _length;


- (id) initWithMaxLength:(NSUInteger)length
{
  if ((self = [super init]))
  {
    _length = length;
  }
  return self;
}

- (BOOL) isLoggableRecord:(LogRecord*)record
{
  return [record.message length] < self.length;
}

@end
