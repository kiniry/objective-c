#import <Foundation/Foundation.h>

// main.m
int main(int argc, const char *argv[]) {
    @autoreleasepool {
      int primitiveA = 123;
      NSNumber* a = [NSNumber numberWithInt:primitiveA];

      double primitiveB = 205.23;
      NSNumber* b = @( primitiveB / 4.0 ); // boxed expression

      float primitiveC = 5.2;
      NSNumber* c = [NSNumber numberWithFloat:primitiveC];

      NSNumber* d = @YES; // literal

      double primitiveE = [a intValue] / [b doubleValue]; // unboxing
      NSNumber* e = @( primitiveE );

      NSMutableArray* array = [NSMutableArray array];
      [array addObject:a];
      [array addObject:b];
      [array addObject:c];
      [array addObject:d];
      [array addObject:e];

      if ([d boolValue]) {
        NSLog(@"array = %@", array);
      }
    }

    return 0;
}
