#import <Foundation/Foundation.h>

typedef enum {
  SEVERE = 6,
  WARNING = 5,
  INFO = 4,
  CONFIG = 3,
  FINE = 2,
  FINER = 1,
  FINEST = 0
} LogLevel;

@interface Level : NSObject
{
  NSString* _localizedName;
  NSString* _name;
  NSString* _resourceBundleName;
  NSInteger _intValue;
}

@property (readonly) NSString* localizedName;
@property (readonly) NSString* name;
@property (readonly) NSString* resourceBundleName;
@property (readonly) NSInteger intValue;

- (BOOL) isEqualToLevel:(Level*)level;

+ (Level*)levelWithLogLevel:(LogLevel)logLevel;
+ (Level*)parseLevelName:(NSString*)levelName;

@end
