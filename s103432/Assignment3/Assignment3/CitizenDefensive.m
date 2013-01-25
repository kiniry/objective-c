//
//  CitizenDefensive.m
//  Assignment3
//
//  Created by David Harboe on 1/24/13.
//  Copyright (c) 2013 David Harboe. All rights reserved.
//

#import "CitizenDefensive.h"

@implementation CitizenDefensive

-(void) marry:(Citizen *)spouse
{
    if(!self.canMarry) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                reason:[NSString stringWithFormat:@"marry defensive fail: wrong relationship status must be inRelationship but is %@", self.relationshipStatusString]
                userInfo:nil];
    }
    return [super marry:spouse];
    if(!(self.spouse == spouse && spouse.spouse == self)) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                reason:[NSString stringWithFormat:@"marry defensive fail: wrong marriage"]
                userInfo:nil];
    }
}

-(void) divorce
{
    if(!self.isSingle) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException
                reason:[NSString stringWithFormat:@"divorce defensive fail: wrong relationship status must be single but is %@", self.relationshipStatusString]
                userInfo:nil];
    }
    return [super divorce];
}

@end
