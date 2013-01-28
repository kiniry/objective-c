#import <Foundation/Foundation.h>
#import "Runnable.h"

@interface StringManipulation : NSObject <Runnable>
{
  NSString* _immutableString;
  NSMutableString* _mutableString;
  NSMutableDictionary* _strDict;
}

@end
