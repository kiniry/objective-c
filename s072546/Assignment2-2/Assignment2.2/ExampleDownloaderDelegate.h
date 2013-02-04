//
//  ExampleDownloader.h
//  Assignment2.2
//
//  Created by Kim Gad Thomsen on 2/3/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExampleDownloaderDelegate : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, assign) BOOL done;

@end
