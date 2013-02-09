#import <Foundation/Foundation.h>
#import "LogRecord.h"

@protocol Filter <NSObject>

- (BOOL) isLoggableRecord:(LogRecord*)record;

@end
