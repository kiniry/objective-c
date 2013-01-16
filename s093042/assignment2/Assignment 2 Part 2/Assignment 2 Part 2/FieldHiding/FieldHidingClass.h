//
//  FieldHidingClass.h
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "AClass.h"

@interface FieldHidingClass : AClass

// to make a "private" setter for this method we can set it to readonly:
@property (readonly) NSString *anotherString;

-(void)aVisibleMethod;

// An extended factory method
+(id)fieldHidingClassWithDefaultInfo;

@end
