#import <Foundation/Foundation.h>
#import "Runnable.h"
#import "Profiling.h"

@interface Blocks : NSObject <Runnable>
{
  // must make the block an ivar (or property) or the compiler will optimize it away
  void (^simpleBlock)(void);
}
- (void) simpleOp;

@end
