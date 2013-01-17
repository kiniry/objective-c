#import <Foundation/Foundation.h>

typedef void (^SimpleBlockWithArg)(NSString* msg);

@interface SABlox : NSObject

- (void) runSomeBlocks;
- (void) runIteratorWithBlock;

@end
