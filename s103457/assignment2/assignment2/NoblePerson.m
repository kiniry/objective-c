//
//  NobelPerson.m
//  assignment2
//
//  Created by Anders Emil Nielsen on 11/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import "NoblePerson.h"

@interface NoblePerson ()

@property NoblePerson *spouse;

@end

static int costOfStyledWedding = 50000;

@implementation NoblePerson

-(void)marry:(NoblePerson *)sweetheart
{
    [self shareButlerWith:sweetheart];
    [self payForMarriageAndshareAssetsWith:sweetheart];
    [super marry:sweetheart];
    
}

-(void)shareButlerWith:(NoblePerson *)sweetheart
{
    if (self.butler) {
        [sweetheart setButler:self.butler];
    } else if (sweetheart.butler) {
        [self setButler:sweetheart.butler];
    } else {
        NSLog(@"Can't share butler, no one owns any");
    }
}

-(void)payForMarriageAndshareAssetsWith:(NoblePerson *)sweetheart
{
    NSNumber *share = [NSNumber numberWithInt:(([self.assets intValue] + [sweetheart.assets intValue] - costOfStyledWedding)/2)];
    [self setAssets:share];
    [sweetheart setAssets:share];
}

-(NSString *)description
{
    return [NSString stringWithFormat: @"%@\nButler: %@\nAssets: %@\n",
            [super description],
            self.butler.name,
            self.assets
    ];
}

@end
