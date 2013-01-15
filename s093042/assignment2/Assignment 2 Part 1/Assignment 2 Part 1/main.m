//
//  main.m
//  Assignment 2 Part 1
//
//  Created by Sivanujann Selliah on 14/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Regular people
        Citizen *onePerson = [[Citizen alloc] initWithName:@"John Doe" Sex:@"male" Age:35];
        NSLog(@"%@", onePerson);
        Citizen *anotherPerson = [[Citizen alloc] initWithName:@"Marry Bar" Sex:@"female" Age:35];
        NSLog(@"%@", anotherPerson);
        // marry and then divorce two regular people
        [onePerson marry:anotherPerson];
        NSLog(@"%@", onePerson);
        NSLog(@"%@", anotherPerson);
        [anotherPerson divorce];
        NSLog(@"%@", onePerson);
        NSLog(@"%@", anotherPerson);
        
        
        // Noble people
        NoblePerson *oneNoblePerson = [[NoblePerson alloc] initWithName:@"Henry Bar" Sex:@"male" Age:35 Assets:2500000 Butler:onePerson ];
        NSLog(@"%@", oneNoblePerson);
        
        NoblePerson *anotherNoblePerson = [[NoblePerson alloc] initWithName:@"Elizabeth Foo" Sex:@"female" Age:35 Assets:3500000 Butler:anotherPerson];
        NSLog(@"%@", anotherNoblePerson);

        // marry and then divorce two noble people
        [oneNoblePerson marry:anotherNoblePerson];
        NSLog(@"%@", oneNoblePerson);
        NSLog(@"%@", anotherNoblePerson);
        [anotherNoblePerson divorce];
        NSLog(@"%@", oneNoblePerson);
        NSLog(@"%@", anotherNoblePerson);
        
        // try marry a noble person with a regular person...
        [oneNoblePerson marry:anotherPerson];
        NSLog(@"%@", oneNoblePerson);
        NSLog(@"%@", anotherPerson);

    }
    return 0;
}

