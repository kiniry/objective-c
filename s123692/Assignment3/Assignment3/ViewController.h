//
//  ViewController.h
//  Assignment3
//
//  Created by Markus Færevaag on 17.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;


@end
