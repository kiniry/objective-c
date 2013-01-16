#import "Citizen.h"

@interface NoblePerson : Citizen

@property (readonly) NSNumber* assets;
@property (readonly) Citizen* butler;
@property (readonly) NoblePerson* spouse;

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children assets:(NSNumber*)assets butler:(Citizen*)butler;

@end
