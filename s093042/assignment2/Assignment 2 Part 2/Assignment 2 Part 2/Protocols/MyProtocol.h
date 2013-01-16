//
//  MyProtocol.h
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 16/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyProtocol <NSObject>
// These are all required elements of implementations of this protocol
@property NSString *aRequiredProperty;
-(void)aRequiredMethod;

@optional
// All these elements are optional to implement
@property NSString *anOptionalProperty;
-(void)anOptionalMethod;

@required
// These are also required for the implementation of this protocol
@property NSString *anotherRequiredProperty;
-(void)anotherRequiredMethod;
@end
