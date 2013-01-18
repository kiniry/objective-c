#import <Foundation/Foundation.h>

// typedef enum : NSUInteger { // this doesn't work in gcc
typedef enum {
  SexMale,
  SexFemale
} Sex;

// Citizen class is "abstract" and should not be instantiated
@interface Citizen : NSObject

@property (readonly, retain) NSString* name;
@property (readonly, assign) Sex sex;
@property (readonly, assign) NSUInteger age;
@property (readonly, retain) Citizen* spouse;
@property (readonly, retain) NSSet* children;
// parent properties are weak to avoid strong reference cycles
@property (readonly, assign) Citizen* father;
@property (readonly, assign) Citizen* mother;

- (id)initWithName:(NSString*)name sex:(Sex)sex age:(NSUInteger)age children:(NSSet*)children;

- (BOOL)isSingle;
- (BOOL)canMarry:(Citizen*)other;

- (void)marry:(Citizen*)sweetheart;
- (void)divorce;

@end
