//
//  Citizen.m
//  Assignment3
//
//  Created by user on 1/21/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import "Citizen.h"

@implementation Citizen

// No requirements we try to check everything as our Java teachers tell us, it's not easy to read, and our client need to use try catch
- (Citizen *)defensiveInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    
    NSMutableString *exceptionMessage = [[NSMutableString alloc] init];
  
    // check name, not with isMemberOfClass cause strings are crazy subclasses
    if (name == @"" || name == nil || ![name isKindOfClass:[NSString class]] ){
       [exceptionMessage appendString:@"init precondition failure, name not formatted correctly. "];
    }
    // check sex
    if (sex != @"male" || sex != @"female" ) {
        [exceptionMessage appendString:@"init precondition failure, gender not formatted correctly. "];
    }
    // check age with hacky type check (feedback encouraged) of NSInteger to avoid libc. The alternative is to take a NSNumber as parameter instead and cast it to an int here and accept the overhead (assumption)
    if (age < 0 || &age == nil || [[NSNumber numberWithInt:age] integerValue] != age ){
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
    if (name == @"" || name == nil || ![name isKindOfClass:[NSString class]] ) {
        success = NO;
        NSLog(@"init precondition failure, the name: %@, is not valid as input parameter for a citizen ", name);
    }
    // check sex
    if (sex !=@"male" || sex !=@"female"){
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
    } else {
        NSLog(@"Init failed");
        return nil;
    }
}
// requires name is a NSString and not empty && sex either "male" or "female" && age is nonnegative int
- (Citizen *)assertionInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age {
    
    NSString *assertionMessage = @"Precondition %@: \"%@\" not well formed";
    
    // check name
    NSAssert2(name != @"" && name != nil && [name isKindOfClass:[NSString class]], assertionMessage, @"name", name);
    // check sex
    NSAssert2( (sex ==@"male" || sex ==@"female") && [sex isKindOfClass:[NSString class]], assertionMessage, @"sex", sex);
    // check age
    NSAssert2((age >= 0 && &age != nil && [[NSNumber numberWithInt:age] integerValue] == age ), assertionMessage, @"age", [[NSNumber numberWithInt:age] stringValue]);
    
    return [super initWithName:name andSex:sex andAgeAsInt:age];
}
// requires single() and !impedimentToMarriage()
// ensures imminentSpouse.spouse == self
- (void)marry:(CitizenSuperClass *)imminentSpouse {
    [super marry:imminentSpouse];
}
// requires self.spouse == spouse
// ensures self.spouse == nil && spouse.spouse == nil
- (void)divorce:(CitizenSuperClass *)spouse {
    [super divorce:spouse];
}

@end
