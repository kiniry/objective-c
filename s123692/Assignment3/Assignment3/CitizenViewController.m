//
//  ViewController.m
//  Assignment3
//
//  Created by Markus Færevaag on 17.01.13.
//  Copyright (c) 2013 Markus Færevaag. All rights reserved.
//

#import "CitizenViewController.h"

@interface CitizenViewController ()

@end

@implementation CitizenViewController

@synthesize table, tableData;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Initialize table data
    self.tableData = [[NSMutableArray alloc] init];
    
    // Dummies
    Citizen *c1 = [[Citizen alloc] initWithName:@"Markus Færevaag" andSex:Male andAge:21];
    Citizen *c2 = [[Citizen alloc] initWithName:@"Annicken Bruu" andSex:Female andAge:21];
    Citizen *c3 = [[Citizen alloc] initWithName:@"Ellen Veie" andSex:Female andAge:61];
    Citizen *c4 = [[Citizen alloc] initWithName:@"Arne Færevaag" andSex:Male andAge:59];
    [c1 marryTo:c2];
    [c3 marryTo:c4];
    [c1 addParent:c3];
    [c1 addParent:c4];
    [self.tableData addObjectsFromArray:[NSArray arrayWithObjects:c1, c2, c3, c4, nil]];
    
    // Buttons
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
//    (UIButton *)addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem:)];
//    
//    self.navigationItem.rightBarButtonItem = self.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCitizenDetails"])
    {
        NSIndexPath *indexPath = [self.table indexPathForSelectedRow];
        DetailViewController *destViewController = segue.destinationViewController;
        destViewController.citizen = [self.tableData objectAtIndex:indexPath.row];
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.table setEditing:editing animated:YES];
    
    if (editing)
    {
//        self.addButton.enabled = NO;
    } else {
//        self.addButton.enabled = YES;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {        
        Citizen *c = [self.tableData objectAtIndex:indexPath.row];
        [c.spouse divorceFrom:c];
        for (Citizen *parent in c.parents) {
            [parent removeChild:c];
        }
        for (Citizen *child in c.children) {
            [child removeParent:c];
        }
        [self.tableData removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [[self.tableData objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

@end
