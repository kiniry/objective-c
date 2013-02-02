#import <Foundation/Foundation.h>
#import "Filter.h"
#import "LogRecord.h"

@interface LengthFilter : NSObject <Filter>
{
  NSUInteger _length;
}

@property NSUInteger length;

- (id) initWithMaxLength:(NSUInteger)length;

@end
