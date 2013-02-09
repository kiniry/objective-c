#import <Foundation/Foundation.h>
#import "StringManipulation.h"
#import "MethodInvocation.h"
#import "Blocks.h"
#import "Enumeration.h"

int main(int argc, const char * argv[])
{
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  NSMutableSet* arg = [[NSMutableSet alloc] init];
  for (int i = 0; i < argc; ++i)
  {
    [arg addObject:[NSString stringWithCString:argv[i]]];
  }

  BOOL all = [arg containsObject:@"all"] || [arg count] == 1;
  if (all || [arg containsObject:@"methods"])
    [[[MethodInvocation alloc] init] run];

  if (all || [arg containsObject:@"strings"])
    [[[StringManipulation alloc] init] run];

  if (all || [arg containsObject:@"blocks"])
    [[[Blocks alloc] init] run];

  if (all || [arg containsObject:@"enums"])
    [[[Enumeration alloc] init] run];

  [pool drain];
  return 0;
}
