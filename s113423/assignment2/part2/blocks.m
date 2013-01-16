#import <Foundation/Foundation.h>

// block typedefs
typedef double (^doubleToDouble)(double);
typedef id (^idToId)(id);
typedef NSNumber* (^NSNumberToNSNumber)(NSNumber*);
typedef NSString* (^NSStringToNSString)(NSString*);

typedef BOOL (^doubleToBOOL)(double);
typedef BOOL (^idToBOOL)(id);
typedef BOOL (^NSNumberToBOOL)(NSNumber*);
typedef BOOL (^NSStringToBOOL)(NSString*);

// Foo.h
@interface Foo : NSObject

// map and filter
+ (NSArray*)mapBlock:(idToId)block onArray:(NSArray*)array;
+ (NSArray*)filterArray:(NSArray*)array usingBlock:(idToBOOL)block;

// wrap block that takes double to block that takes NSNumber
+ (NSNumberToNSNumber)wrapDoubleToDouble:(doubleToDouble)block;
+ (NSNumberToBOOL)wrapDoubleToBOOL:(doubleToBOOL)block;

@end

// Foo.m
@implementation Foo

+ (NSArray*)mapBlock:(idToId)block onArray:(NSArray*)array {
  NSMutableArray* result = [[NSMutableArray alloc] init];

  for (id object in array) {
    [result addObject:block(object)];
  }

  return [result copy];
}

+ (NSArray*)filterArray:(NSArray*)array usingBlock:(idToBOOL)block {
  NSMutableArray* result = [[NSMutableArray alloc] init];

  for (id object in array) {
    if (block(object)) {
      [result addObject:object];
    }
  }

  return [result copy];
}

+ (NSNumberToNSNumber)wrapDoubleToDouble:(doubleToDouble)block {
  return ^(NSNumber* number) {
    return @( block([number doubleValue]) );
  };
}

+ (NSNumberToBOOL)wrapDoubleToBOOL:(doubleToBOOL)block {
  return ^(NSNumber* number) {
    return (BOOL)block([number doubleValue]);
  };
}

@end

// main.m
int main(int argc, const char* argv[]) {
  @autoreleasepool {
    NSArray* array;

    doubleToDouble square = ^(double x) {
      return x * x;
    };

    // map square block on array of NSNumber
    array = @[ @1, @2, @3, @4, @5 ];
    NSLog(@"array = %@", array);
    array = [Foo mapBlock:[Foo wrapDoubleToDouble:square] onArray:array];
    NSLog(@"array = %@", array);

    NSStringToNSString reverseAndCapitalize = ^(NSString* input) {
      NSMutableString* result = [NSMutableString string];

      for (int i = [input length] - 1; i >= 0; i--) {
        NSRange range = NSMakeRange(i, 1);
        [result appendString:[input substringWithRange:range]];
      }

      return [result capitalizedString];
    };

    // map reverseAndCapitalize block on array of NSString
    array = @[ @"OlLeh", @"DlRow" ];
    NSLog(@"array = %@", array);
    array = [Foo mapBlock:reverseAndCapitalize onArray:array];
    NSLog(@"array = %@", array);

    double threshold = 7.7;
    doubleToBOOL greaterThanThreshold = ^(double x) {
      return (BOOL)(x > threshold); // cast required
    };

    // filter array of NSNumber using greaterThanThreshold block
    array = @[ @9.3, @2.3, @6.8, @8.2, @7.9, @7.2];
    NSLog(@"array = %@", array);
    array = [Foo filterArray:array usingBlock:[Foo wrapDoubleToBOOL:greaterThanThreshold]];
    NSLog(@"array = %@", array);
  }

  return 0;
}
