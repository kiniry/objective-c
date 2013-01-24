#import <Foundation/Foundation.h>
#import "TestApp.h"

@interface TestApp()
- (void) greetWithName:(NSString*)name;
@end

@implementation TestApp

@synthesize message = _message;

- (id) initWithMessage:(NSString*)msg
{
  self = [super init];

  if (self) {
    _message = msg;
  }

  return self;
}

- (void) run
{
  [self greetWithName:@"Turing"];
}

- (void) greetWithName:(NSString*)name
{
  NSLog(@"Hello %@, %@", name, self.message);
}

@end
