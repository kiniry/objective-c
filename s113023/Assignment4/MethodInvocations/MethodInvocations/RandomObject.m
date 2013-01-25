//
//  RandomObject.m
//  MethodInvocations
//
//  Created by Andreas Haure on 24/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "RandomObject.h"

@implementation RandomObject

static BOOL switchBOOL = NO;

-(void)randomInstanceMethod
{
    switchBOOL = !switchBOOL;
    
}
+(void)randomClassMethod
{
    switchBOOL = !switchBOOL;
}

@end
