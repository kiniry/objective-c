/**
 *
 * @author Joachim Jensen
 *
 * Compiled with gcc and GNUstep on Windows.
 * gcc does not know ARC!
 *
 **/

#import <Foundation/Foundation.h> 
int main (int argc, const char * argv[])
{
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  NSLog (@"Hello World!");
  [pool drain];
  return 0;
}