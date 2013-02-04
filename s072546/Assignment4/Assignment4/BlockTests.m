//
//  BlockTests.m
//  Assignment4
//
//  Created by Kim Gad Thomsen on 2/4/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "BlockTests.h"
#import "TestObject.h"
@implementation BlockTests


-(void) runTests {
    NSDate *date = [NSDate date];
    double time;
    TestObject *t = [[TestObject alloc] init];
    
    //First time NSLog
    for(int i = 0; i < 100; i++) {
        NSLog(@"");
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"NSLog took: %.2f ms to call 100 times", time);
    date = [NSDate date];
    //First time a method call
    for(int i = 0; i < 100; i++) {
        [t testCall];
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"NSLog in a class method takes %.2f ms to call 100 times", time);
    
    //Now it is know what the function costs in time based on the calls above
    // Lets take a look on the same when inside a block
    
    void(^blockTest)() = ^{
        NSLog(@"");
    };
    
    date = [NSDate date];
    for(int i = 0; i < 100; i++) {
        blockTest();
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"NSLog in a block takes %.2f ms to call 100 times", time);
    void(^blockTest2)() = ^{
        [t testCall];
    };
    
    date = [NSDate date];
    for(int i = 0; i < 100; i++) {
        blockTest2();
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"NSLog in class method a block takes %.2f ms to call 100 times", time);
    
    
    void(^blockTest3)() = ^{
        int a = 1;
        int b = 2;
        int c = a+b;
    };
    
    date = [NSDate date];
    for(int i = 0; i < 1000; i++) {
        blockTest3();
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Adding to locally integers inside block took %.3f ms", time);
    int a = 1;
    int b = 2;
    void(^blockTest4)() = ^{
        int d = a;
        int e = b;
        int c = d+e;
    };
    
    date = [NSDate date];
    for(int i = 0; i < 1000; i++) {
        blockTest4();
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Adding to external integers inside block took %.3f ms", time);
    
    void(^blockTest5)() = ^{
        NSString *s = @"ASDDASDSADAS";
        NSString *g = @"ASDDASDSADAS";
        NSString *d = @"ASDDASDSADAS";
        NSArray *a1 = {@"a", @"b"};
        NSArray *a2 = {@"a", @"b"};
        NSArray *a3 = {@"a", @"b"};
    };
    
    date = [NSDate date];
    for(int i = 0; i < 1000; i++) {
        blockTest5();
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Calling a block with 3 string and 3 arrays 1000 times took %.3f ms", time);
    
    void(^blockTest6)() = ^{
        NSString *s = @"ASDDASDSADAS";
        NSString *g = @"ASDDASDSADAS";
        NSString *d = @"ASDDASDSADAS";
        NSArray *a1 = {@"a", @"b"};
        NSArray *a2 = {@"a", @"b"};
        NSArray *a3 = {@"a", @"b"};
        NSArray *a4 = {@"a", @"b"};
        NSArray *a5 = {@"a", @"b"};
        NSArray *a6 = {@"a", @"b"};
        NSArray *a7 = {@"a", @"b"};
        NSArray *a8 = {@"a", @"b"};
        NSArray *a9 = {@"a", @"b"};
        
    };
    
    date = [NSDate date];
    for(int i = 0; i < 1000; i++) {
        blockTest6();
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Calling a block with 3 mutablestring and 9 arrays 1000 times took %.3f ms", time);
    
}

@end
