#import <Foundation/Foundation.h>

@interface SAExperiments : NSObject

- (id) init;
- (NSString*) giveSomeString;

- (void) runFactories;
- (void) runScopes;
- (void) runEnumerations;
- (void) runExceptions;
- (void) runBlocks;

@end
