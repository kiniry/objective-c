//
//  User.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface User : Node

@property(nonatomic, strong) NSString* firstName;
@property(nonatomic, strong) NSString* middleName;
@property(nonatomic, strong) NSString* lastName;
@property(nonatomic, strong) NSString* gender;
@property(nonatomic, strong) NSString* username;

@end
