//
//  NSObject+Properties.h
//  Assignment5
//
//  Created by Philip Nielsen on 22/01/13.
//  Copyright (c) 2013 Philip Nielsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Properties)

+ (NSDictionary *)classPropertiesAndTypeForClass:(Class)klass;

+ (NSArray *)classPropertiesForClass:(Class)klass;

@end
