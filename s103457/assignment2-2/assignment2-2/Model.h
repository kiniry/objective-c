//
//  Model.h
//  assignment2-2
//
//  Created by Anders Emil Nielsen on 15/01/13.
//  Copyright (c) 2013 Anders Emil Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property NSString *foo;

-(Model *)initWithFoo:(NSString *)foo;
-(void)doSomething;

@property NSString *shoes;

@end
