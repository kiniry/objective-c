//
//  Random.h
//  Assignment5
//
//  Created by Andreas Haure on 23/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Random : NSObject

-(void)nextBytes:(NSArray *)bytes;
-(int)nextInt;

@end
