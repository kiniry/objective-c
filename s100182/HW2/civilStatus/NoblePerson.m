//
//  NoblePerson.m
//  civilStatus
//
//  Created by Jesper Baltzersen on 15/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import "NoblePerson.h"


@implementation NoblePerson

- (void)marry:(NoblePerson *)aSpouse
{
    if ([aSpouse class] == [NoblePerson class] &&       //if aSpouse is of type NoblePerson
        (self.butler != nil || aSpouse.butler != nil))  //Either self or spouse must have a butler
    {
        [NoblePerson shareAssetsBetweenSpouseOne:self andSpouseTwo:aSpouse];
        [super marry:aSpouse];      //uses Citizen.h marry if special conditions are met
    }
}

+ (void)shareAssetsBetweenSpouseOne:(NoblePerson *)p1
                         andSpouseTwo:(NoblePerson *)p2
{
    NSNumber *share = [NSNumber numberWithDouble:(([p1.assets doubleValue] + [p2.assets doubleValue])/2)];
    p1.assets = share;
    p2.assets = share;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name: %@ %@ \nSex %d \nAge: %@ \nIs single: %d \nSpouse %@ \nAssets %@ \nButler %@",
            self.firstName,
            self.lastName,
            self.sex,
            self.age,
            self.isSingle,
            self.spouse.firstName,
            self.assets,
            self.butler.firstName];
}


- (NSNumber *)displayNoblePersonsMoney:(NoblePerson *)person
{
    return [NSNumber numberWithDouble:[person.assets doubleValue]];
}
@end
