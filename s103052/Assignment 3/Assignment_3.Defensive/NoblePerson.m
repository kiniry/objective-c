/*************************************************************************
 *  File name   : NoblePerson.m
 *  Description : Class for noble persons
 *
 *  Created on  : 15/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "NoblePerson.h"

#define PRICE_FOR_NOBLE_MARRIAGE 50000

@interface NoblePerson ()

@property (readwrite, nonatomic, assign) float assets;
@property (readwrite, nonatomic, assign) Citizen* butler;

@end

@implementation NoblePerson

@synthesize assets = _assets;
@synthesize butler = _butler;

- (id) initWithName:(NSString*)name withSex:(NSString*)sex withAge:(NSNumber*)age withAssets:(float) assets
{
    self = [super initWithName:name withSex:sex withAge:age];
    if (self)
    {
        _assets = assets;
    }
    return self;
}

@end
