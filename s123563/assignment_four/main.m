#import <Foundation/Foundation.h>
#import "StringManipulation.h"
#import "MethodInvocation.h"
#import "Blocks.h"
#import "Enumeration.h"

int main(int argc, const char * argv[])
{
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  [[[MethodInvocation alloc] init] run];
  //[[[StringManipulation alloc] init] run];
  //[[[Blocks alloc] init] run];
  //[[[Enumeration alloc] init] run];

  [pool drain];
  return 0;
}
