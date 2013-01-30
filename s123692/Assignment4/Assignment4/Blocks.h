//
//  Blocks.h
//  Assignment4
//
//  Created by Markus Færevaag on 28.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Blocks : NSObject

@property int limit;

-(id) initWithLimit:(int)limit;

-(void) runBlock;
-(void) runNonBlock;

@end
