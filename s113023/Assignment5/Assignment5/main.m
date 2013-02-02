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
        Random *randomNumber = [[Random alloc]initWithSeed:454545];
        
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
        int max1 = 2;
        int fifthRandom = [randomNumber nextInt:max1];
        printf("%d (max: %d)\n",fifthRandom,max1);
        int max2 = 30;
        int sixthRandom = [randomNumber nextInt:max2];
        printf("%d (max: %d)\n",sixthRandom,max2);
        int max3 = 10;
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
        printf("%0.16f\n",seventeenth);
        double eigtheen = [randomNumber nextDouble];
        printf("%0.16f\n",eigtheen);
        double nineteenth = [randomNumber nextDouble];
        printf("%0.16f\n",nineteenth);
        printf("-------------------------\n\n");
        
        printf("---/ Random gaussian doubles /---\n");
        double twenty = [randomNumber nextGaussian];
        printf("%0.16f\n",twenty);
        double twentyone = [randomNumber nextGaussian];
        printf("%0.16f\n",twentyone);
        double twentytwo = [randomNumber nextGaussian];
        printf("%0.16f\n",twentytwo);
        printf("---------------------------------\n\n");
        
        /*printf("---/ Random integers /---\n");
        Random *randomNumber2 = [[Random alloc]init];
        int firstRandom2 = [randomNumber2 nextInt];
        printf("%d\n",firstRandom2);
        int secondRandom2 = [randomNumber2 nextInt];
        printf("%d\n",secondRandom2);
        int thirdRandom2 = [randomNumber2 nextInt];
        printf("%d\n",thirdRandom2);
        int fourthRandom2 = [randomNumber2 nextInt];
        printf("%d\n",fourthRandom2);
        printf("-------------------------\n\n");
        
        printf("---/ Random integers /---\n");
        Random *randomNumber3 = [[Random alloc]init];
        int firstRandom3 = [randomNumber3 nextInt];
        printf("%d\n",firstRandom3);
        int secondRandom3 = [randomNumber3 nextInt];
        printf("%d\n",secondRandom3);
        int thirdRandom3 = [randomNumber3 nextInt];
        printf("%d\n",thirdRandom3);
        int fourthRandom3 = [randomNumber3 nextInt];
        printf("%d\n",fourthRandom3);
        printf("-------------------------\n\n");*/
    
             
    }
    return 0;
}

