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
- (void)marryNoble:(Citizen*)APerson
{
	// Possible spouse is a Noble Person
    if([APerson isKindOfClass:[NoblePerson class]])
	{
        NoblePerson *ANoblePerson = (NoblePerson*)APerson;
        //Noble persons have a butler and can marry
        if ([super IllegalMarriage:APerson])
		{
            if(ANoblePerson.butler || self.butler)
			{
                [super marry:ANoblePerson];
                ANoblePerson.assets = (self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE) / 2;
				self.assets = (self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE) / 2;
                NSLog(@"Combined assets: %f",ANoblePerson.assets);
            } 
			else 
                NSLog(@"No butler - No Marriage!");
        }
        else
            NSLog(@"Not a legal marriage - leads to incest or homosexuality or polygyni");
    } 
	else
        NSLog(@"No nobility - No Marriage!");
}

- (void)setButler:(Citizen*)APerson
{
    if (![APerson isKindOfClass:[NoblePerson class]])
        _butler = APerson;
}

@end
