//
//  SayAustinPowersQuoteProtocolTest.m
//  Assignment2.2
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "AustinPowers.h"

@implementation AustinPowers

@synthesize velourColor = _velourColor;


-(AustinPowers *) initWithVelourColor:(NSString *)velourColor {
    self = [super init];
    if (self){
        _velourColor = velourColor;
    }
    return self;
}
-(void)sayAustinQoute
{
    NSLog(@"I also, like to live dangerously");
}
-(NSString *)velourColor
{
    return _velourColor;
}

@end
