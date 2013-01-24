/*************************************************************************
 *  File name   : NoblePerson.m
 *  Description : Class for noble persons
 *
 *  Created on  : 18/01/2013
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
        _assets = assets;
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
				if (DEBUG) NSLog(@"Precondition violation: No marriage. You don't have a Butler!");
		}
        else
			if (DEBUG) NSLog(@"Not a legal marriage. Invalid spouse!");
    } 
	else 
		if (DEBUG) NSLog(@"No marriage. You are not Noble!");
}

- (void)setButler:(Citizen*)APerson
{	
	//Check 1) Butler (nil)
    if (DEBUG && APerson == nil)
        NSLog(@"Precondition violation: You must specify a Citizen as Butler!");
	//Check 2) Butler (noble)
    if (DEBUG && ![APerson isKindOfClass:[NoblePerson class]])
		NSLog(@"Precondition violation: You are not allowed to have a Noble Butler!");
	else
		_butler = APerson;
}

@end
