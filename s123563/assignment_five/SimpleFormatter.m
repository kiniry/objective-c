#import "SimpleFormatter.h"

@implementation SimpleFormatter

- (NSString*) format:(LogRecord*)record
{
  return [NSString stringWithFormat:@"[%@] (%@) %@", record.level, [NSDate dateWithTimeIntervalSince1970:record.seconds], record.message];
}

@end
