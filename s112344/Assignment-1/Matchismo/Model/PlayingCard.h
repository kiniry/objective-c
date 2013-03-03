//
//  PlayingCard.h
//  Matchismo
//
//  Created by Jakob Jakobsen Boysen on 21/02/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
