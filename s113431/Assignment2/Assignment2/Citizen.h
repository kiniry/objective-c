//
//  Citizen.h
//  Assignment2
//
//  Created by Jamie Neubert Pedersen on 1/11/13.
//  Copyright (c) 2013 Jamie Neubert Pedersen. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Citizen : NSObject

@property NSValue *age;
@property (copy) NSString *firstName; // set (copy) so an
@property (copy) NSString *lastName;  // NSMutableArray can't
@property (copy) NSString *sex;       // be passed to override it.
@property (nonatomic) Citizen *marry;
@property (nonatomic) Citizen *spouse;
@property Citizen *mother;
@property Citizen *father;
@property NSMutableArray *children;

- (void) marry:(Citizen *)sweetheart;
- (void) divorce;

- (BOOL) can_marry:(Citizen *)other;
- (BOOL) isSingle;

@end
