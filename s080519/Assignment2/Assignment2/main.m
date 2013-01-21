//
//  main.m
//  Assignment2
//
//  Created by Mikkel Johnsen on 14/01/13.
//  Copyright (c) 2013 Mikkel Johnsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Citizen *child = [[Citizen alloc] initWithName:@"Baby Doe" Age:2 Sex:M Children:nil];
        
        NSSet *kids = [NSSet setWithArray:@[ child ]];
        
        Citizen *john = [[Citizen alloc] initWithName:@"John Doe" Age:40 Sex:M Children:kids];
        Citizen *jane = [[Citizen alloc] initWithName:@"Jane Doe" Age:38 Sex:F Children:kids];
        
        NSLog(@"%@", john);
        NSLog(@"%@", jane);
        NSLog(@"%@", child);
        
        
        // Let them be married! Huuurrraaaaayy!!!
        [john marry:jane];
        NSLog(@"John marries Jane!");
        NSLog(@"%@", john);
        NSLog(@"%@", jane);
        NSLog(@"%@", child);
        
        // Okay, he didn't earn enough money, she's out of the door.
        [jane divorce];
        NSLog(@"Jane left John.....");
        NSLog(@"%@", john);
        NSLog(@"%@", jane);
        NSLog(@"%@", child);
        
        // Create a noble person and have him hire john
        NoblePerson *test = [[NoblePerson alloc] initWithName:@"test" Age:555 Sex:M Children:nil];
        [test setCapital:50000];
        [test setButler:john];
        
        NSLog(@"%@", test);
    }
    return 0;
}