//
//  BlocksCollectionOfBlocks.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 21/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"
#import "BlocksPeoplePool.h"
#import "BlocksPeoplePool.h"

typedef void (^blockDisplayChoice_t) (Citizen *person, BOOL *stop);

@interface BlocksCollectionOfBlocks : NSObject

- (void)goOverDictOfBlock:(NSMutableDictionary *)dictOfBlock;

@property NSMutableDictionary *blockDisplays;
@end
