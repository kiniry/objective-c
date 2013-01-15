//
//  Boy.m
//  Assignment2.2
//
//  Created by Andreas Haure on 15/01/13.
//  Copyright (c) 2013 Andreas Roll Haure. All rights reserved.
//

#import "Boy.h"

@implementation Boy

- (NSString *)hobbies
{
    return @"I'm a boy so i like to play sports";
}
- (void)transformStringIntoFamousPitbullSong: (NSString *)string byAddingCountIn: (NSString *)language
{
    NSString *count = @"Dahle";
    if ([language isEqualToString:@"Spanish"]){
        count = @"Uno, Dos, Tress, Cuatro";
    } else if ([language isEqualToString:@"English"]){
        count = @"One, Two, Three, Four";

    }
    
    NSLog(@"%@, %@",count,string);
}
- (void)transformStringIntoFamousPitbullSong: (NSString *)string byAddingCountIn: (NSString *)language andFourCities: (NSString *)fourCities
{
    [self transformStringIntoFamousPitbullSong:string byAddingCountIn:language];
    NSLog(@"We're going to: %@",fourCities);
    
}
- (void)sayHello
{
    NSLog(@"Hello I'm definately a boy");
}
@end
