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
    // Assert 1: Aperson is nil
    NSAssert(APerson,@"Precondition violatin: You must specify a citizen!");
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
                double assetsUpdated = self.assets + ANoblePerson.assets - PRICE_FOR_NOBLE_MARRIAGE;
                ANoblePerson.assets = assetsUpdated;
                self.assets = assetsUpdated;
				// Set butler
				if (self.butler)
					ANoblePerson.butler = self.butler;
				else if (ANoblePerson.butler)
					self.butler = ANoblePerson.butler;
				NSLog(@"Combined assets: %f",ANoblePerson.assets);
				// Assert 2: Set butler
				NSAssert(self.butler && ANoblePerson.butler,@"Postcondition violation: Set butler for both noble persons failed!");
				// Assert 3: Set Assets
				NSAssert((self.assets <= assetsUpdated) || (ANoblePerson.assets <= assetsUpdated), @"Postcondition violation: Assets were not updated correctly!");
            } 
			else 
				NSLog(@"Precondition violation: No marriage. You don't have a Butler!"); // NSLOG FAIL MESSAGE
		}
        else 
			NSLog(@"Not a legal marriage. Invalid spouse!"); // NSLOG FAIL MESSAGE
    } 
	else 
		NSLog(@"No marriage. You are not Noble!"); // NSLOG FAIL MESSAGE
}

- (void)setButler:(Citizen*)APerson
{
	// Assert 1: Aperson is nil
    NSAssert(APerson,@"Precondition violatin: You must specify a Citizen as Butler!");
	// Assert 2: Aperson not a noble person
    NSAssert(![APerson isKindOfClass:[NoblePerson class]],@"Precondition violation: You are not allowed to have a Noble Butler!");
    
	// Set butler
	_butler = APerson;

	// Assert 3: Set butler completed
    NSAssert(self.butler == APerson,@"Postcondition violation: Set butler failed!");
}

@end
