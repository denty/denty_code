//
//  TableViewSecondController.m
//  NavigationDemo
//
//  Created by broy denty on 14-8-13.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "TableViewSecondController.h"
#import "ThreeViewController.h"
#import "FourthViewController.h"
@interface TableViewSecondController ()

@end

@implementation TableViewSecondController
{
    BOOL fourth ;
    BOOL flag;
}
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
    fourth = NO;
    [self.secondTabelView setDelegate:self];
    [self.secondTabelView setDataSource:self];
    [self setTitle:@"second"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    FourthViewController *aFourthViewController = [[FourthViewController alloc] init];
    if (fourth == YES) {
            [self.navigationController pushViewController: aFourthViewController animated:YES];
        flag = YES;
        fourth = NO;
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.view setNeedsDisplay];
    if (flag == NO) {
            fourth = YES;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifier = @"firstCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThreeViewController * aThreeViewController = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController: aThreeViewController animated:YES];
}
@end
