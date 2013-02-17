//
//  main.m
//  Assignment2_1
//
//  Created by Carsten Nilsson on 16/01/13.
//  Copyright (c) 2013 Carsten Nilsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

// Removes timestamps from console to make it clean.
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Scenario with
        Citizen *aFather = [Citizen alloc];
        aFather = [aFather initWithName:@"John Sr." Sex:@"Male" Age:45];
        NSLog(@"%@",aFather);
        
        Citizen *aMother = [Citizen alloc];
        aMother = [aMother initWithName:@"Diana" Sex:@"Female" Age:42];
        NSLog(@"%@",aMother);
        
        // Marry the two
        [aFather marryWith:aMother];
        
        // Spouse has now been set
        NSLog(@"%@",aFather);
        NSLog(@"%@",aMother);
        
        // Mother divorces
        [aMother divorce];
        NSLog(@"%@",aFather);
        NSLog(@"%@",aMother);
        
        
        
        // Now Noble people
        NoblePerson *aKing = [NoblePerson alloc];
        aKing = [aKing initWithName:@"George VI" Sex:@"Male" Age:35 Assets:1000000 Butler:aFather];
        NoblePerson *aQueen = [NoblePerson alloc];
        aQueen = [aQueen initWithName:@"Elizabeth" Sex:@"Female" Age:25 Assets:500000 Butler:aMother];
        
        // Marry them
        [aKing marryWith:aQueen];
        NSLog(@"%@",aKing);
        NSLog(@"%@",aQueen);
        
        [aQueen divorce];
        NSLog(@"%@",aKing);
        NSLog(@"%@",aQueen);
        
        // Now try to marry noble person with normal citizen
        [aKing marryWith:aMother];
        // Should not be allowed
        NSLog(@"%@",aKing);
        NSLog(@"%@",aMother);

        
    }
    return 0;
}

