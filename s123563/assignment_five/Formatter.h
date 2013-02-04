#import <Foundation/Foundation.h>
#import "LogRecord.h"
#import "OOUtils.h"

@interface Formatter : NSObject

- (NSString*) format:(LogRecord*)record;
- (NSString*) formatMessage:(LogRecord*)record;
- (NSString*) head;
- (NSString*) tail;

@end
