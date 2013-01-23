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
        if ([super can_marry:APerson])
		{
            if ((ANoblePerson.butler || self.butler))
			{
                [super marry:ANoblePerson];
                ANoblePerson.assets = (self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE);
				self.assets = (self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE);
				// Set butler
				if (self.butler)
					ANoblePerson.butler = self.butler;
				else if (ANoblePerson.butler)
					self.butler = ANoblePerson.butler;
				NSLog(@"Combined assets: %f",ANoblePerson.assets);
            } 
			else 
				{
				NSException* exception_NoButler = [NSException exceptionWithName:@"Precondition violation" reason:@"No marriage. You don't have a Butler!" userInfo:nil];
				@throw exception_NoButler;
				}
		}
        else 
		{
			NSException* exception_NoMarriage = [NSException exceptionWithName:@"Precondition violation" reason:@"Not a legal marriage. Invalid spouse!" userInfo:nil];
			@throw exception_NoMarriage;
		}
    } 
	else 
		{
		NSException* exception_NotNoble = [NSException exceptionWithName:@"Precondition violation" reason:@"No marriage. You are not Noble!" userInfo:nil];
		@throw exception_NotNoble;
		}
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
