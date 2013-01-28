#import <Foundation/Foundation.h>
#import "Runnable.h"

@interface Recursion : NSObject <Runnable>
{
  NSNumber* _depth;
}

@property (copy) NSNumber* depth;

@end
