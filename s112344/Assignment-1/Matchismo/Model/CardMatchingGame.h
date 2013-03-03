//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jakob Jakobsen Boysen on 22/02/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck*)deck;

- (void) flipCardAtIndex:(NSUInteger)index;

- (Card*) cardAtIndex:(NSUInteger)index;

- (void) switchMode:(int)mode;

@property (readonly) int score;
@property (strong, readonly) NSString *flipResult;
@property (readonly) int mode;

@end
