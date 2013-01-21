#import <Foundation/Foundation.h>

// Event.h
@protocol Event <NSObject>

@property (readonly) NSDate* date;
- (NSString*)message;

@optional
- (void)ignore;

@end

// EventHandler.h
@protocol EventHandler <NSObject>

- (void)processEvent:(id <Event>)event;

@end

// ActualEvent.h
@interface ActualEvent : NSObject <Event>

@property (readonly) NSDate* date;
@property (readonly) NSString* message;

- (id)initWithDate:(NSDate*)date message:(NSString*)message;

@end

// ActualEvent.m
@implementation ActualEvent

- (id)initWithDate:(NSDate*)date message:(NSString*)message {
  self = [super init];
  if (self) {
    _date = date;
    _message = message;
  }
  return self;
}

@end

// StupidEvent.h
@interface StupidEvent : ActualEvent <Event>

@property (readonly) NSDate* date;

- (id)initWithDate:(NSDate*)date;

@end

// StupidEvent.m
@implementation StupidEvent

- (id)initWithDate:(NSDate*)date {
  return self = [super initWithDate:date message:@"Something stupid!"];
}

// implement the optional method
- (void)ignore {
  NSLog(@"Event ignored :'(");
}

@end

// MessageSender.h
@interface MessageSender : NSObject

@property id <EventHandler> delegate;

- (void)start;

@end

// MessageSender.m
@implementation MessageSender

- (void)start {
  // process some events by sending processEvent: to potential delegate
  [self.delegate processEvent:[[StupidEvent alloc] initWithDate:[NSDate date]]];
  [self.delegate processEvent:[[ActualEvent alloc] initWithDate:[NSDate date] message:@"Hello World!"]];
  [self.delegate processEvent:[[StupidEvent alloc] initWithDate:[NSDate date]]];
  [self.delegate processEvent:[[StupidEvent alloc] initWithDate:[NSDate date]]];
  [self.delegate processEvent:[[ActualEvent alloc] initWithDate:[NSDate date] message:@"Goodbye World!"]];
  // it's not necessary to check if the delegate is nil
  // as sending messages to nil simply does nothing
}

@end

// Foo.h
@interface Foo : NSObject <EventHandler>
@end

// Foo.m
@implementation Foo

- (void)processEvent:(id <Event>)event {
  // ignore all events that can be ignored using introspection
  if ([event respondsToSelector:@selector(ignore)]) {
    [event ignore];
    return;
  }

  NSLog(@"Event with message %@ recieved at time %@", [event message], event.date);
}

@end

// main.m
int main(int argc, const char* argv[]) {
  @autoreleasepool {
    Foo* foo = [[Foo alloc] init];
    MessageSender* messageSender = [[MessageSender alloc] init];

    [messageSender start]; // start sending events without delegate
    messageSender.delegate = foo;
    [messageSender start]; // try again with delegate set
  }

  return 0;
}
