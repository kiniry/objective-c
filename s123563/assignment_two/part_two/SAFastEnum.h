#import <Foundation/Foundation.h>

@interface SAFastEnum : NSObject

@property (nonatomic, readonly) NSArray* someArray;

- (void) enumerateStandard;
- (void) enumerateAndDelete;

@end
