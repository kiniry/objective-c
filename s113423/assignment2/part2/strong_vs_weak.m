#import <Foundation/Foundation.h>

// Foo.h
@interface Foo : NSObject

@property (strong) NSString* strongProperty;
@property (weak) NSString* weakProperty;

- (void)setProperties;

@end

// Foo.m
@implementation Foo

- (void)setProperties {
  NSString* strongString = [[NSString alloc] initWithFormat:@"%s", "strong"];
  NSMutableString* weakString = [[NSMutableString alloc] initWithFormat:@"%s", "weak"];

  self.strongProperty = strongString;
  self.weakProperty = weakString;

  // both are set
  NSLog(@"2: strong = %@, weak = %@", self.strongProperty, self.weakProperty);
}

@end

// main.m
int main(int argc, const char* argv[]) {
  Foo* foo = [[Foo alloc] init];

  @autoreleasepool {
    // both are nil
    NSLog(@"1: strong = %@, weak = %@", foo.strongProperty, foo.weakProperty);

    [foo setProperties];

    // foo.weakProperty could be nil from now on
    NSLog(@"3: strong = %@, weak = %@", foo.strongProperty, foo.weakProperty);
  }

  // I can only get the release of weakProperty to trigger after the pool is drained
  NSLog(@"4: strong = %@, weak = %@", foo.strongProperty, foo.weakProperty);

  return 0;
}
