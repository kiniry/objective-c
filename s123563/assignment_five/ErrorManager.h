#import <Foundation/Foundation.h>

typedef enum {
  CLOSE_FAILURE,
  FLUSH_FAILURE,
  FORMAT_FAILURE,
  GENERIC_FAILURE,
  OPEN_FAILURE,
  WRITE_FAILURE
} LogError;

@interface ErrorManager : NSObject

- (void) errorWithMessage:(NSString*)message andException:(NSException*)exception andCode:(LogError)code;

@end
