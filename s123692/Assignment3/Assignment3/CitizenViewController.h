//
//  ViewController.h
//  Assignment3
//
//  Created by Markus Færevaag on 17.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "Citizen.h"
#import "Nobleperson.h"

@interface CitizenViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic) NSMutableArray *tableData;



@end
