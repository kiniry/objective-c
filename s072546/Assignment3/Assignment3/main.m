//
//  main.m
//  Assignment3
//
//  Created by Kim Gad Thomsen on 1/22/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CitizenDefensive.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        CitizenDefensive *a = [[CitizenDefensive alloc] initWithName:@"John" LastName:@"N" andSex:male];
        CitizenDefensive *b = [[CitizenDefensive alloc] initWithName:@"Niels" LastName:@"J" andSex:male];
        [a divorce];
        [a marry:b];

    }
    return 0;
}

