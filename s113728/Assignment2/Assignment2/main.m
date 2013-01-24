//
//  main.m
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assignment2AppDelegate.h"

// For testing if UI gets implemented, no need for high coupling
#import "Citizen.h"
#import "NoblePerson.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
        NoblePerson* leCerveau = [[NoblePerson alloc] initWithName:@"Thomas Andersen" andSex:@"male" andAgeAsInt:19];
        
        NoblePerson* jubJubBird = [[NoblePerson alloc] initWithName:@"John" andSex:@"male" andAgeAsInt:22];
        
        Citizen* dixie = [[Citizen alloc] initWithName:@"Nitecrawler" andSex:@"male" andAgeAsInt:24];
        
        Citizen* zephyr = [[Citizen alloc] initWithName:@"Descore" andSex:@"male" andAgeAsInt:32];
        
        Citizen* acidBurn = [[Citizen alloc] initWithName:@"Kate" andSex:@"female" andAgeAsInt:22];
        
        Citizen* donKnuth = [[Citizen alloc] initWithName:@"Donald Knuth" andSex:@"male" andAgeAsInt:74];
        
        [leCerveau marry:acidBurn];
        [dixie marry:acidBurn];
        
        // UI not working yet!
        /*
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([Assignment2AppDelegate class]));
        */
    }
}
