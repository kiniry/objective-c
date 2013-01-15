//
//  main.m
//  Assignment2
//
//  Created by Markus Færevaag on 14.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "Nobleperson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Nobleperson *a = [[Nobleperson alloc] initWithName:@"Annicken"
                                                    andSex:Female
                                                    andAge:21];
        [a setButler:[[Citizen alloc] init]];
        [a setAssets:[NSNumber numberWithInt:1000001]];
        
        Nobleperson *m = [[Nobleperson alloc] initWithName:@"Markus"
                                            andSex:Male
                                            andAge:21];
        
        [a setAssets:[NSNumber numberWithInt:1000001]];
        
        
        [a marryTo:m];
        
        NSLog(@"%@ assets: %@", a.name, a.assets);
        
        [a setAssets:[NSNumber numberWithInt:6666666]];
        
        NSLog(@"%@ assets: %@", m.name, m.assets);
        
    }
    return 0;
}

