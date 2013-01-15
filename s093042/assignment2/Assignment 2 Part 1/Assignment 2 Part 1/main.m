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
        Citizen *onePerson = [[Citizen alloc] initWithDefaultInfo:@"John Foo" :@"male" :35];
        
        Citizen *anotherPerson = [[Citizen alloc] initWithDefaultInfo:@"Marry Bar" :@"female" :35];
    
        // marry and then divorce two regular people
        [onePerson marry:anotherPerson];
        [anotherPerson divorce];
        
        
        // Noble people
        NoblePerson *oneNoblePerson = [[NoblePerson alloc] initWithDefaultInfo:@"Henry Bar" :@"male" :35 ];
        
        NoblePerson *anotherNoblePerson = [[NoblePerson alloc] initWithDefaultInfo:@"Elizabeth Foo" :@"female" :35];

        // marry and then divorce two noble people
        [oneNoblePerson marry:anotherNoblePerson];
        [anotherNoblePerson divorce];
        
        // try marry a noble person with a regular person...
        [oneNoblePerson marry:anotherPerson];

    }
    return 0;
}

