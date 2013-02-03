#import <Foundation/Foundation.h>
#import "ErrorManager.h"
#import "Filter.h"
#import "Formatter.h"

@interface Handler : NSObject
{
  NSString* _encoding;
  ErrorManager* _errorManager;
  id<Filter>* _filter;
  Formatter* _formatter;
  Level* _level;
}

@property (copy) NSString* encoding;
@property (assign) ErrorManager* errorManager;
@property (assign) id<Filter>* filter;
@property (assign) Formatter* formatter;
@property (retain) Level* level;

- (void) close;
- (void) flush;
- (BOOL) isLoggableRecord:(LogRecord*) record;
- (void) publishRecord:(LogRecord*) record;
- (void) reportErrorWithMessage:(NSString*)msg  
		   andException:(NSException*)exception 
			andCode:(LogError) code;

@end



