/*
   Project: HelloWorld

   Author: Cybus

   Created: 2013-01-23 13:38:32 +0100 by Cybus
*/

#import <Foundation/Foundation.h>

int main(int argc, const char *argv[])
{
  id pool = [[NSAutoreleasePool alloc] init];

  NSLog(@"Hello world!");
  
  [pool release];

  return 0;
}

