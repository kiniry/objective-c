//
//  main.m
//  Assignment2
//
//  Created by Kim Gad Thomsen on 1/11/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"Creates Citizen 1");
        Citizen *jean = [[Citizen alloc] initWithName:@"Jean Luc" andLastName:@"Picard"];
        [jean setSex:male];
        NSLog(@"%@",[jean info]);
        NSLog(@"Creates Citizen 2");
        Citizen *sevenofnine = [[Citizen alloc] initWithName:@"Seven of" andLastName:@"Nine"];
        [sevenofnine setSex:female];
        NSLog(@"%@",[sevenofnine info]);
        NSLog(@"Jean Marries SevenOfNine");
        [jean marry:sevenofnine];
        [jean info];
        NSString *info = [sevenofnine.spouse info];
        NSLog(@"%@", info);
        NSLog(@"They get a Noble child");
        NoblePerson *spock = [[NoblePerson alloc] initWithName:@"Spock" andLastName:@""];
        [spock setSex:male];
        [jean addChild:spock];
        [sevenofnine addChild:spock];
        NSLog(@"%@",[spock info]);
        NSLog(@"Things get weird and Spock wants to merry SevenOfNine");
        if (![spock marry:sevenofnine]) {
            NSLog(@"Marriage failed");
        }
        NSLog(@"Another nobleperson randomly appears");
        NoblePerson *robin = [[NoblePerson alloc] initWithName:@"Robin" andLastName:@"Lefler"];
        [robin setSex:female];
        NSLog(@"%@",[robin info]);
        
        
    }
    return 0;
}

