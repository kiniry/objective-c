#import <Foundation/Foundation.h>
#import "NoblePerson.h"
#import "Assertion.h"
#import "Test.h"

int main (int argc, const char * argv[])
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  [[[Test alloc] init] run];

  [pool drain];
  return 0;
}
