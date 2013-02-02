//
//  Process.h
//  Process
//
//  Created by Sivanujann Selliah on 02/02/13.
//  Copyright (c) 2013 Sivanujann Selliah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Process : NSObject

-(void)destroy;
-(int)exitValue;
-(NSPipe *)getErrorStream;
-(NSPipe *)getInputStream;
-(NSPipe *)getOutputStream;
-(int)waitFor;

@end
