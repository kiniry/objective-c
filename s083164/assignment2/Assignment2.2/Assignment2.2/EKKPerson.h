//
//  EKKPerson.h
//  Assignment2.2
//
//  Created by Emil Klarskov Kristensen on 1/19/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKKPerson : NSObject

@property (strong) NSString *name;

-(EKKPerson *)initWithName:(NSString *)name;

@end
