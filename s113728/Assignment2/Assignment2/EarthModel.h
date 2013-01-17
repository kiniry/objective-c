//
//  EarthModel.h
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NoblePerson.h"

@interface EarthModel : NSObject

@property (nonatomic, weak) NSSet *newPeople;

- (void)pushPerson:(Citizen *)person;
- (void)performOperation:(NSString *)operation;

@end
