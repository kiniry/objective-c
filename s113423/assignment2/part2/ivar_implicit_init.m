#import <Foundation/Foundation.h>

// Foo.h
@interface Foo : NSObject {
  int _integer;
  double _double;
  NSString* _string;
}

@property NSNumber* number;

- (void)printFields;

@end

// Foo.m
@implementation Foo

- (void)printFields {
  NSLog(@"_integer = %d", _integer);
  NSLog(@"_double = %g", _double);
  NSLog(@"_string = %@", _string);
  NSLog(@"_number = %@", _number);
  NSLog(@"isa = %@", isa);
}

@end

// main.m
int main(int argc, char* argv[]) {
  @autoreleasepool {
    // alloc without init
    Foo* foo = [Foo alloc];

    // ivars initialized to 0/nil/NULL
    // except for special isa ivar that points to the class object
    [foo printFields];
  }

  return 0;
}
