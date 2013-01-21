//
//  Boy.h
//  Assignment2.2
//
//  Created by Andreas Haure on 15/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Boy : Person

- (NSString *)hobbies;
- (void)transformStringIntoFamousPitbullSong: (NSString *)string byAddingCountIn: (NSString *)language;
- (void)transformStringIntoFamousPitbullSong: (NSString *)string byAddingCountIn: (NSString *)language andFourCities: (NSString *)fourCities;


@end
