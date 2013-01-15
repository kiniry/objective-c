//
//  Citizen.h
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/11/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Citizen : NSObject

@property (atomic) NSValue *age;
@property (atomic) NSString *firstName; 
@property (atomic) NSString *lastName;
@property (atomic) NSString *sex;
@property (atomic) BOOL *single;
@property (nonatomic) Citizen *mother;
@property (nonatomic) Citizen *father;
@property (atomic) Citizen *spouse;


@end
