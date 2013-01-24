//
//  Citizen.h
//  Assignment3-Defensive
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

@property(atomic,strong,readonly) NSString *name;

- (Citizen *)initWithName:(NSString *)name
                  withSex:(NSString *)sex
                  withAge:(NSNumber *)age;

- (NSString* )single;
- (void)addChild:(Citizen *)Achild;
- (BOOL)canMarry:(Citizen *)Aperson;
- (void)marry:(Citizen *)Aperson;
- (void)divorce:(Citizen *)Aperson;
- (NSString *)generateChildrenString;
- (NSString *)description;

@end