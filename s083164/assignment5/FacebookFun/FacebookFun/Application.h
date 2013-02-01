//
//  Application.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Application : Node

@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* appDescription;
@property(nonatomic, strong) NSString* category;
@property(nonatomic, strong) NSString* company;
@property(nonatomic, strong) NSString* iconURL;
@property(nonatomic, strong) NSString* link;
@property(nonatomic, strong) NSString* logoURL;
@property(nonatomic, strong) NSString* dailyActiveUsers;

@end
