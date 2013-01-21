// First program example

#import <Foundation/Foundation.h>
#import "TestApp.h"

int main (int argc, const char * argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  TestApp* app = [[TestApp alloc] initWithMessage:@"you look puzzled!"];
  [app run];
  [pool drain];
  return 0;
}
