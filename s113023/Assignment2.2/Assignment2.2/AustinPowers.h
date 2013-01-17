//
//  SayAustinPowersQuoteProtocolTest.h
//  Assignment2.2
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AustinPowersProtocol.h"

@interface AustinPowers : NSObject <AustinPowersProtocol>

@property (nonatomic) NSString *velourColor;

-(void)sayAustinQoute;
-(NSString *)velourColor;
-(AustinPowers *) initWithVelourColor:(NSString *)velourColor;

@end
