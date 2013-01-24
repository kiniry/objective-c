//
//  TestProtocols.m
//  assignment2
//
//  Created by Magloire on 1/21/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import "TestProtocols.h"

@implementation TestProtocols

-(void) testPeopleDB{
    // This test if the header file declared mothods specified in the protocol
    if ([PeopleDB conformsToProtocol:@protocol(DBProtocol)]) {
        NSLog(@"PeopleDB conforms to protocol DBProtocol");
    }
    
    // to test if a method is really implemented, you have to check programmatically.
    // So it is possible to conform to a protocol in objective-c without stating it
    // formally. Unlike java interfaces where interfaces methods have to be implemented.
    
    PeopleDB *db = [PeopleDB new];
    if ([db respondsToSelector:@selector(selectWithBlock:)]
        && [db respondsToSelector:@selector(removeWithBlock:)]) {
        NSLog(@"DBProtocol methods are implemented.");
    }
    
    // The above method is similar to "duck typing" in Ruby.
    // The only thing you care about is what an object can do,
    // and not what kind of object it is. "if it quacks as a duck and walk like a duck, it is a duck".
    // In ruby:
    // if people_db.responds_to :method ....
    
}

@end
