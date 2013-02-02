//
//  main.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProcessBuilder.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        ProcessBuilder *t = [ProcessBuilder new];
        [t hejsa:@"test1", @"test2", @"test3", @"test4", nil];
    }
    return 0;
}

