//
//  SmartyPantsParser.h
//  Assignment5
//
//  Created by Andreas Graulund on 25/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SMARTYPANTS_VERSION @"1.5.1"

@interface SmartyPantsParser : NSObject

// Object-oriented creation and string transformation using object
-(id) initWithOldSchoolDashShortcuts;
-(id) initWithInvertedOldSchoolDashShortcuts;
-(id) initWithAttributes:(int)attr;
-(id) initWithAttributeString:(NSString *)attrString;
-(void) setAttributes:(int)attr;
-(void) setAttributeString:(NSString *)attrString;
-(NSString *)transformString:(NSString *)input;

// Quick string transformation
+(NSString *)transformString:(NSString *)input;
+(NSString *)transformString:(NSString *)input usingAttributes:(int)attr;
+(NSString *)transformString:(NSString *)input usingAttributeString:(NSString *)attrString;

// Shorthands
+(NSString *)smartQuotes:(NSString *)input;
+(NSString *)smartQuotes:(NSString *)input usingAttributes:(int)attr;
+(NSString *)smartDashes:(NSString *)input;
+(NSString *)smartDashes:(NSString *)input usingAttributes:(int)attr;
+(NSString *)smartEllipses:(NSString *)input;
+(NSString *)smartEllipses:(NSString *)input usingAttributes:(int)attr;

@end
