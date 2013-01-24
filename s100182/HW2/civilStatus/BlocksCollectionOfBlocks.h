//
//  BlocksCollectionOfBlocks.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 21/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//
/*
 THIS DOES NOT WORK YET!
 The idea was to create a dictionary of blocks and execute them
 one at a time. I only got the a single block to work.
 I have tried many things with this class so it's somewhat of a mess.
 */
#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "BlocksPeoplePool.h"
#import "BlocksPeoplePool.h"

typedef void (^blockDisplayChoice_t) (Citizen *person, BOOL *stop);

@interface BlocksCollectionOfBlocks : NSObject

- (void)goOverDictOfBlock:(NSMutableDictionary *)dictOfBlock;

@property NSMutableDictionary *blockDisplays;
@end
