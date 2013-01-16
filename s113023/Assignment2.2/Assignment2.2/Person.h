//
//  Person.h
//  Assignment2.2
//
//  Created by Andreas Haure on 15/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *firstName;
@property NSString *lastName;

- (NSString *)fullName;
- (void)sayHello;

@end
