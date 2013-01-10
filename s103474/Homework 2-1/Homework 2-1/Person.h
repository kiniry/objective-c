//
//  Person.h
//  Homework 2
//
//  Created by Andreas Graulund on 10/01/13.
//  Copyright (c) 2013 Andreas Graulund. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Country.h"

typedef enum { male, female, other } Sex;

@interface Person : NSObject

@property Country* country;
@property NSDate* birthDate;
@property Sex sex;

@property Person *mother;
@property Person *father;


@end
