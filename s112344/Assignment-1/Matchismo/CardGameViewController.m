//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jakob Jakobsen Boysen on 21/02/2013.
//  Copyright (c) 2013 Jakob Jakobsen Boysen. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"   
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeControl;
@property (weak, nonatomic) IBOutlet UISlider *historySlider;
@property (strong, nonatomic) NSMutableArray *flipHistory;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (NSMutableArray *)flipHistory
{
    if (!_flipHistory) _flipHistory = [[NSMutableArray alloc] init];
    return _flipHistory;
}

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{
    UIImage *cardBackImage = [UIImage imageNamed:@"playing-card-back.jpg"];
    
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        [cardButton setImage:(card.isFaceUp ? nil : cardBackImage) forState:UIControlStateNormal];
        [cardButton setImageEdgeInsets:UIEdgeInsetsMake(3.0, 3.0, 3.0, 3.0)];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    // disable game mode controller if flips greater than 0
    self.modeControl.enabled = (self.flipCount == 0);
    
    [self updateHistory];
}

- (void)updateHistory
{
    if (self.game.flipResult)
        [self.flipHistory addObject:self.game.flipResult];
    self.resultLabel.text = self.game.flipResult;
    
    self.historySlider.enabled = ([self.flipHistory count] > 0);
    self.historySlider.maximumValue = [self.flipHistory count];
    [self.historySlider setValue:[self.flipHistory count]];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}
- (IBAction)deal
{
    self.game = nil;
    self.flipCount = 0;
    self.flipHistory = nil;
    [self updateUI];
}

- (IBAction)changeMode:(id)sender
{
    if (self.modeControl.selectedSegmentIndex == 1) {
        [self.game switchMode:3];
    } else {
        [self.game switchMode:2];
    }
}

- (IBAction)slideHistory:(id)sender
{
    int index = self.historySlider.value - 1;
    if ([self.flipHistory count] > 0)
        self.resultLabel.text = [self.flipHistory objectAtIndex:index];
    if (index < [self.flipHistory count] - 1)
        self.resultLabel.textColor = [UIColor grayColor];
    else
        self.resultLabel.textColor = [UIColor blackColor];
}


@end
