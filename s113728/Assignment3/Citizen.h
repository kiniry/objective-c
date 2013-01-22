//
//  Citizen.h
//  Assignment3
//
//  Created by user on 1/21/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CitizenSuperClass.h"

@interface Citizen : CitizenSuperClass

// See CitizenSuperClass for full list of queries, commands and constraints

// BON commands
/* Init in three different versions that returns a citizen */
- (Citizen *)defensiveInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age;
- (Citizen *)loggingInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age;
- (Citizen *)assertionInitWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age;

/* Marry another person */
- (void)marry:(CitizenSuperClass *)imminentSpouse;

/* Divorce your spouse */
- (void)divorce:(CitizenSuperClass *)spouse;



@end
