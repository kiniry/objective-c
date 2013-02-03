//
//  Page.h
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Page : Node

//Public
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* pageDescription; //Cant use description d'ooh
@property(nonatomic, strong) NSString* link;
@property(nonatomic, strong) NSString* category;
@property(nonatomic, strong) NSString* company;

@end
