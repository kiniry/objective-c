#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
  SexMale,
  SexFemale
} Sex;

// Citizen class is "abstract" and should not be instantiated
@interface Citizen : NSObject

@property (readonly) NSString* name;
@property (readonly) Sex sex;
@property (readonly) NSUInteger age;
@property (readonly) Citizen* spouse;
@property (readonly) NSSet* children;
// parent properties are weak to avoid strong reference cycles
@property (weak, readonly) Citizen* father;
@property (weak, readonly) Citizen* mother;

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children;

- (BOOL)isSingle;
- (BOOL)canMarry:(Citizen*)other;

- (void)marry:(Citizen*)sweetheart;
- (void)divorce;

@end
