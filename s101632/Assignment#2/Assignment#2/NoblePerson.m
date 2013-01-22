//
//  NobelPerson.m
//  Assignment#2
//
//  Created by Jacob Espersen on 14/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import "NoblePerson.h"

@implementation NoblePerson

-(void)marry:(NoblePerson*)aSpouse andAssignButler:(Citizen*)butler{
    if([self impedimentToMarriage:aSpouse]){
        
        aSpouse.spouse = self;
        self.spouse = aSpouse;
        aSpouse.spouse = self;
        [self shareAssetsWith:aSpouse];
        self.butler = butler;
        aSpouse.butler = butler;
        
        }
}

- (void)shareAssetsWith:(NoblePerson *)spouse{
    NSNumber* share = [NSNumber numberWithInt:(([self.assets intValue]+[spouse.assets intValue])/2)];
    self.assets = share;
    spouse.assets = share;
}


@end
