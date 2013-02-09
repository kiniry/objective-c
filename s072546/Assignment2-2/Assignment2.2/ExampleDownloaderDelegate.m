//
//  ExampleDownloader.m
//  Assignment2.2
//
//  Created by Kim Gad Thomsen on 2/3/13.
//  Copyright (c) 2013 Kim Gad Thomsen. All rights reserved.
//

#import "ExampleDownloaderDelegate.h"

@implementation ExampleDownloaderDelegate

-(id) init {
    self = [super init];
    if (self) {
        self.done = NO;
    }
    return self;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Done downloading");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.done = YES;
}


@end
