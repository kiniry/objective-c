//
//  LevenshteinDistance.m
//  MythsAndRealities
//
//  Created by Søren Olofsson on 1/23/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import "LevenshteinDistance.h"

// Macro for finding minimum value of 3 numbers
#define min3(a, b, c) (a < b ? \
(a < c ? a : c) : \
(b < c ? b : c))

@interface LevenshteinDistance()

@property (nonatomic) NSMutableDictionary *cache;

-(int)computeWithString:(NSString*) str1 andIndex:(int)i andLength:(int)len1 andString:(NSString*)str2 andIndex:(int)j andLength:(int)len2;
-(int)computeUsingBlocksWithString:(NSString*) str1 andIndex:(int)i andLength:(int)len1 andString:(NSString*)str2 andIndex:(int)j andLength:(int)len2;
-(int)computeUsingMethodInvocationWithString:(NSString*) str1 andIndex:(int)i andLength:(int)len1 andString:(NSString*)str2 andIndex:(int)j andLength:(int)len2;
-(int) minOf:(int)a and:(int)b and:(int) c;

@end

@implementation LevenshteinDistance

@synthesize cache = _cache;

- (id)init
{
    self = [super init];
    if(self) {
        self.cache = [NSMutableDictionary dictionary];
    }
    return self;
}

// Computes Levenshtein distance with memoization
-(int)computeWithString:(NSString*) str1 andString:(NSString*)str2
{
    return [self computeWithString:str1 andIndex:0 andLength:(int)str1.length andString:str2 andIndex:0 andLength:(int)str2.length];
}

-(int)computeUsingBlocksWithString:(NSString*) str1 andString:(NSString*)str2
{
    return [self computeUsingBlocksWithString:str1 andIndex:0 andLength:(int)str1.length andString:str2 andIndex:0 andLength:(int)str2.length];
}

-(int)computeUsingMethodInvocationWithString:(NSString*) str1 andString:(NSString*)str2
{
    return [self computeUsingBlocksWithString:str1 andIndex:0 andLength:(int)str1.length andString:str2 andIndex:0 andLength:(int)str2.length];
}


// Computes Levenshtein distance with memoization
-(int)computeWithString:(NSString*) str1 andIndex:(int)i andLength:(int)len1 andString:(NSString*)str2 andIndex:(int)j andLength:(int)len2
{
    NSString *key = [NSString stringWithFormat:@"%d_%d_%d_%d", i, len1, j, len2];
    NSNumber *val = [self.cache objectForKey:key];
    if(val) return val.intValue;
    
    if(len1 == 0) return len2;
    if(len2 == 0) return len1;
    
    int cost = [str1 characterAtIndex:i] != [str2 characterAtIndex:j] ? 1 : 0;
    
    int dist = min3(
                    [self computeWithString:str1 andIndex:i + 1 andLength:len1 - 1 andString:str2 andIndex:j andLength:len2] + 1,
                    [self computeWithString:str1 andIndex:i andLength:len1 andString:str2 andIndex:j + 1 andLength:len2 - 1] + 1,
                    [self computeWithString:str1 andIndex:i + 1 andLength:len1 - 1 andString:str2 andIndex:j + 1 andLength:len2 - 1] + cost
                   );
    
    [self.cache setObject:([NSNumber numberWithInt:dist]) forKey:key];
    
    return dist;
}

// Computes Levenshtein distance with memoization and blocks
-(int)computeUsingBlocksWithString:(NSString*) str1 andIndex:(int)i andLength:(int)len1 andString:(NSString*)str2 andIndex:(int)j andLength:(int)len2
{
    NSString *key = [NSString stringWithFormat:@"%d_%d_%d_%d", i, len1, j, len2];
    NSNumber *val = [self.cache objectForKey:key];
    if(val) return val.intValue;
    
    if(len1 == 0) return len2;
    if(len2 == 0) return len1;
    
    int cost = [str1 characterAtIndex:i] != [str2 characterAtIndex:j] ? 1 : 0;
    
    int (^min)(int, int, int) = ^(int a, int b, int c)
    {
        return (a < b ? 
                (a < c ? a : c) : 
                (b < c ? b : c));
    };
    
    int dist = min(
                    [self computeWithString:str1 andIndex:i + 1 andLength:len1 - 1 andString:str2 andIndex:j andLength:len2] + 1,
                    [self computeWithString:str1 andIndex:i andLength:len1 andString:str2 andIndex:j + 1 andLength:len2 - 1] + 1,
                    [self computeWithString:str1 andIndex:i + 1 andLength:len1 - 1 andString:str2 andIndex:j + 1 andLength:len2 - 1] + cost
                    );
    
    [self.cache setObject:([NSNumber numberWithInt:dist]) forKey:key];
    
    return dist;
}

// Computes Levenshtein distance with memoization and blocks
-(int)computeUsingMethodInvocationWithString:(NSString*) str1 andIndex:(int)i andLength:(int)len1 andString:(NSString*)str2 andIndex:(int)j andLength:(int)len2
{
    NSString *key = [NSString stringWithFormat:@"%d_%d_%d_%d", i, len1, j, len2];
    NSNumber *val = [self.cache objectForKey:key];
    if(val) return val.intValue;
    
    if(len1 == 0) return len2;
    if(len2 == 0) return len1;
    
    int cost = [str1 characterAtIndex:i] != [str2 characterAtIndex:j] ? 1 : 0;
    
    int dist = [self minOf:([self computeWithString:str1 andIndex:i + 1 andLength:len1 - 1 andString:str2 andIndex:j andLength:len2] + 1)
                       and:([self computeWithString:str1 andIndex:i andLength:len1 andString:str2 andIndex:j + 1 andLength:len2 - 1] + 1)
                       and:([self computeWithString:str1 andIndex:i + 1 andLength:len1 - 1 andString:str2 andIndex:j + 1 andLength:len2 - 1] + cost)
                   ];
    
    [self.cache setObject:([NSNumber numberWithInt:dist]) forKey:key];
    
    return dist;
}

-(int) minOf:(int)a and:(int)b and:(int) c
{
        return (a < b ?
                (a < c ? a : c) :
                (b < c ? b : c));
}

@end
