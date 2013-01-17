//
//  Citizen.h
//  Assignment3-Defensive
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

- (Citizen *)initWithName:(NSString *)name
                  withSex:(NSString *)sex
                  withAge:(NSNumber *)age;

- (NSString* )single;
- (void)addChild:(Citizen *)Achild;
- (void)setMother:(Citizen *)Amother;
- (void)setFather:(Citizen *)Afather;
- (BOOL)canMarry:(Citizen *)Aperson;
- (void)marry:(Citizen *)Aperson;
- (void)divorce:(Citizen *)Aperson;
- (NSString *)generateChildrenString;
- (NSString *)printInfo;

@end