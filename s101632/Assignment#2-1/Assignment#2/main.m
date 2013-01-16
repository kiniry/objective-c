//
//  main.m
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NoblePerson* tony = [[NoblePerson alloc] initWithFirstName:@"Tony" sex:male age:@45];
        NoblePerson* carmela = [[NoblePerson alloc] initWithFirstName:@"Carmela" sex:female age:@42];
        NoblePerson* meadow = [[NoblePerson alloc] initWithFirstName:@"Meadow" sex:female age:@17];
        Citizen* christopher = [[Citizen alloc] initWithFirstName:@"Christopher" sex:male age:@35];
        Citizen* adriana = [[Citizen alloc] initWithFirstName:@"Adriana" sex:female age:@32];
        tony.assets = @5000;
        carmela.assets = @3000;
        meadow.mother = carmela;
        meadow.father = tony;
        [tony marry:carmela andAssignButler:christopher];
        [tony.Children addObject:meadow];
        [christopher marry:adriana];
        
        
    }
    return 0;
}

