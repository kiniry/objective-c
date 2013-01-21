#import "SAScoped.h"

@interface SAScoped ()

- (void) privMethod;

@end

@implementation SAScoped

- (id) init
{
  self = [super init];
  return self;
}

+ (void) describe:(SAScoped*)obj
{
  NSLog(@"Now in static describe method");
  [obj privMethod];
}

- (void) privMethod
{
  NSLog(@"Private method called");
}

- (void) callMethod:(SAScoped*)obj
{
  [obj privMethod];
}

@end
