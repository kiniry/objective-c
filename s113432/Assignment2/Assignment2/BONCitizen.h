//
//  BONCitizen.h
//  BONCITIZEN
//
//  Created by Bastian Buch on 1/21/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BONCitizen : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *sex;
@property (nonatomic) int age;
@property (nonatomic) BOOL hasSpouse;
@property (nonatomic) BONCitizen *spouse;
@property (nonatomic) BOOL hasChildren;
@property (nonatomic) NSMutableArray *children;
@property (nonatomic) BONCitizen *parent1;
@property (nonatomic) BONCitizen *parent2;

+ (id) create;
- (bool) marry:(BONCitizen *)personToMarry;
- (bool) divorce;
@end
