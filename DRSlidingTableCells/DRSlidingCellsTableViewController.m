//
//  DRSlidingCellsTableViewController.m
//  DRSlidingTableCells
//
//  Created by David Roth on 2/23/15.
//  Copyright (c) 2015 David Roth. All rights reserved.
//

#import "DRSlidingCellsTableViewController.h"

@interface DRSlidingCellsTableViewController ()

@end

@implementation DRSlidingCellsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableData = @[
                       @"January",
                       @"February",
                       @"March",
                       @"April",
                       @"May",
                       @"June",
                       @"July",
                       @"August",
                       @"September",
                       @"October",
                       @"November",
                       @"December",
                       @"January",
                       @"February",
                       @"March",
                       @"April",
                       @"May",
                       @"June",
                       @"July",
                       @"August",
                       @"September",
                       @"October",
                       @"November",
                       @"December"
                       ];
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor darkGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.tableData objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect originalCellFrame = [self.tableView rectForRowAtIndexPath:indexPath];
    
    cell.frame = CGRectMake(0 - originalCellFrame.size.width,
                            originalCellFrame.origin.y,
                            originalCellFrame.size.width,
                            originalCellFrame.size.height);

    [UIView animateWithDuration:0.75
                          delay:0.25
         usingSpringWithDamping:0.8
          initialSpringVelocity:2.0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         cell.frame = originalCellFrame;
                     }
                     completion:^(BOOL finished){
                     }];

}

@end
