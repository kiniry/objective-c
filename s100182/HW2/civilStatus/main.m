//
//  main.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 10/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
                        
        Citizen *person1 = [[Citizen alloc] initWithFirstName:@"Jesper"
                                                  andLastName:@"Baltzersen"
                                                       andAge:[NSNumber numberWithInt:(int)33]];

        Citizen *person2 = [[Citizen alloc] initWithFirstName:@"Michela"
                                                  andLastName:@"Glyming"
                                                       andAge:[NSNumber numberWithInt:(int)30]];

        Citizen *person3 = [[Citizen alloc] initWithFirstName:@"Matthis"
                                                  andLastName:@"Baltzersen"
                                                       andAge:[NSNumber numberWithInt:(int)2]];
        
        person1.sex = male;
        person2.sex = female;
        person3.sex = male;
        
        [person1 marry:person2];
        [person1 addChild:person3];
        [person2 addChild:person3];
        
        NSLog(@"\n%@", person1);
        NSLog(@"\n%@", person2);
        NSLog(@"\n%@", person3);
        }
    return 0;  
}

