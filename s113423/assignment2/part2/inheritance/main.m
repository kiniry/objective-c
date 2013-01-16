#import "Base.h"
#import "Derived.h"

// main.m
int main(int argc, const char* argv[]) {
  @autoreleasepool {
    Base* base = [[Base alloc] init];
    Derived* derived = [[Derived alloc] init];

    [base methodA]; // methodA of Base will call methodB of Base
    NSLog(@" ");
    [derived methodA]; // methodA of Base will call methodB of Derived
  }

  return 0;
}
