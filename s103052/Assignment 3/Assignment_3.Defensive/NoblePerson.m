/*************************************************************************
 *  File name   : NoblePerson.m
 *  Description : Class for noble persons
 *
 *  Created on  : 17/01/2013
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
    if ([APerson isKindOfClass:[NoblePerson class]])
	{
        NoblePerson* ANoblePerson = (NoblePerson*)APerson;
        //Noble persons can marry and have a butler
        if ([super canMarry:APerson])
		{
            if ((ANoblePerson.butler || self.butler))
			{
                [super marry:ANoblePerson];
                ANoblePerson.assets = (self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE) / 2;
				self.assets = (self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE) / 2;
				if (self.butler)
					ANoblePerson.butler = self.butler;
				else if (ANoblePerson.butler)
					self.butler = ANoblePerson.butler;
				NSLog(@"Combined assets: %f",ANoblePerson.assets);
            } 
			else 
                NSLog(@"No Marriage. You don't have a Butler!");
		}
        else 
            NSLog(@"Not a legal marriage. This will leads to incest, homosexuality or polygyni!");
    } 
	else 
        NSLog(@"No Marriage. You are not noble!");
}

- (void)setButler:(Citizen*)APerson
{
	//Check 1) Butler (nil)
    if (APerson == nil)
	{
        NSException* exception_ButlerEmpty = [NSException exceptionWithName:@"Precondition violation" reason:@"You must specify a Citizen as Butler!" userInfo:nil];
        @throw exception_ButlerEmpty;
    }
	//Check 2) Butler (noble)
    if (![APerson isKindOfClass:[NoblePerson class]])
        _butler = APerson;
	else
	{
		NSException* exception_ButlerNoble = [NSException exceptionWithName:@"Precondition violation" reason:@"You are not allowed to have a Noble Butler!" userInfo:nil];
        @throw exception_ButlerNoble;
	}
}

@end
