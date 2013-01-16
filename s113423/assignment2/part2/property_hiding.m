#import <Foundation/Foundation.h>

// Foo.h
@interface Foo : NSObject

@property NSString* property;

- (NSString*)fooProperty;

@end

// Foo.m
@implementation Foo

- (NSString*)fooProperty {
  return _property;
}

@end

// Bar.h
@interface Bar : Foo

@property NSString* property; // synthesized accessors reuse instance variable from superclass
// @property int property; // 2 warnings: attributes don't match, incompatible types

@end

// Bar.m
@implementation Bar

// - (NSString *)barProperty {
//   return _property; // error: instance variable '_property' is private (i.e. it was synthesized in Foo)
// }

@end

// main.m
int main(int argc, const char* argv[]) {
    @autoreleasepool {
        Foo* foo = [[Foo alloc] init];
        Bar* bar = [[Bar alloc] init];

        foo.property = @"foo";
        bar.property = @"bar";

        NSLog(@"foo.property -> %@", foo.property); // foo.property -> foo
        NSLog(@"bar.property -> %@", bar.property); // bar.property -> bar

        NSLog(@"[bar fooProperty] -> %@", [bar fooProperty]); // foo.property -> bar
    }

    return 0;
}
