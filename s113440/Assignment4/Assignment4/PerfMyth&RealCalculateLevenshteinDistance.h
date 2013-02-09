//
//  PerfMyth&RealCalculateLevenshteinDistance.h
//  Assignment4
//
//  Created by Bastian Buch and Jacob Gjerstrup on 1/23/13.
//  Copyright (c) 2013 Bastian Buch, s113432 and Jacob Gjerstrup, s113440. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PerfMyth_RealCalculateLevenshteinDistance;
// The two functions, minimum (whic takes 3 ints as input parameter and returns an int - 
// used to find out which object is the smallest compared to the other), and the actual
// calculationmethod which takes two strings as an input and returns an int which is the
// amount of single character edits required to change one word into the other.
- (int)minimum:(int)ObjectA : (int)ObjectB : (int)ObjectC;
- (int)calculateLevenshteinDistance:(NSString*)StringOne:(NSString*)StringTwo;

@end
