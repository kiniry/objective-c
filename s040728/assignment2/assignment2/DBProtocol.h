//
//  DBProtocol.h
//  assignment2
//
//  Created by Magloire on 1/21/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoblePerson.h"

@protocol DBProtocol <NSObject>

-(NSMutableSet *) selectWithBlock:(BOOL (^) (Citizen *)) predicate;
-(void) removeWithBlock:(BOOL (^) (Citizen *)) criteria;

@end
