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
        
        Random *randomNumber = [[Random alloc]initWithSeed:4000];
        int firstRandom = [randomNumber nextInt];
        printf("%d\n",firstRandom);
        int secondRandom = [randomNumber nextInt];
        printf("%d\n",secondRandom);
        int thirdRandom = [randomNumber nextInt];
        printf("%d\n",thirdRandom);
        int fourthRandom = [randomNumber nextInt];
        printf("%d\n",fourthRandom);
        
        int fifthRandom = [randomNumber nextInt:20];
        printf("%d\n",fifthRandom);
        int sixthRandom = [randomNumber nextInt:30];
        printf("%d\n",sixthRandom);
        int seventhRandom = [randomNumber nextInt:10];
        printf("%d\n",seventhRandom);
        
        long eightRandom = [randomNumber nextLong];
        printf("%ld\n",eightRandom);
        long ninthRandom = [randomNumber nextLong];
        printf("%ld\n",ninthRandom);
        long tenthRandom = [randomNumber nextLong];
        printf("%ld\n",tenthRandom);
        
        BOOL eleventhRandom = [randomNumber nextBoolean];
        printf("%d\n",eleventhRandom);
        BOOL twelfthRandom = [randomNumber nextBoolean];
        printf("%d\n",twelfthRandom);
        BOOL thirteenthRandom = [randomNumber nextBoolean];
        printf("%d\n",thirteenthRandom);
        
        float fourteenth = [randomNumber nextFloat];
        printf("%f\n",fourteenth);
        float fifteenth = [randomNumber nextFloat];
        printf("%f\n",fifteenth);
        float sixteenth = [randomNumber nextFloat];
        printf("%f\n",sixteenth);
        
        double seventeenth = [randomNumber nextDouble];
        printf("%f\n",seventeenth);
        double eigtheen = [randomNumber nextDouble];
        printf("%f\n",eigtheen);
        double nineteenth = [randomNumber nextDouble];
        printf("%f\n",nineteenth);
        
        double twenty = [randomNumber nextGaussian];
        printf("%f\n",twenty);
        double twentyone = [randomNumber nextGaussian];
        printf("%f\n",twentyone);
        double twentytwo = [randomNumber nextGaussian];
        printf("%f\n",twentytwo);
             
    }
    return 0;
}

