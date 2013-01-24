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

        // Tests
        Nobleperson *a = [[Nobleperson alloc] initWithName:@"Annicken"
                                                    andSex:Female
                                                    andAge:21];
        [a setButler:[[Citizen alloc] init]];
        [a setAssets:[NSNumber numberWithInt:1000000]];
        
        Nobleperson *m = [[Nobleperson alloc] initWithName:@"Markus"
                                            andSex:Male
                                            andAge:21];
        
        [m setAssets:[NSNumber numberWithInt:3000000]];
        
        
        [a marry:m];
        
        NSLog(@"%@ assets: %@", a.name, a.assets);
        NSLog(@"%@ assets: %@", m.name, m.assets);
        
        [a setAssets:[NSNumber numberWithInt:10000000]];
        
        NSLog(@"%@ assets: %@", m.name, m.assets);
        
    }
    return 0;
}

