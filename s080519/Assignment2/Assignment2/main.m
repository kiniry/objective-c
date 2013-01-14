//
//  main.m
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *john = [[Citizen alloc] initWithName:@"John Doe" AndAge:40 AndSex:M];
        Citizen *jane = [[Citizen alloc] initWithName:@"Jane Doe" AndAge:38 AndSex:F];
        
        NSLog(@"%@", john);
        NSLog(@"%@", jane);
        
        
        // Let them be married! Huuurrraaaaayy!!!
        [john marry:jane];
        NSLog(@"John marries Jane!");
        NSLog(@"%@", john);
        NSLog(@"%@", jane);
        
        
        // Okay, he didn't earn enough money, she's out of the door.
        [jane divorce];
        NSLog(@"Jane left John.....");
        NSLog(@"%@", john);
        NSLog(@"%@", jane);
    }
    return 0;
}