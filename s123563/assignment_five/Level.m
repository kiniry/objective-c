#import "Level.h"
#import "OOUtils.h"

@interface Level ()

@property (readwrite) NSString* localizedName;
@property (readwrite) NSString* name;
@property (readwrite) NSString* resourceBundleName;
@property (readwrite) NSInteger intValue;

@end

@implementation Level

@synthesize localizedName = _localizedName;
@synthesize name = _name;
@synthesize resourceBundleName = _resourceBundleName;
@synthesize intValue = _intValue;

- (BOOL) isEqualToLevel:(Level*)level
{
  return [self.name isEqualToString:level.name]
    && self.intValue == level.intValue;
}

+ (Level*)levelWithLogLevel:(LogLevel)logLevel
{
  Level* lvl = [[Level alloc] init];

  switch (logLevel)
  {
  case SEVERE:
    lvl.name = @"Severe";
    lvl.intValue = (int)SEVERE;
    break;

  case WARNING:
    lvl.name = @"Warning";
    lvl.intValue = (int)WARNING;
    break;

  case INFO:
    lvl.name = @"Info";
    lvl.intValue = (int)INFO;
    break;

  case CONFIG:
    lvl.name = @"Config";
    lvl.intValue = (int)CONFIG;
    break;

  case FINE:
    lvl.name = @"Fine";
    lvl.intValue = (int)FINE;
    break;

  case FINER:
    lvl.name = @"Finer";
    lvl.intValue = (int)FINER;
    break;

  case FINEST:
    lvl.name = @"Finest";
    lvl.intValue = (int)FINEST;
    break;
  }

  return lvl;
}

- (NSString*) localizedName
{
  NotImplemented();
  return nil;
}

- (void) setLocalizedName:(NSString*)value
{
  _localizedName = value;
}

- (NSString*) resourceBundleName
{
  NotImplemented();
  return nil;
}

- (void) setResourceBundleName:(NSString*)value
{
  _resourceBundleName = value;
}

+ (Level*)parseLevelName:(NSString*)levelName
{
  if ([levelName isEqualToString:@"Severe"])
    return [self levelWithLogLevel:SEVERE];
  if ([levelName isEqualToString:@"Warning"])
    return [self levelWithLogLevel:WARNING];
  if ([levelName isEqualToString:@"Info"])
    return [self levelWithLogLevel:INFO];
  if ([levelName isEqualToString:@"Config"])
    return [self levelWithLogLevel:CONFIG];
  if ([levelName isEqualToString:@"Fine"])
    return [self levelWithLogLevel:FINE];
  if ([levelName isEqualToString:@"Finer"])
    return [self levelWithLogLevel:FINER];
  if ([levelName isEqualToString:@"Finest"])
    return [self levelWithLogLevel:FINEST];
  return nil;
}

- (NSString*) description
{
  return self.name;
}

@end
