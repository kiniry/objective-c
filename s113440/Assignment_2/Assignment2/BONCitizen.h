//
//  BONCitizen.h
//  BONCITIZEN
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/21/13.
//  Copyright (c) 2013 Bastian Buch, s113432, and Jacob Gjerstrup, s113440. All rights reserved.
//

#import <Foundation/Foundation.h>

// Below is the definition of the various properties a citizen needs.
// They are all strongly bound and nonatomic, and their various types.
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

// Also, the two functions nescesary for the class, marry and divorce, 
// are defined along with their input parameters.

+ (id) create;
- (bool) marry:(BONCitizen *)personToMarry;
- (bool) divorce;
@end
