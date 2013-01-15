//
//  main.m
//  Assignment2-1
//
//  Created by Philip Nielsen on 14/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Citizen *father = [[Citizen alloc] initWithName:@"Anakin Skywalker" sex:male age:67];
        Citizen *mother = [[Citizen alloc] initWithName:@"Padme Amidala" sex:female age:74];
        
        [father marryToCitizen:mother];
        
        Citizen *luke = [[Citizen alloc] initWithName:@"Luke Skywalker" sex:male age:34 parents:@[father, mother]];
        Citizen *leia = [[Citizen alloc] initWithName:@"Leia Organa" sex:female age:34 parents:@[father, mother]];
        
        // Allowed
        [father setChildren:@[luke, leia]];
        [mother setChildren:@[luke, leia]];
        
        // Not allowed
        [mother setChildren:@[father]];
        
        // Actually allowed
        [luke marryToCitizen:leia];
        
        // Not allowed
        [father marryToCitizen:leia];
        
        // Should be the case
        NSLog(@"Father's spouse's spouse is himself: %@", [father.spouse.spouse isEqualTo:father] ? @"YES" : @"NO");
        
        NSLog(@"\n");
        
        // ----------------------------------------------------------------------------------------------------------
        
        NoblePerson *yoda = [[NoblePerson alloc] initWithName:@"Yoda" sex:male age:881 assets:69403353];
        NoblePerson *yaddle = [[NoblePerson alloc] initWithName:@"Yaddle" sex:female age:765 assets:2443634];
        
        [yoda setButler:luke];
        [yaddle setButler:leia];
        
        [yoda marryToCitizen:yaddle];
        
    }
    return 0;
}