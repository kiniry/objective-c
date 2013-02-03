#import "Formatter.h"

@implementation Formatter

- (NSString*) format:(LogRecord*)record
{
  MustImplement();
}

- (NSString*) formatMessage:(LogRecord*)record
{
  return record.message;
}

// returns empty string per default
- (NSString*) head
{
  return @"";
}

// returns empty string per default
- (NSString*) tail
{
  return @"";
}


@end
