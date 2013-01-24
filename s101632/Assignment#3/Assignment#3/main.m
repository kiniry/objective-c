//
//  main.m
//  Assignment#3
//
//  Created by Jacob Espersen on 18/01/13.
//  Copyright (c) 2013 Jacob Espersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoggingCitizen.h"
#import "Citizen.h"
#import "CitizenAssertion.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Logging
//        LoggingCitizen* homer = [[LoggingCitizen alloc] initWithFirstName:@"Homer" sex:male age:@40];
//        LoggingCitizen* marge = [[LoggingCitizen alloc] initWithFirstName:@"Marge" sex:female age:@38];
//        LoggingCitizen* bart = [[LoggingCitizen alloc] initWithFirstName:@"Bart" sex:male age:@12 mother:marge andFather:homer];
//        LoggingCitizen* lisa = [[LoggingCitizen alloc] initWithFirstName:@"Lisa" sex:female age:@9 mother:marge andFather:homer];
//        LoggingCitizen* millhouse = [[LoggingCitizen alloc]initWithFirstName:@"Millhouse" sex:male age:@12];
//        [homer marry:marge];
//        [marge haveChildWithName:@"Maggie" sex:female];
//        [lisa haveChildWithName:@"Secret child" sex:male];
//        [bart marry:millhouse];
//        [homer marry:nil];
//        [millhouse haveChildWithName:nil sex:male];
        
        // Assertion
        CitizenAssertion* homerA = [[CitizenAssertion alloc] initWithFirstName:@"Homer" sex:male age:@40];
        CitizenAssertion* margeA = [[CitizenAssertion alloc] initWithFirstName:@"Marge" sex:female age:@38];
        CitizenAssertion* bartA = [[CitizenAssertion alloc] initWithFirstName:@"Bart" sex:male age:@12 mother:margeA andFather:homerA];
        CitizenAssertion* lisaA = [[CitizenAssertion alloc] initWithFirstName:@"Lisa" sex:female age:@9 mother:margeA andFather:homerA];
        CitizenAssertion* millhouseA = [[CitizenAssertion alloc]initWithFirstName:@"Millhouse" sex:male age:@12];
        [homerA marry:margeA];
        [margeA haveChildWithName:@"Maggie" sex:female];
        [lisaA haveChildWithName:@"Secret child" sex:male];
        [bartA marry:millhouseA];
        [homerA marry:nil];
        [millhouseA haveChildWithName:nil sex:male];
        
        //Defensive programming
//        Citizen* homer = [[Citizen alloc] initWithFirstName:@"Homer" sex:male age:@40];
//        Citizen* marge = [[Citizen alloc] initWithFirstName:@"Marge" sex:female age:@38];
//        Citizen* bart = [[Citizen alloc] initWithFirstName:@"Bart" sex:male age:@12 mother:marge andFather:homer];
//        Citizen* lisa = [[Citizen alloc] initWithFirstName:@"Lisa" sex:female age:@9 mother:marge andFather:homer];
//        Citizen* millhouse = [[Citizen alloc]initWithFirstName:@"Millhouse" sex:male age:@12];
//        [homer marry:marge];
//        [marge haveChildWithName:@"Maggie" sex:female];
//        [lisa haveChildWithName:@"Secret child" sex:male];
//        [bart marry:millhouse];
//        [homer marry:nil];
//        [millhouse haveChildWithName:nil sex:male];
        
        
        
        
    }
    return 0;
}

