#import <Foundation/Foundation.h>
#import "Citizen.h"

@interface NoblePerson : Citizen
{
  NSNumber* _assets;
  Citizen* _butler;
}

@property (copy) NSNumber* assets;
@property (assign) Citizen* butler;

@end
