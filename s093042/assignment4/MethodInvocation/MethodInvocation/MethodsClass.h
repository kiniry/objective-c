//
//  MethodsClass.h
//  MethodInvocation
//
//  Created by Sivanujann Selliah on 23/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MethodsClass : NSObject

@property int instanceProperty;

-(void)computeInstanceMethod;
+(void)computeClassMethod;

@end
