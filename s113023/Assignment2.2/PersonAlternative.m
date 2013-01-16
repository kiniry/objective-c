//
//  PersonAlternative.m
//  Assignment2.2
//
//  Created by Andreas Haure on 16/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "PersonAlternative.h"

@implementation PersonAlternative

- (NSString *)fullName
{
    NSString *stringToReturn = [NSString stringWithFormat:@"Full Name: %@ %@",self.firstName,self.lastName];
    return stringToReturn;
}
- (void)sayHello
{
    NSLog(@"Hello i don't know whether I'm a boy or a girl");
}

@end
