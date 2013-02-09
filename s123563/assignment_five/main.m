#import <Foundation/Foundation.h>
#import "LogManager.h"
#import "ConsoleHandler.h"
#import "SimpleFormatter.h"
#import "Level.h"
#import "LengthFilter.h"
#import "Foo.h"

int main(int argc, const char * argv[])
{
  NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
  
  // create via factory
  [Logger getOrCreateWithName:@"five.logger"];
  
  // get via singleton (...)
  Logger* logr = [[LogManager getInstance] getLogger:@"five.logger"];
  
  // add handler
  ConsoleHandler* handlr = [[ConsoleHandler alloc] init];
  [logr addHandler:handlr];

  // add formatter
  SimpleFormatter* formatr = [[SimpleFormatter alloc] init];
  [handlr setFormatter:formatr];

  [logr config:@"1. 'Twas the night before Christmas, when all through the house"];
  [logr logWithLevel:[Level levelWithLogLevel:SEVERE] andMessage:@"2. Not a creature was stirring, not even a mouse"];
  
  // change level on handler
  [handlr setLevel:[Level levelWithLogLevel:WARNING]];
  [logr info:@"I should not be logged"];
  [logr warning:@"3. The stockings were hung by the chimney with care"];
  [logr severe:@"4. In hopes that St. Nicholas soon would be there"];
  
  // add a filter (maximum 60 chars length)
  [handlr setFilter:[[LengthFilter alloc] initWithMaxLength:60]];
  [logr warning:@"5. The children were nestled all snug in their beds"];
  [logr warning:@"I should not be logged, I should not be logged, I should not be logged, I should not be logged"];
  
  [handlr setFilter:nil];
  [handlr setLevel:[Level levelWithLogLevel:FINEST]];
  
  // Foo logs with the same logger - it just assumes it's created
  [Foo bar];
  
  [logr removeHandler:handlr];

  [logr severe:@"I should not be logged"];

  [pool drain];
  return 0;
}
