//
//  main.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/11/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Citizen *c = [[Citizen alloc] initWithName:@"Jean Luc" andLastName:@"Picard"];
        [c setSex:male];
        
        
        
        NSString *info = [c info];
        NSLog(@"%@", info);
    }
    return 0;
}

