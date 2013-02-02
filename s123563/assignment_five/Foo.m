#import "Foo.h"

@implementation Foo

+ (void) bar
{
  Logger* logr = [[LogManager getInstance] getLogger:@"five.logger"];
  [logr enteringSourceClass:[NSString stringWithCString:__FILE__] andSourceMethod:NSStringFromSelector(_cmd)];

  [logr severe:@"6. While visions of sugar-plums danced in their heads"];

  [logr exitingSourceClass:[NSString stringWithCString:__FILE__] andSourceMethod:NSStringFromSelector(_cmd)];
}

@end
