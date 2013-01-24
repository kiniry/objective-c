#import <Foundation/Foundation.h>
#import "SAExperiments.h"

int main(int argc, const char * argv[])
{
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

  SAExperiments* exp = [[SAExperiments alloc] init];
  [exp runFactories];
  [exp runScopes];
  [exp runEnumerations];
  [exp runExceptions];
  [exp runBlocks];
  
  [pool drain];
  return 0;
}
