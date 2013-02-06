//
//  main.m
//  Assignment4
//
//  Created by Kim Gad Thomsen on 2/4/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlockTests.h"
#import "InvocationTest.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BlockTests *bt = [[BlockTests alloc] init];
        [bt runTests];
        
        NSLog(@"*********************");
        InvocationTest *t = [[InvocationTest alloc] init];
        [t runTests];
        
        
    }
    return 0;
}

