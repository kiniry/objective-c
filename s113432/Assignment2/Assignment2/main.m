//
//  main.m
//  Assignment2
//
//  Created by Bastian Buch on 1/22/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BONAppDelegate.h"
#import "BONCitizen.h"
#import "BONNoble.h"
#import "BONEngineer.h"
#import "BONCeo.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        BONCitizen *genericFemaleNPC = [[BONCitizen alloc]init];
        BONCitizen *genericFemalePC = [[BONCitizen alloc]init];
        BONCitizen *theOneFreeMan = [[BONCitizen alloc]init];
        BONNoble *theUnknownNumber = [[BONNoble alloc]init];
        BONNoble *hendesMajestaet = [[BONNoble alloc]init];
        genericFemaleNPC.name = @"Alyx_Vance";
        genericFemalePC.name = @"Chell_Doe";
        theOneFreeMan.name = @"Gordon_Freeman";
        theUnknownNumber.name = @"Half_Life3";
        hendesMajestaet.name = @"Margrethe";
        genericFemaleNPC.sex = @"female";
        genericFemalePC.sex = @"female";
        theOneFreeMan.sex = @"male";
        theUnknownNumber.sex = @"male";
        hendesMajestaet.sex = @ "female";
        genericFemaleNPC.age = 27;
        genericFemalePC.age = 24;
        theOneFreeMan.age = 42;
        theUnknownNumber.age = -9001;
        hendesMajestaet.age = 72;
        theUnknownNumber.parent1 = genericFemaleNPC;
        theUnknownNumber.parent2 = theOneFreeMan;
        
        if ([genericFemaleNPC marry:genericFemalePC]) {
            NSLog(@"%@ is now married to %@, should fail due to same sex",genericFemaleNPC.name ,genericFemaleNPC.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should also fail due to same sex!");
        if ([genericFemaleNPC marry:theOneFreeMan]) {
            NSLog(@"%@ is now married to %@, should succeed",genericFemaleNPC.name ,genericFemaleNPC.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should succeed!");
        if ([theOneFreeMan marry:genericFemalePC]) {
            NSLog(@"%@ is now married to %@, should fail due to already married",theOneFreeMan.name ,theOneFreeMan.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should fail due to already married!");
        if ([hendesMajestaet marry:theUnknownNumber]) {
            NSLog(@"%@ is now married to %@, should fail due to age and assets",hendesMajestaet.name ,hendesMajestaet.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should fail due to age and assets!");
        theUnknownNumber.age = 20;
        theUnknownNumber.assets = 70000;
        hendesMajestaet.assets = 60000;
        if ([hendesMajestaet marry:theUnknownNumber]) {
            NSLog(@"%@ is now married to %@, should succeed",hendesMajestaet.name ,hendesMajestaet.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should succeed!");
        
        
        if ([genericFemalePC divorce]) {
            NSLog(@"%@ is now divorced, should fail due to not being married",hendesMajestaet.name);
        } else {
            NSLog(@"The divorce was unsuccessfull, should failed!");
        }
        if ([genericFemaleNPC divorce]) {
            NSLog(@"%@ is now divorced, should suceed",hendesMajestaet.name);
        } else {
            NSLog(@"The divorce was unsuccessfull, should suceed!");
        }
        if ([hendesMajestaet divorce]) {
            NSLog(@"%@ is now divorced, should suceed",hendesMajestaet.name);
        } else {
            NSLog(@"The divorce was unsuccessfull, should suceed!");
        }
        
        if (hendesMajestaet.assets == 65000 && theUnknownNumber.assets == 65000){
            NSLog(@"Divorce properly splits assets");
        }
        else NSLog(@"Somethings fishy here!");
        
        
        BONCeo *bastianovitj = [[BONCeo alloc]init];
        bastianovitj.name = @"Bast";
        bastianovitj.age = 56;
         bastianovitj.sex = @"Nope";
        bastianovitj.parent1 = hendesMajestaet;
        bastianovitj.parent2 = theUnknownNumber;
        
        BONCeo *yourMother = [[BONCeo alloc]init];
        yourMother.name = @"Din Mor";
        yourMother.age = 9001;
        yourMother.sex = @"Always";
        yourMother.parent1 = hendesMajestaet;
        yourMother.parent2 = theUnknownNumber;
        
        if ([bastianovitj marry:yourMother]) {
            NSLog(@"%@ is now married to %@, should fail due to same parents",bastianovitj.name ,bastianovitj.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should also fail due to same parents!");
        yourMother.parent1 = nil;
        yourMother.parent2 = nil;
        if ([bastianovitj marry:yourMother]) {
            NSLog(@"%@ is now married to %@, should suceed",bastianovitj.name ,bastianovitj.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should succeeed");
        
        BONEngineer *theAnswerToLifeTheUniverseAndEverything = [[BONEngineer alloc]init];
        theAnswerToLifeTheUniverseAndEverything.name = @"ToOgFyrre";
        theAnswerToLifeTheUniverseAndEverything.age = 42;
        theAnswerToLifeTheUniverseAndEverything.sex = @"Classified";
        theAnswerToLifeTheUniverseAndEverything.parent1 = hendesMajestaet;
        theAnswerToLifeTheUniverseAndEverything.parent2 = theUnknownNumber;
        
        BONEngineer *theRarestLifeformInTheUniverse = [[BONEngineer alloc]init];
        theRarestLifeformInTheUniverse.name = @"Jane Doe";
        theRarestLifeformInTheUniverse.age = 42;
        theRarestLifeformInTheUniverse.sex = @"female";
        
        if ([theAnswerToLifeTheUniverseAndEverything marry:theRarestLifeformInTheUniverse]) {
            NSLog(@"%@ is now married to %@, should suceed",theAnswerToLifeTheUniverseAndEverything.name ,theAnswerToLifeTheUniverseAndEverything.spouse.name);
        }
        else NSLog(@"The marriage wasnt succesfull, should succeeed");
       
        if ([theRarestLifeformInTheUniverse workIsDone]){
            NSLog(@"Engineers can finish their work. Except this time, they are not supposed to. Error!");
        } else {
            NSLog(@"Engineer did not finish work. Expected, check log for prior error message.");
        }
        
        if ([[theRarestLifeformInTheUniverse work] isEqualToString: @"Bullshit"]){
            NSLog(@"Engineers can work.");
        } else {
             NSLog(@"Engineers cannot work. Error!");
        }
        
        if ([theRarestLifeformInTheUniverse workIsDone]){
            NSLog(@"Engineers can finish their work. As intended, this time.");
        } else {
            NSLog(@"Engineer did not finish work. Not supposed to happen this time.");
        }
        
        if ([theRarestLifeformInTheUniverse trustMeIAmAnEngineer]){
            NSLog(@"Engineers are to be trusted.");
        } else {
            NSLog(@"Engineer cannot be trusted. Error!");
        }
        
        
    }
    return 0;
}