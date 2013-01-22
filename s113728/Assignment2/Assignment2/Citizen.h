//
//  Citizen.h
//  Assignment2
//
//  Created by user on 1/15/13.
//  Copyright (c) 2013 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Citizen : NSObject

// Strong, weak, copy, readonly comming in next commit
// we don't want to change theese queries
@property (readonly) NSString *name, *sex;
@property NSSet *parents;
// we wanna change theese
@property  NSInteger *age;
@property  Citizen *spouse;
@property  NSMutableOrderedSet *children;
// theese queries needn't be attributes
- (BOOL)impedimentToMarriage;
- (BOOL)single;

- (Citizen *)initWithName:(NSString *)name andSex:(NSString *)sex andAgeAsInt:(NSInteger)age;

// the commands
- (void)marry:(Citizen *)imminentSpouse;
- (void)divorce:(Citizen *)spouse;



@end
