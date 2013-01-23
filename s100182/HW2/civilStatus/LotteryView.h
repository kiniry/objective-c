//
//  LotteryView.h
//  civilStatus
//
//  Created by Jesper Baltzersen on 18/01/13.
//  Copyright (c) 2013 Jesper Baltzersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol lottery <NSObject>
- (NSString *)winnerName;
@end

@interface LotteryView : NSObject 

- (void)displayWinnerName;

@property (weak) id <lottery> delegate;

@end
