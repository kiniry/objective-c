#import "Logger.h"
#import "LogManager.h"
#import "OOUtils.h"

@interface Logger ()

@property (readwrite) NSMutableSet* handlers;
@property (readwrite) NSString* resourceBundleName;

@end

@implementation Logger

@synthesize name = _name;
@synthesize filter = _filter;
@synthesize level = _level;
@synthesize parent = _parent;
@synthesize useParentHandlers = _useParentHandlers;
@synthesize handlers = _handlers;
@synthesize resourceBundleName = _resourceBundleName;

- (id) init
{
  if ((self = [super init]))
  {
    self.handlers = [[NSMutableSet alloc] init];
  }
  return self;
}

- (id) initWithName:(NSString*)name
{
  if ([self init])
  {
    _name = name;
  }
  return self;
}

// standard log
- (void) logRecord:(LogRecord*)record
{
  for (Handler* handler in self.handlers)
  {
    if ([handler isLoggableRecord:record])
      [handler publishRecord:record];
  }
}

- (void) logWithLevel:(Level*)level andMessage:(NSString*)message
{
  LogRecord* record = [[LogRecord alloc] initWithMessage:message
						andLevel:level
					   andLoggerName:self.name];
  [self logRecord:record];
}
 
- (void) logWithLevel:(Level*)level andMessage:(NSString*)message andParam:(id)param
{
  NotImplemented();
}

- (void) logWithLevel:(Level*)level andMessage:(NSString*)message andParams:(id)params
{
  NotImplemented();
}

- (void) logWithLevel:(Level*)level andMessage:(NSString*)message andException:(NSException*)exception
{
  NotImplemented();
}


// log precise (with class and method info)
- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message
{

}
 
- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message andParam:(id)param
{
  NotImplemented();
}

- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message andParams:(id)params
{
  NotImplemented();
}

- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message andException:(NSException*)exception
{
  NotImplemented();
}


// log precise with resource bundle name
- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName 
{

}

- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName andParam:(id)param
{
  NotImplemented();
}

- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName andParams:(id)params
{
  NotImplemented();
}

- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName andException:(NSException*)exception
{
  NotImplemented();
}


// misc
- (BOOL) isLoggable:(Level*)level
{
  return self.level.intValue <= level.intValue;
}

- (void) removeHandler:(Handler*)handler
{
  [self.handlers removeObject:handler];
}

- (void) addHandler:(Handler*)handler
{
  [self.handlers addObject:handler];
}


// convenience logging methods
- (void) enteringSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod
{
  [self logWithLevel:[Level levelWithLogLevel:INFO] andMessage:[NSString stringWithFormat:@"Enter method '%@::%@'", sourceClass, sourceMethod]];
}

- (void) enteringSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod andParam:(id)param
{
  NotImplemented();
}

- (void) enteringSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod andParams:(NSSet*)params
{
  NotImplemented();
}

- (void) exitingSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod
{
  [self logWithLevel:[Level levelWithLogLevel:INFO] andMessage:[NSString stringWithFormat:@"Exit method '%@::%@'", sourceClass, sourceMethod]];
}

- (void) exitingSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod withResult:(id)result
{
  NotImplemented();
}

- (void) throwingMessage:(NSString*)message withException:(NSException*)exception
{
  NotImplemented();
}

- (void) config:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:CONFIG] andMessage:message];
}

- (void) fine:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:FINE] andMessage:message];
}

- (void) finer:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:FINER] andMessage:message];
}

- (void) finest:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:FINEST] andMessage:message];
}

- (void) info:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:INFO] andMessage:message];
}

- (void) severe:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:SEVERE] andMessage:message];
}

- (void) warning:(NSString*)message
{
  [self logWithLevel:[Level levelWithLogLevel:WARNING] andMessage:message];
}


// factory
+ (Logger*) createAnonymousLogger
{
  return [[Logger alloc] init];
}

+ (Logger*) createAnonymousLoggerWithResourceBundleName:(NSString*)resourceBundleName
{
  
}

+ (Logger*) getOrCreateWithName:(NSString*)name
{
  Logger* logger = [[Logger alloc] initWithName:name];
  [[LogManager getInstance] addLogger:logger];
  return logger;
}

+ (Logger*) getOrCreateWithName:(NSString*)name andResourceBundleName:(NSString*)resourceBundleName
{
  NotImplemented();
}



@end
