#import "StringManipulation.h"
#import "Profiling.h"
#import <objc/runtime.h>

@interface StringManipulation ()

@property (copy) NSString* immutableString;
@property (retain) NSMutableString* mutableString;
@property (retain) NSMutableDictionary* strDict;

@end

@implementation StringManipulation 

const int NUM_CALLS_STRMAN = 50000;

@synthesize immutableString = _immutableString;
@synthesize mutableString = _mutableString;
@synthesize strDict = _strDict;


- (id) init
{
  if (self = [super init]) {
    _immutableString = @"";
    _mutableString = [[NSMutableString alloc] init];
    _strDict = [[NSMutableDictionary alloc] init];
    
    // Fill the dictionary with strings
    int len = 1;
    for (int i = 0; i < 5; ++i)
    {
      NSMutableString* str = [[NSMutableString alloc] init];
      for (int j = 0; j < len; ++j)
      {
	[str appendString:@"x"];
      }
      [_strDict setObject:str forKey:[NSNumber numberWithInt:len]];
      len *= 10;
    }
  }
  
  return self;
}

- (void) run
{
  NSLog(@"--- Running string manipulation tests ---");
  NSLog(@"size of NSString typed var's class: %i", class_getInstanceSize([[[NSString alloc] initWithString:@""] class]));
  NSLog(@"size of string literal's class: %i", class_getInstanceSize([@"" class]));
  NSLog(@"");

  // append to string
  for (NSNumber* key in [self.strDict allKeys]) {
    NSString* obj = [self.strDict objectForKey:key];

    self.immutableString = @"";
    self.mutableString = [[NSMutableString alloc] init];

    NSLog(@"-- appending 'x'*%d %i times:", [key intValue], NUM_CALLS_STRMAN);
    TimedTask* immTask = [TimedTask taskWithName:[NSString stringWithFormat:@"append to immutable string (%d)", [key intValue]]];
    TimedTask* mutTask = [TimedTask taskWithName:[NSString stringWithFormat:@"append to mutable string (%d)", [key intValue]]];
    TimeTaskFor([self.immutableString stringByAppendingString:obj], immTask, NUM_CALLS_STRMAN);
    TimeTaskFor([self.mutableString appendString:obj], mutTask, NUM_CALLS_STRMAN);

    [Profiling compareTask:immTask withTask:mutTask];
  }
  
  NSLog(@"");
}

@end
