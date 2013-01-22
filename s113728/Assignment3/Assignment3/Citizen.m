//
//  Citizen.m
//  Assignment3
//
//  Created by user on 1/21/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

- (Citizen *)defensiveInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    
    NSMutableString *exceptionMessage = nil;
  
    // check name, generally with isMemberOfClass cause we don't want evil subclasses
    if (name == @"" || name == nil || ![name isMemberOfClass:[NSString class]] ){
       [exceptionMessage appendString:@"init precondition failure, name not formatted correctly. "];
    }
    // check sex
    if (sex != @"male" || sex != @"female" || ![sex isMemberOfClass:[NSString class]] ) {
        [exceptionMessage appendString:@"init precondition failure, gender not formatted correctly. "];
    }
    // check age with hacky type check (feedback encouraged) of NSInteger to avoid libc. The alternative is to take a NSNumber as parameter instead and cast it to an int here and accept the overhead (assumption)
    if (age < 0 || &age == nil || [[NSNumber numberWithInt:age] integerValue] == age ){
        [exceptionMessage appendString:@"init precondition failure, age not formatted correctly."];
    }
    // Check if we won and call init from superclass
    if(exceptionMessage == nil){
        return (Citizen *) [super initWithName:name andSex:sex andAgeAsInt:age];
    } else {
        // We lost
       NSException *initException = [NSException exceptionWithName:NSInvalidArgumentException reason:exceptionMessage  userInfo:nil];
        @throw initException;
    }
}
- (Citizen *)loggingInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    
    BOOL success = YES;
    
    // check name
    if (name == @"" || name == nil || ![name isMemberOfClass:[NSString class]] ) {
        success = NO;
        NSLog(@"init precondition failure, the name: %@, is not valid as input parameter for a citizen ", name);
    }
    // check sex
    if (sex !=@"male" || sex !=@"female" || ![sex isMemberOfClass:[NSString class]] ){
        success = NO;
        NSLog(@"init precondition failure, the sex: %@, is not valid as input parameter for a citizen ", sex);
    }    
    // check age
    if (age < 0 || &age == nil || [[NSNumber numberWithInt:age] integerValue] == age ){
        success = NO;
        NSLog(@"init precondition failure, the age: %i is not valid as input parameter for a citizen", age);
    }
    if (success) {
        return [super initWithName:name andSex:sex andAgeAsInt:age];
        NSLog(@"Citizen initialized correctly, superfluous message");
    } 
}
- (Citizen *)AssertionInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    
    NSString *assertionMessage = @"Precondition %@: %@ not well formed";
    
    // check name, I think seperation of assertionMessage is prettier
    NSAssert2(name == @"" || name == nil || ![name isMemberOfClass:[NSString class]], assertionMessage, @"name", name);
    // check sex
    NSAssert2((sex !=@"male" || sex !=@"female" || ![sex isMemberOfClass:[NSString class]] ), assertionMessage, @"sex", sex);
    // check age
    NSAssert2((age < 0 || &age == nil || [[NSNumber numberWithInt:age] integerValue] == age ), assertionMessage, [[NSNumber numberWithInt:age] stringValue], age);
    
    return [super initWithName:name andSex:sex andAgeAsInt:age];
}


@end
