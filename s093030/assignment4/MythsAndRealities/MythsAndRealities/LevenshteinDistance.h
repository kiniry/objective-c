//
//  LevenshteinDistance.h
//  MythsAndRealities
//
//  Created by Søren Olofsson on 1/23/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevenshteinDistance : NSObject

-(int)computeWithString:(NSString*) str1 andString:(NSString*)str2;
-(int)computeUsingBlocksWithString:(NSString*) str1 andString:(NSString*)str2;
-(int)computeUsingMethodInvocationWithString:(NSString*) str1 andString:(NSString*)str2;

@end
