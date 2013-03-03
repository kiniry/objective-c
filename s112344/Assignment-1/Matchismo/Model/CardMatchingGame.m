//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Jakob Jakobsen Boysen on 22/02/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (readwrite, nonatomic) int mode;
@property (strong, nonatomic, readwrite) NSString *flipResult;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation CardMatchingGame

#define MODE_2_CARD 2
#define MODE_3_CARD 3

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
        
    if (card && !card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    if (self.mode == MODE_2_CARD)
                        [self matchTwoCards:card otherCard:otherCard];
                    else
                        [self matchThreeCards:card secondCard:otherCard];
                    break;
                }
                self.flipResult = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

- (void)matchTwoCards:(Card*)card otherCard:(Card*)otherCard
{
    int matchScore = [card match:@[otherCard]];
    if (matchScore) {
        card.unplayable = YES;
        otherCard.unplayable = YES;
        self.score += matchScore * MATCH_BONUS;
        self.flipResult = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, matchScore * MATCH_BONUS];
    } else {
        otherCard.faceUp = NO;
        self.score -= MISMATCH_PENALTY;
        self.flipResult = [NSString stringWithFormat:@"%@ & %@ don't match. %d points penalty", card.contents, otherCard.contents, MISMATCH_PENALTY];
    }
}

- (void)matchThreeCards:(Card*)card secondCard:(Card*)secondCard
{
    for (Card *thirdCard in self.cards) {
        if (thirdCard.isFaceUp && !thirdCard.isUnplayable && thirdCard != secondCard) {
            int matchScore = [card match:@[secondCard, thirdCard]];
            if (matchScore) {
                card.unplayable = YES;
                secondCard.unplayable = YES;
                thirdCard.unplayable = YES;
                self.score += matchScore * MATCH_BONUS;
                self.flipResult = [NSString stringWithFormat:@"Matched %@ & %@ & %@ for %d points", card.contents, secondCard.contents, thirdCard.contents, matchScore * MATCH_BONUS];
            } else {
                secondCard.faceUp = NO;
                thirdCard.faceUp = NO;
                self.score -= MISMATCH_PENALTY;
                self.flipResult = [NSString stringWithFormat:@"%@ & %@ & %@ don't match. %d points penalty", card.contents, secondCard.contents, thirdCard.contents, MISMATCH_PENALTY];
            }
            break;
        }
    }
}


- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck*)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
        
        // default to 2-mode
        self.mode = MODE_2_CARD;
    }
    
    return self;
}

- (void) switchMode:(int)mode
{
    self.mode = mode;
}

@end
