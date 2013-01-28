//
//  NoblePerson.m
//  Assignment2.1
//
//  Created by Emil Klarskov Kristensen on 1/16/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

-(bool)marry:(NoblePerson *)noblePerson
{
    if ([noblePerson isKindOfClass:[NoblePerson class]]) {
        
        // Can they afford the wedding?
        if ((self.numberOfAssets + noblePerson.numberOfAssets) < 20000) return NO;
        
        // Can only get married if both are single
        if (!self.isSingle || !noblePerson.isSingle) return NO;
        
        if ([super marry:noblePerson]) {
            // Share butler if they have any
            if (self.butler != nil) {
                noblePerson.butler = self.butler;
            } else if(noblePerson.butler != nil) {
                self.butler = noblePerson.butler;
            }
            
            // Share assets
            NSInteger costOfWedding = 20000;
            NSInteger sharedAssets = self.numberOfAssets + noblePerson.numberOfAssets - costOfWedding;
            self.numberOfAssets = sharedAssets;
            noblePerson.numberOfAssets = sharedAssets;
            
            return YES;
        }
    }
    
    return NO;
}

@end
