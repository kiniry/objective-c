//
//  main.m
//  MythsAndRealities
//
//  Created by Søren Olofsson on 1/22/13.
//  Copyright (c) 2013 Søren Olofsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Knapsack.h"
#import "LevenshteinDistance.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // KNAPSACK
        long n = 100000; // The amount of items
        long size = 400; // Capacity of the knapsack
        long weights[100000] = {0};
        long values[100000] = {0};
        for(int i = 0; i < 100000; i++)
        {
            weights[i] = arc4random() % 100;
            values[i] = arc4random() % 100;
        }
        
        NSLog(@"Starting");
        
        Knapsack* knapsack = [[Knapsack alloc] initWith:n ItemsAndSize:size andWeights:weights andValues:values];
        NSLog(@"Max value = %ld\n", [knapsack solveMutableArray]);
        NSLog(@"Picks were: "); [knapsack printPicks];
        
        knapsack = [[Knapsack alloc] initWith:n ItemsAndSize:size andWeights:weights andValues:values];
        NSLog(@"Max value = %ld\n", [knapsack solve]);
        NSLog(@"Picks were: "); [knapsack printPicks];
        
        
        // LEVENSHTEIN
        NSString *str1 = @"asdfghjklqwertyuiopmjhgtrewedfgboouasdoashjdzxnmcnzxfhoearyouezzxcvbnmiuhgcmjhuyvfrdsrtyjasdfghjklqwertyuiopxcvbnmapiskjdnzxcbzhvhjgsajlkdasdasdfghjklqwertyuiopmjhgtrewedfgboouasdoashjdzxasdfghjklqwertyuiopmjhgtrewedfgboouasdoashjdzxnmcnzxfhoearyouezzxcvbnmiuhgcmjhuyvfrdsrtyjasdfghjklqwertyuiopxcvbnmapiskjdnzxcbzhvhjgsajlkdasdasdfghjklqwertyuiopmjhgtrewedfgboouasdoashjdzxnmcnzxfhoearyouezzxcvbnmiuhgcmjhuyvfrdsrtyjasdfghjklqwertyuiopxcvbnmapiskjdnzxcbzhvhjgsajlkdasdasdfghjklqwertyuiopmjhgtrewedfgboouasdoashjdzxnmcnzxfhoearyouezzxcvbnmiuhgcmjhuyvfrdsrtyjasdfghjklqwertyuiopxcvbnmapiskjdnzxcbzhvhjgsajlkdasdasdfghjklqwertyuiopmjhgtrewedfgboouasdoashjdzxd";
        NSString *str2 = @"qwyietiouiwpekljasnmzxcmznbxckhsyuklthjmefvgbqwsxcqazrfvmjuyokjniuygfcagdoitfuyghuidrygftrtgokmiujergtqwertyuuwqperkjtasdvblkjhgfdsapoiuytrewqmnbvcxzagfnjqxqwyietiouiwpekljasnmzxcmznbxckhsyuklthjmefvgbqwsxcqazrfvmjuyokjniuygfcagdoitfuyghuidrygftrtgokmiujergtqwertyuuwqperkjtasdvblkjhgfdsapoiuytrewqmnbvcxzagfnjqxqwyietiouiwpekljasnmzxcmznbxckhsyuklthjmefvgbqwsxcqazrfvmjuyokjniuygfcagdoitfuyghuidrygftrtgokmiujergtqwertyuuwqperkjtasdvblkjhgfdsapoiuytrewqmnbvcxzagfnjqxqwyietiouiwpekljasnmzxcmznbxckhsyuklthjmefvgbqwsxcqazrfvmjuyokjniuygfcagdoitfuyghuidrygftrtgokmiujergtqwertyuuwqperkjtasdvblkjhgfdsapoiuytrewqmnbvcxzagfnjqxqwyietiouiwpekljasnmzxcmznbxckhcxzagfnjqx";
        
        NSLog(@"Starting");
        
        LevenshteinDistance* levenshteinDistance = [[LevenshteinDistance alloc] init];
        int distance = [levenshteinDistance computeWithString:str1 andString:str2];
        NSLog(@"Levenshtein distance between '%@' and '%@' is %d", str1, str2, distance);
        
        levenshteinDistance = [[LevenshteinDistance alloc] init];
        distance = [levenshteinDistance computeUsingBlocksWithString:str1 andString:str2];
        NSLog(@"Levenshtein distance between '%@' and '%@' is %d", str1, str2, distance);
        
        levenshteinDistance = [[LevenshteinDistance alloc] init];
        distance = [levenshteinDistance computeUsingMethodInvocationWithString:str1 andString:str2];
        NSLog(@"Levenshtein distance between '%@' and '%@' is %d", str1, str2, distance);
        
    }
    return 0;
}

