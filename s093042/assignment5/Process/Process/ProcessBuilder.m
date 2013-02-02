//
//  ProcessBuilder.m
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import "ProcessBuilder.h"

@implementation ProcessBuilder
-(void)hejsa:(NSString *)hej, ...
{
    va_list argumentList;
    va_start(argumentList, hej);
    id eachObject;
    while ((eachObject = va_arg(argumentList, id)))
        NSLog(@"%@", eachObject);
    va_end(argumentList);
    
}
@end
