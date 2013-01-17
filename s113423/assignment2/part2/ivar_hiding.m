#import <Foundation/Foundation.h>

// Foo.h
@interface Foo : NSObject {
@protected // default visibility
  NSString *_field;
}

- (NSString *)fooField;

@end

// Foo.m
@implementation Foo

- (id)init {
  self = [super init];
  if (self) {
    _field = @"foo"; // Initialize _field
  }
  return self;
}

- (NSString *)fooField {
  return _field;
}

@end

// Bar.h
@interface Bar : Foo

- (int)barField;

@end

// Bar.m
@implementation Bar { // only works if declared in @implementation
@protected // default visibility
   int _field; // hides _field from superclass
}

- (id)init {
  self = [super init];
  if (self) {
    _field = 123; // Initialize _field
  }
  return self;
}

- (int)barField {
  return _field;
}

@end

// main.m
int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Foo *foo = [[Foo alloc] init];
        Bar *bar = [[Bar alloc] init];

        NSLog(@"[foo fooField] -> %@", [foo fooField]); // [foo fooField] -> foo
        NSLog(@"[bar fooField] -> %@", [bar fooField]); // [bar fooField] -> foo
        NSLog(@"[bar barField] -> %d", [bar barField]); // [bar barField] -> 123
    }

    return 0;
}