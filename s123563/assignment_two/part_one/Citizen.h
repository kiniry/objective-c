#import <Foundation/Foundation.h>

// Enum describing a Citizens sex
typedef enum 
{ 
  male, 
  female 
} Sex; 

// A person born or living in a country
@interface Citizen : NSObject
{ 
  NSString* _name;
  Sex _sex;
  NSNumber* _age;
  Citizen* _spouse;
  NSSet* _children;
  NSSet* _parents;
}

// Initializor
- (id) initWithSex:(Sex)sex andName:(NSString*)name andAge:(NSNumber*)age;

// Queries
@property (copy) NSString* name;
@property Sex sex;
@property (copy) NSNumber* age; 
@property (assign) Citizen* spouse;
// Not using mutable lists here to prevent direct manipulation
@property (readonly, nonatomic) NSSet* children;
@property (readonly, nonatomic) NSSet* parents;
// Queries not bound to an instance variable
@property (readonly, nonatomic) BOOL isSingle;
- (BOOL)  isMarriableTo:(Citizen*)suitor;

// Accessor methods for "children" and "parents" sets
- (void) addParent:(Citizen*)parent;
- (void) removeParent:(Citizen*)parent;

- (void) addChild:(Citizen*)child;
- (void) removeChild:(Citizen*)child;

// Commands
- (void) divorce;
- (void) marryTo:(Citizen*)fiancee;

@end
