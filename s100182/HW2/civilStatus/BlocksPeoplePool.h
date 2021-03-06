//
//  BlocksPeoplePool.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 20/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface BlocksPeoplePool : NSObject

- (Citizen *)choosePersonWithBlock : (void(^)(Citizen *person, BOOL *stop))block;
@property Citizen *person1;
@end
