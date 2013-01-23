//
//  main.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 10/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "NoblePerson.h"
#import "LotteryController.h"
#import "BlocksPeoplePool.h"
#import "BlocksCollectionOfBlocks.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
                                
        Citizen *jesper = [[Citizen alloc] initWithFirstName:@"Jesper"
                                                  andLastName:@"Baltzersen"
                                                       andAge:[NSNumber numberWithInt:(int)33]];

        Citizen *michela = [[Citizen alloc] initWithFirstName:@"Michela"
                                                  andLastName:@"Glyming"
                                                       andAge:[NSNumber numberWithInt:(int)30]];

        Citizen *matthis = [[Citizen alloc] initWithFirstName:@"Matthis"
                                                  andLastName:@"Baltzersen"
                                                       andAge:[NSNumber numberWithInt:(int)2]];
        
        jesper.sex = male;
        michela.sex = female;
        matthis.sex = male;
        
        [jesper marry:michela];
        [jesper addChild:matthis];
        [michela addChild:matthis];
        
        NSLog(@"\n%@", jesper);
        NSLog(@"\n%@", michela);
        NSLog(@"\n%@", matthis);
        
        NoblePerson *person4 = [[NoblePerson alloc] initWithFirstName:@"Prins"
                                                          andLastName:@"Henrik"
                                                               andAge:[NSNumber numberWithInt:(int)200]];
        
        NoblePerson *person5 = [[NoblePerson alloc] initWithFirstName:@"Dronning"
                                                          andLastName:@"Magrethe"
                                                               andAge:[NSNumber numberWithInt:(int)200]];
    
        person4.sex = male;
        person5.sex = female;
        
        person4.assets = @100;
        person5.assets = @251;
        
        person4.butler = jesper;
        
        [person4 marry:person5];
        
        NSLog(@"\n%@", person4);
        NSLog(@"\n%@", person5);

        NSLog(@"****************PROTOCOL TESTING******************");
        
       //  Testing Protocol
       
        LotteryController *lotCont = [[LotteryController alloc] init];
        
        [lotCont.lotView displayWinnerName];
        
        NSLog(@"*******************BLOCK TESTING******************");
        
        BlocksPeoplePool *inst = [[BlocksPeoplePool alloc] init];
        [inst choosePersonWithBlock:^(Citizen *person, BOOL *stop) {
            NSLog(@"Block %@",person.firstName);
        }];
        
        BlocksCollectionOfBlocks *bcb = [[BlocksCollectionOfBlocks alloc] init];
        NSLog(@"%@", bcb.blockDisplays);
        [bcb goOverDictOfBlock:bcb.blockDisplays];
        
    }
    return 0;
}

