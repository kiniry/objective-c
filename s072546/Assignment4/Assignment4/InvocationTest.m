//
//  InvocationTest.m
//  Assignment4
//
//  Created by Kim Gad Thomsen on 2/4/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "InvocationTest.h"
#import "TestObject.h"

@implementation InvocationTest

-(void) runTests {
    NSDate *date = [NSDate date];
    double time;
    TestObject *t = [[TestObject alloc] init];
    
    date = [NSDate date];
    for(int i = 0; i < 100; i++) {
        [t testCall];
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Method invocation: %.2f ms to call 100 times", time);

    date = [NSDate date];
    for(int i = 0; i < 100; i++) {
        [t performSelector:@selector(testCall)];
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Method performselector: %.2f ms to call 100 times", time);
    
    date = [NSDate date];
    for(int i = 0; i < 100; i++) {
        [[t class] respondsToSelector:@selector(testCall)];
    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Class selector: %.2f ms to call 100 times", time);
    
    date = [NSDate date];
    for(int i = 0; i < 100; i++) {
        if([t respondsToSelector:@selector(testCall)]) {
            if ([t isKindOfClass:[TestObject class]]){
                 [t testCall];
            }
        }

    }
    time = [date timeIntervalSinceNow] * -1000;
    NSLog(@"Reflection on first call (putting it all together): %.2f ms to call 100 times", time);
    
}

@end
