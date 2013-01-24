//
//  main.m
//  assignment2
//
//  Created by Magloire on 1/16/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoblePerson.h"


int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        
        Citizen *john = [[Citizen alloc] initWithFirstName:@"John" andLastName:@"Doe"];
        Citizen *mary = [[Citizen alloc] initWithFirstName:@"Mary" andLastName:@"Doe"];
        
        NoblePerson *nobleJohn = [[NoblePerson alloc]initWithFirstName:@"NobleJoh" andLastName:@"Doe"];
        NoblePerson *nobleMary = [[NoblePerson alloc] initWithFirstName:@"NobleMary" andLastName:@"Doe"];
        
        
        john.sex = male;
        mary.sex = female;
        
        john.age = 30;
        mary.age = 25;
        
        [john marry:mary];
        
        if (john.isSingle) {
            NSLog(@"John was supposed to be married");
        }else{
            NSLog(@"John is married to %@",john.spouse.firstName);
            NSLog(@"Mary is married to %@", mary.spouse.firstName);
        }
        
        nobleJohn.sex = male;
        nobleMary.sex = female;
        nobleJohn.assets = 50000;
        nobleMary.assets = 50000;
        
        [nobleJohn marry:nobleMary];
        if (nobleJohn.isSingle) {
            NSLog(@"Was supposed to be married to nobleMary");
        }else{
            NSLog(@"NobleJoh is married to %@", nobleJohn.spouse.firstName);
            NSLog(@"NobleMary is married to %@", nobleMary.spouse.firstName);
        }
        
        
        
        
    }
    return 0;
}

