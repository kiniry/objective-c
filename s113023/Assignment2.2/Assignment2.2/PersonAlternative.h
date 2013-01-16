//
//  PersonAlternative.h
//  Assignment2.2
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonAlternative : NSObject

@property (copy) NSString  *firstName;
@property (copy) NSString  *lastName;

- (NSString *)fullName;
- (void)sayHello;

@end
