//
//  ClockTableViewController.m
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ClockTableViewController.h"
#import "ClockTableViewCell.h"
@interface ClockTableViewController ()

@end

@implementation ClockTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.clockTableView setDelegate:self];
    [self.clockTableView setDataSource:self];
    [self.clockTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.clockTableView setBackgroundColor:[UIColor blackColor]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 138;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Indentifier = @"ClockTableViewCell";
    ClockTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:Indentifier];
    if (cell == nil) {
            cell = [[ClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Indentifier];
    }
    //202 113 118
    //236 142 134
    //255 172 142
    //243 212 158
    if (indexPath.row == 0) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:237 intGreen:108 intBlue:108 alpha:1]];
        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:237 intGreen:108 intBlue:108 alpha:1]];
    }
    if (indexPath.row == 1) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:241 intGreen:142 intBlue:124 alpha:1]];
        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:241 intGreen:142 intBlue:124 alpha:1]];
    }
    if (indexPath.row == 2) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:255 intGreen:172 intBlue:132 alpha:1]];
        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:255 intGreen:172 intBlue:132 alpha:1]];
    }
    if (indexPath.row == 3) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:243 intGreen:212 intBlue:148 alpha:1]];
        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:243 intGreen:212 intBlue:148 alpha:1]];
        [cell.timeLabel setText:@"set"];
    }
    return cell;
}
@end
