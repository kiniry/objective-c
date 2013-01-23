//
//  PeopleDB.m
//  assignment2
//
//  Created by Magloire on 1/21/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "PeopleDB.h"

@implementation PeopleDB
@synthesize people;

-(NSMutableSet *) selectNoble{
    return [self selectNobleWithBlock];
}

-(NSMutableSet *) selectNobleWithBlock{
    BOOL (^nobleBlock)(Citizen *) = ^(Citizen *c){
        return [c isKindOfClass:[NoblePerson class]];
    };
    return [self selectWithBlock:nobleBlock];
}

-(NSMutableSet *) selectWithBlock:(BOOL (^)(Citizen *))predicate{
    NSMutableSet *returnSet = [NSMutableSet set];
    for (Citizen *c in self.people) {
        if (predicate(c)) {
            [returnSet addObject:c];
        }
    }
    return returnSet;
}


-(void)removeSingles{
    [self removeWithBlock:^(Citizen *c){
        return c.isSingle;
    }];
}


-(void)removeWithBlock:(BOOL (^)(Citizen *))criteria{
    NSMutableSet *peopleToRemove = [self selectWithBlock:criteria];
    [self.people minusSet:peopleToRemove];
}
@end
