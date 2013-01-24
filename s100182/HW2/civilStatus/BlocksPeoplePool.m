//
//  BlocksPeoplePool.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 20/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "BlocksPeoplePool.h"

@implementation BlocksPeoplePool

- (id)init
{
    self = [super init];
    if (self) {
        self.person1 = [[Citizen alloc] initWithFirstName:@"Matthis"
                                              andLastName:@"Baltzersen"
                                                   andAge:[NSNumber numberWithInt:(int)2]];
    }
    return self;
}

- (Citizen *)choosePersonWithBlock:(void (^)(Citizen *person, BOOL *stop))block {
    BOOL stop = NO;
    NSLog(@"%@",self.person1);
    block(self.person1, &stop);

    return self.person1;
}

@end
