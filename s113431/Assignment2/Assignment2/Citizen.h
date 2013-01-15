//
//  Citizen.h
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/11/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Citizen : NSObject

@property  NSValue *age;
@property  NSString *firstName;
@property  NSString *lastName;
@property  NSString *sex;
@property  BOOL *single;
@property (nonatomic) Citizen *mother;
@property (nonatomic) Citizen *father;
@property Citizen *spouse;


@end
