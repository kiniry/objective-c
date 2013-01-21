//
//  main.m
//  Assignment4
//
//  Created by Philip Nielsen on 21/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringManipulation.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *str1 = @"foundation";
        NSString *str2 = @"foundations";
        
        int dist = [StringManipulation distanceBetween:str1 And:str2];
        
        NSLog(@"The Levenshtein distance between %@ and %@ is %d.", str1, str2, dist);
        
    }
    return 0;
}

