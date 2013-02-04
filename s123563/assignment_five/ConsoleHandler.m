#import "ConsoleHandler.h"

@implementation ConsoleHandler

- (void) publishRecord:(LogRecord*) record
{
  if ([self isLoggableRecord:record])
    NSLog(@"%@", [self.formatter format:record]);
}

- (void) close
{
  // do nothing
}

- (void) flush
{
  // do nothing
}


@end
