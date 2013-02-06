#import <Foundation/Foundation.h>
#import "Logger.h"

@interface LogManager : NSObject
{
  NSMutableSet* _loggers;
}

// TODO add KVO for property change
- (BOOL) addLogger:(Logger*)logger;
- (void) checkAccess;
- (Logger*) getLogger:(NSString*)loggerName;
- (NSString*) getProperty:(NSString*)propertyName;
- (void) readConfiguration;
- (void) readConfiguration:(NSString*)configFilePath;
- (void) reset;

+ (LogManager*) getInstance;

@end
