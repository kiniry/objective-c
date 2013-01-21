//
//  Country.h
//  Assignment3 (taken from Assignment 2-1)
//
//  Created by Andreas Graulund on 17/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property (copy) NSString *globalName;
@property (copy) NSString *localName;

-(Country*) initWithGlobalName: (NSString*) n1 andLocalName: (NSString*) n2;

-(NSString*) description;

@end
