#import <Foundation/Foundation.h>

@interface SAScoped : NSObject

+ (void) describe:(SAScoped*)obj;
- (void) describe;
- (void) callMethod:(SAScoped*)obj;

@end
