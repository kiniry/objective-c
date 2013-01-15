//
//  FieldHidingClass.m
//  Assignment 2 Part 2
//
//  Created by Sivanujann Selliah on 15/01/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "FieldHidingClass.h"

// Since this interface is in the implementation file, the properties and methods declared here will not be visiable outside this implementation file.
@interface FieldHidingClass()

// This property is hidden from the "public" interface from the header file.
@property NSString *aPrivateProperty;

// This method is hidden as well.
-(void)aHiddenMethod;

@end

@implementation FieldHidingClass

// This property "doesn't exist" from the outside of this implementation file
@synthesize aPrivateProperty = _aPrivateProperty;

// This property is avaible from everywhere
@synthesize anotherString = _anotherString;
-(NSString *)anotherString {
    return @"This string is read only, and cannot be written to.";
}

// Like the property 'aPrivateProperty' this method "doesn't exist" from the outside of this implementation file.
-(void)aHiddenMethod {
    NSLog(@"The hidden method was invoked!");
}

-(void)aVisibleMethod {
    // From in here we can call the hidden method above.
    [self aHiddenMethod];
    
    NSLog(@"The visible method was invoked");
}

// A factory method
+(id)fieldHidingClassWithDefaultInfo {
    FieldHidingClass *fieldHidingClass = [[FieldHidingClass alloc] initWithParameter:@"This parameter was set in the 'fieldHidingClassWithDefaultInfo' factory method."];
    fieldHidingClass.aPrivateProperty = @"This is a 'private' field that is completly hidden from outside the implementation.";
    
    return fieldHidingClass;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"The contents of aPrivateProperty is: %@ The contents of anotherString is: %@ %@", self.aPrivateProperty, self.anotherString, [super description]];
}

@end
