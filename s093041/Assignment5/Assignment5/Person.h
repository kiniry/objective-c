//
//  Person.h
//  Assignment5
//
//  Created by Philip Nielsen on 22/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property int age;
@property double assets;

- (id)initWithName:(NSString *)name age:(int)age assests:(double)assets;

@end
