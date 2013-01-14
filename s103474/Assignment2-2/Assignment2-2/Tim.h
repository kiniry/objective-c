//
//  Tim.h
//  Assignment2-2
//
//  Created by Andreas Graulund on 13/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Tom.h"

@interface Tim : NSObject

@property NSString *favoriteColor;

@property (copy, readonly) NSString *myPet;

-(void) greeting;

-(void) pimpify: (NSString*) keyword withWord: (NSString*) word;
-(void) pimpify: (NSString*) keyword withNumber: (NSNumber*) number;

-(void) pimpify: (NSString*) keyword withInt: (int) number;

@end
