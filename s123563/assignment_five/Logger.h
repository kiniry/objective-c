#import <Foundation/Foundation.h>
#import "Level.h"
#import "Filter.h"
#import "LogRecord.h"
#import "Handler.h"

@interface Logger : NSObject
{
  NSString* _name;
  id<Filter> _filter;
  Level* _level;
  Logger* _parent;
  BOOL _useParentHandlers;
  NSMutableSet* _handlers;
  NSString* _resourceBundleName;
}

@property (readonly) NSString* name;
@property (assign) id<Filter> filter;
@property (assign) Level* level;
@property (assign) Logger* parent;
@property BOOL useParentHandlers;
@property (readonly) NSMutableSet* handlers;
@property (readonly) NSString* resourceBundleName;

// standard log
- (void) logRecord:(LogRecord*)record;
- (void) logWithLevel:(Level*)level andMessage:(NSString*)message; 
- (void) logWithLevel:(Level*)level andMessage:(NSString*)message andParam:(id)param;
- (void) logWithLevel:(Level*)level andMessage:(NSString*)message andParams:(id)params;
- (void) logWithLevel:(Level*)level andMessage:(NSString*)message andException:(NSException*)exception;

// log precise (with class and method info)
- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message; 
- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message andParam:(id)param;
- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message andParams:(id)params;
- (void) logpWithLevel:(Level*)level andMessage:(NSString*)message andException:(NSException*)exception;

// log precise with resource bundle name
- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName; 
- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName andParam:(id)param;
- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName andParams:(id)params;
- (void) logrbWithLevel:(Level*)level andMessage:(NSString*)message andResourceBundleName:(NSString*)resourceBundleName andException:(NSException*)exception;

// misc
- (BOOL) isLoggable:(Level*)level;
- (void) removeHandler:(Handler*)handler;
- (void) addHandler:(Handler*)handler;

// convenience logging methods
- (void) enteringSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod;
- (void) enteringSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod andParam:(id)param;
- (void) enteringSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod andParams:(NSSet*)params;
- (void) exitingSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod;
- (void) exitingSourceClass:(NSString*)sourceClass andSourceMethod:(NSString*)sourceMethod withResult:(id)result;
- (void) throwingMessage:(NSString*)message withException:(NSException*)exception;
- (void) config:(NSString*)message;
- (void) fine:(NSString*)message;
- (void) finer:(NSString*)message;
- (void) finest:(NSString*)message;
- (void) info:(NSString*)message;
- (void) severe:(NSString*)message;
- (void) warning:(NSString*)message;

// factory
+ (Logger*) createAnonymousLogger;
+ (Logger*) createAnonymousLoggerWithResourceBundleName:(NSString*)resourceBundleName;
+ (Logger*) getOrCreateWithName:(NSString*)name;
+ (Logger*) getOrCreateWithName:(NSString*)name andResourceBundleName:(NSString*)resourceBundleName;

@end
