//
//  FunWithProtocols.h
//  Assignment#2
//
//  Created by Jacob Espersen on 17/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FunWithProtocols;
/*
 The protocol
 */
@protocol MyProtocol

- (void)doSomethingWithBlock:(void(^)(void)) block;

@end

/*
 Creates a delegate to access the method defined in MyProtocol in ControllerForProtocolExperiment
 without actually knowing the controller.
 */
@interface FunWithProtocols : NSObject

@property (weak) id <MyProtocol> delegate;


@end
