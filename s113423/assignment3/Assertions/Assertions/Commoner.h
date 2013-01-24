#import "Citizen.h"

@interface Commoner : Citizen

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children;

@end
