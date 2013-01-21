//
//  PeopleDB.h
//  assignment2
//
//  Created by Magloire on 1/21/13.
//  Copyright (c) 2013 Magloire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoblePerson.h"
#import "DBProtocol.h"

@interface PeopleDB:NSObject <DBProtocol>

@property NSMutableSet *people;

-(NSMutableSet *) selectNoble;
-(NSMutableSet *) selectWithBlock:(BOOL (^) (Citizen *)) predicate;
-(void) removeWithBlock:(BOOL (^) (Citizen *)) criteria;
-(void) removeSingles;
@end
