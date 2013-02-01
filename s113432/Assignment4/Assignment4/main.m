//
//  main.m
//  Assignment4
//
//  Created by Bastian Buch on 1/22/13.
//  Copyright (c) 2013 Bastian Buch. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PerfMyth_RealAppDelegate.h"
#import "PerfMyth&RealCalculateLevenshteinDistance.h"

int main(int argc, char *argv[])
{
    
    @autoreleasepool {
        NSString* sunshine = @"Sunshine";
        NSString* rainbows = @"Rainbows";
        NSString* cookie = @"Cookie";
        NSString* monster = @"Monster";
        NSString* poppins = @"Supercalifragilisticexpialidocious";
        NSLog(@"The Levenshtein Distance of the two words is %d", [PerfMyth_RealCalculateLevenshteinDistance calculateLevenshteinDistance : @"A" : @"Z"]);
    }
    return 0;
}
