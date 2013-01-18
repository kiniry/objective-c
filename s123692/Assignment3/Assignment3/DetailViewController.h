//
//  DetailViewController.h
//  Assignment3
//
//  Created by Markus Færevaag on 17.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CitizenViewController.h"
#import "Citizen.h"
#import "Nobleperson.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) Citizen *citizen;

@property (nonatomic, weak) IBOutlet UITableView *table;

@property (nonatomic) NSMutableArray *dictArray;

@end
