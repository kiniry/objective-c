#import "LogFormatter.h"

#include <pthread.h>

@implementation LogFormatter

- (NSString*)formatLogMessage:(DDLogMessage *)logMessage {
  return [NSString stringWithFormat:@"file: %@ | function: %s | line: %i | %@",
          [logMessage fileName],
          logMessage->function,
          logMessage->lineNumber,
          logMessage->logMsg];
}

@end
