//
//  FunWithProtocols1.h
//  Protocols
//
//  Created by Andreas Haure on 27/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Proto1Protocol

-(void)sayStuff;

@end

@interface Proto1 : NSObject

-(void)sayStuff;

@end
