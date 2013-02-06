#import <Foundation/Foundation.h>
#import "Level.h"

@interface LogRecord : NSObject
{
  Level* _level;
  NSString* _loggerName;
  NSString* _message;
  NSTimeInterval _seconds;
  NSDictionary* _parameters;
  NSInteger _sequenceNumber;
  NSString* _sourceClassName;
  NSString* _threadID;
  NSException* _exception;  
}

@property (assign) Level* level;
@property (copy) NSString* loggerName;
@property (copy) NSString* message;
@property NSTimeInterval seconds;
@property (assign) NSDictionary* parameters;
@property NSInteger sequenceNumber;
@property (copy) NSString* sourceClassName;
@property (copy) NSString* threadID;
@property (assign) NSException* exception;

- (id) initWithMessage:(NSString*)message 
	      andLevel:(Level*)level 
	 andLoggerName:(NSString*)loggerName;
@end
