//
//  main.m
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen* a = [[Citizen alloc] initWithName:@"Annicken Bruu"
                                            andSex:Female
                                            andAge:21
                                         andSingle:NO];
        
        Citizen* m = [[Citizen alloc] initWithName:@"Markus Færevaag"
                                            andSex:Male
                                            andAge:21
                                         andSingle:NO];
        [a marry:m];
        
        NSLog(@"%@", a.spouse.name);
        
    }
    return 0;
}

