//
//  User.m
//  FacebookFun
//
//  Created by Emil Klarskov Kristensen on 2/1/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import "User.h"

@implementation User

static NSString *const EKKAccessUserFirstName = @"first_name";
static NSString *const EKKAccessUserMiddleName = @"middle_name";
static NSString *const EKKAccessUserLastName = @"last_name";
static NSString *const EKKAccessUserGender = @"gender";
static NSString *const EKKAccessUserUsername = @"username";

-(void) handleData:(NSDictionary*)data
{
    //    Public facebook properties
    if ([data objectForKey:EKKAccessUserFirstName]) self.firstName = [data objectForKey:EKKAccessUserFirstName];
    if ([data objectForKey:EKKAccessUserMiddleName]) self.middleName = [data objectForKey:EKKAccessUserMiddleName];
    if ([data objectForKey:EKKAccessUserLastName]) self.lastName = [data objectForKey:EKKAccessUserLastName];
    if ([data objectForKey:EKKAccessUserGender]) self.gender = [data objectForKey:EKKAccessUserGender];
    if ([data objectForKey:EKKAccessUserUsername]) self.username = [data objectForKey:EKKAccessUserUsername];
    
    
}

-(void) initAttributes
{
    self.attributes = @[EKKAccessUserFirstName,EKKAccessUserMiddleName,EKKAccessUserLastName,EKKAccessUserGender,EKKAccessUserUsername];
}

@end
