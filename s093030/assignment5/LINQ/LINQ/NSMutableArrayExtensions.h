//
//  NSMutableArrayExtensions.h
//  LINQ
//
//  Created by Søren Olofsson on 2/3/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray(LINQ)

-(NSMutableArray*)where: (BOOL (^)(id))predicate;
-(NSMutableArray*)select: (id (^)(id))constructor;

@end
