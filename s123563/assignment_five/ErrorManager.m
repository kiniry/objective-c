#import "ErrorManager.h"

@implementation ErrorManager

- (void) errorWithMessage:(NSString*)message andException:(NSException*)exception andCode:(LogError)code
{
  NSLog(@"Handling error '%@' with exception '%@' and code %lld", message, exception, (long)code);
}

@end
