//
//  main.m
//  Levenshtein
//
//  Created by Emil Klarskov Kristensen on 1/29/13.
//  Copyright (c) 2013 Emil Klarskov Kristensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        LevenshteinDistance *l = [[LevenshteinDistance alloc] init];
        
        NSString *str1 = @"dkasndjndn3qiirujewfjsimnxvjnxjklnjfjiwiejasjdjnfjhsahtiojrhyrt783yu0r9kwefmknvjshufhbhfsjdioghiuerhguisdjfhasjfsanfjhjaslfhksdhgkljsdknnmnmnvjhakkfiwiyr86479214jfksjhsdjkhjksdhfjkahdjkhasjkdhjasknnxcnxmcnzm,njdnlkaldjlkajhfjgdslksldmansjkbajdhwoio1ueu281u4y32tjemfkmcnxbkbaskjhjdhajs";
        
        NSString *str2 = @"dsdu3rhvskdklkalwoi3u8278325jkjbhcgashjdjkjdkasldjieutrytuhjksjkcmnbahwuqooiriti4jnhvbyhjdshdahdfjgsjjhjfhewjfiiwokksmknvjshdfjkhdsfjhqwuoqiirouthoklgdfskfnsjfhjahgwuqourieytuyruhjnxcvbnxbhjhfjsdkhfkelwkweriweuriowieorjkfjksdjfjshgaqåiiovnxdnhunrnvhumcfdffffssssxwxwxkwmjjcnhucmrikoer";
        
        NSInteger dis = [l computeLevenshteinDistanceOf:str1 andString:str2];
        
        NSLog(@"%ld",(long)dis);
    }
    return 0;
}

