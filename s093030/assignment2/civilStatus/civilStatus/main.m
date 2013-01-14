//
//  main.m
//  civilStatus
//
//  Created by Søren Olofsson on 1/14/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"
#import "ExperimentNil.h"
#import "ExperimentMethodResolution.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // Initialize program with god, adam and eve
        NoblePerson *god = [NoblePerson alloc];
        god = [god init];
        
        god.name = @"God";
        Citizen *adam = [[Citizen alloc] initWithMother: god andFather: god andSex: true andName: @"Adam"];
        adam.age = [NSNumber numberWithFloat: 25];
        Citizen *eve = [[Citizen alloc] initWithMother: god andFather: god andSex: false andName: @"Eve"];
        eve.age = [NSNumber numberWithFloat: 25];
        
        // Now adam marries eve
        BOOL marriageSucceded = [adam marry:eve];
        
        // And if they both say yes, eve will give birth to Cain and Abel
        Citizen *cain, *abel;
        if(marriageSucceded)
        {
            NSLog(@"Citizen marriage between Adam and Eve succeeded");
            cain = [eve giveBirthToSpecificSex: true andNameChild:@"Cain"];
            abel = [eve giveBirthToSpecificSex: true andNameChild:@"Abel"];
        }
        
        // Let's see what the classes contain
        NSLog(@"%@", adam.description);
        NSLog(@"%@", eve.description);
        if(cain && abel)
        {
            NSLog(@"%@", cain.description);
            NSLog(@"%@", abel.description);
        }
        
        // What the bible did not tell though, was that god also created Charles and Emma Darwin
        NoblePerson *charlesDarwin = [[NoblePerson alloc] initWithMother:god andFather:god andSex:true andName: @"Charles Darwin"];
        charlesDarwin.age = [NSNumber numberWithFloat: 25];
        charlesDarwin.assets = [NSNumber numberWithFloat:1000000]; // Darwin was a rich man
        NoblePerson *emmaDarwin = [[NoblePerson alloc] initWithMother:god andFather:god andSex:false andName: @"Emma Darwin"];
        emmaDarwin.age = [NSNumber numberWithFloat: 25];
        emmaDarwin.assets = [NSNumber numberWithFloat:1000000]; // So was Emma
        
        // Who soon married Emma
        BOOL nobleMarriageSucceded = [charlesDarwin marry:emmaDarwin andHireButler:god];
        
        // If they both say yes to the wedding, Emma will give birth to three children
        Citizen *william, *anne, *mary;
        if(nobleMarriageSucceded)
        {
            NSLog(@"Noble marriage between Charles and Emma Darwin succeeded");
            william = [emmaDarwin giveBirthAndNameChild: @"William Erasmus Darwin"];
            anne = [emmaDarwin giveBirthAndNameChild: @"Anne Elizabeth Darwin"];
            mary = [emmaDarwin giveBirthAndNameChild: @"Mary Eleanor Darwin"];
        }
                
        // Let's see what the last classes contain
        NSLog(@"%@", charlesDarwin.description);
        NSLog(@"%@", emmaDarwin.description);
        if(william && anne && mary)
        {
            NSLog(@"%@", william.description);
            NSLog(@"%@", anne.description);
            NSLog(@"%@", mary.description);
        }
        
        // Run experiments now
        ExperimentNil *experimentNil = [[ExperimentNil alloc] init];
        [experimentNil run];
        
        ExperimentMethodResolution *experimentMethodResolution = [[ExperimentMethodResolution alloc] init];
        [experimentMethodResolution run];
        
    }
    return 0;
}

