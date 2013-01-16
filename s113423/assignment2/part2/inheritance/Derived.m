#import "Derived.h"

@interface Derived ()

- (void)methodB;

@end

@implementation Derived

- (void)methodB {
  NSLog(@"--> methodB of Derived");
  NSLog(@"<-- methodB of Derived");
}

@end
