//
//  SimpleProtocol.h
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 16/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

@interface SimpleProtocolClass : NSObject <MyProtocol>
// Nothing is needed here if the only elements of the object are those defined in the protocol.
@end
