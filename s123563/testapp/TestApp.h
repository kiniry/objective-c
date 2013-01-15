#import <Foundation/Foundation.h>

@interface TestApp : NSObject 
{
  NSString* _message;
}

@property (copy) NSString* message;

- (id) initWithMessage:(NSString*)msg;
- (void) run;

@end
