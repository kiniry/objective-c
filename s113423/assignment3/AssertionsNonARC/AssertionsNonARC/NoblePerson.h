#import <Foundation/Foundation.h>

#import "Citizen.h"

@interface NoblePerson : Citizen

@property (readonly, retain) NSNumber* assets;
@property (readonly, retain) Citizen* butler;
@property (readonly, retain) NoblePerson* spouse;

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children assets:(NSNumber*)assets butler:(Citizen*)butler;

@end
