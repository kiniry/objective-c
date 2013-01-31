//
//  main.m
//  Assignment5
//
//  Created by Andreas Haure on 23/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Random.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create instance of Random object
        Random *randomNumber = [[Random alloc]init];
        
        printf("---/ Random integers /---\n");
        int firstRandom = [randomNumber nextInt];
        printf("%d\n",firstRandom);
        int secondRandom = [randomNumber nextInt];
        printf("%d\n",secondRandom);
        int thirdRandom = [randomNumber nextInt];
        printf("%d\n",thirdRandom);
        int fourthRandom = [randomNumber nextInt];
        printf("%d\n",fourthRandom);
        printf("-------------------------\n\n");
        
        printf("---/ Random integers with specified max /---\n");
        int max1 = 5;
        int fifthRandom = [randomNumber nextInt:max1];
        printf("%d (max: %d)\n",fifthRandom,max1);
        int max2 = 4;
        int sixthRandom = [randomNumber nextInt:max2];
        printf("%d (max: %d)\n",sixthRandom,max2);
        int max3 = 3;
        int seventhRandom = [randomNumber nextInt:max3];
        printf("%d (max: %d)\n",seventhRandom,max3);
        printf("--------------------------------------------\n\n");
        
        printf("---/ Random longs /---\n");
        long eightRandom = [randomNumber nextLong];
        printf("%ld\n",eightRandom);
        long ninthRandom = [randomNumber nextLong];
        printf("%ld\n",ninthRandom);
        long tenthRandom = [randomNumber nextLong];
        printf("%ld\n",tenthRandom);
        printf("----------------------\n\n");
        
        printf("---/ Random booleans /---\n");
        BOOL eleventhRandom = [randomNumber nextBoolean];
        printf("%d\n",eleventhRandom);
        BOOL twelfthRandom = [randomNumber nextBoolean];
        printf("%d\n",twelfthRandom);
        BOOL thirteenthRandom = [randomNumber nextBoolean];
        printf("%d\n",thirteenthRandom);
        printf("--------------------------\n\n");
        
        printf("---/ Random floats /---\n");
        float fourteenth = [randomNumber nextFloat];
        printf("%f\n",fourteenth);
        float fifteenth = [randomNumber nextFloat];
        printf("%f\n",fifteenth);
        float sixteenth = [randomNumber nextFloat];
        printf("%f\n",sixteenth);
        printf("-----------------------\n\n");
        
        printf("---/ Random doubles /---\n");
        double seventeenth = [randomNumber nextDouble];
        printf("%f\n",seventeenth);
        double eigtheen = [randomNumber nextDouble];
        printf("%f\n",eigtheen);
        double nineteenth = [randomNumber nextDouble];
        printf("%f\n",nineteenth);
        printf("-------------------------\n\n");
        
        printf("---/ Random gaussian doubles /---\n");
        double twenty = [randomNumber nextGaussian];
        printf("%f\n",twenty);
        double twentyone = [randomNumber nextGaussian];
        printf("%f\n",twentyone);
        double twentytwo = [randomNumber nextGaussian];
        printf("%f\n",twentytwo);
        printf("---------------------------------\n\n");
        
        /*
        Random *randomNumber2 = [[Random alloc]init];
        int firstRandom2 = [randomNumber2 nextInt];
        printf("%d\n",firstRandom2);
        int secondRandom2 = [randomNumber2 nextInt];
        printf("%d\n",secondRandom2);
        int thirdRandom2 = [randomNumber2 nextInt];
        printf("%d\n",thirdRandom2);
        int fourthRandom2 = [randomNumber2 nextInt];
        printf("%d\n",fourthRandom2);
        */
    
             
    }
    return 0;
}

