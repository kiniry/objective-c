//
//  NoblePerson.m
//  assignment2
//
//  Created by Joachim on 16/01/13.
//  Copyright (c) 2013 Joachim. All rights reserved.
//

#import "NoblePerson.h"

const int weddingCost = 50000;

@implementation NoblePerson

@synthesize assets = _assets, butler = _butler;

-(void)marry:(NoblePerson*)nobleperson {
    [super marry:nobleperson];
    [self assetsAfterWedding:nobleperson];
    [self butlerAfterWedding:nobleperson];
}

-(BOOL)canMarry:(NoblePerson*)nobleperson {
    // Married noble people have to have a butler which is then shared
    return [super canMarry:nobleperson] && (self.butler || nobleperson.butler);
}


-(void)assetsAfterWedding:(NoblePerson*)nobleperson {
    int sharedAssets = (self.assets + nobleperson.assets - weddingCost)/2;
    nobleperson.assets = self.assets = sharedAssets;
}

-(void)butlerAfterWedding:(NoblePerson*)nobleperson {
    if(self.butler) {
        nobleperson.butler = self.butler;
    } else {
        self.butler = nobleperson.butler;
    }
}

-(NSString*)description {
    return [NSString stringWithFormat:
            @"%@Butler: %@\nAssets: %d\n",
            super.description,
            self.butler.name,
            self.assets
            ];
}

@end
