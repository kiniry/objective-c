#import "Base.h"

@interface Base ()

- (void)methodB;

@end

@implementation Base

- (void)methodA {
  NSLog(@"--> methodA of Base");
  [self methodB]; // Now, whose methodB is called?
  NSLog(@"<-- methodA of Base");
}

- (void)methodB {
  NSLog(@"--> methodB of Base");
  NSLog(@"<-- methodB of Base");
}

@end
