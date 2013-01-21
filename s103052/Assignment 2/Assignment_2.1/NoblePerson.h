/*************************************************************************
 *  File name   : NoblePerson.h
 *  Description : NoblePerson headerfile
 *
 *  Created on  : 15/01/2013
 *  Author	  	: Christian Poulsen
 *
 *************************************************************************/

#import "Citizen.h"

@interface NoblePerson : Citizen
{
  float _assets;
  Citizen* _butler;
}

- (id) initWithName:(NSString*)name withSex:(NSString*)sex withAge:(NSNumber*)age withAssets:(float)assets;

@property (readonly, nonatomic) float assets;
@property (readonly, nonatomic) Citizen* butler;

- (void)marryNoble:(Citizen*)APerson;
- (void)setButler:(Citizen*)APerson;

@end