//
//  TableVIewFristController.m
//  NavigationDemo
//
//  Created by broy denty on 14-8-13.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "TableVIewFristController.h"
#import "TableViewSecondController.h"
@interface TableVIewFristController ()

@end

@implementation TableVIewFristController

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
    [self.firstTabView setDataSource:self];
    [self.firstTabView setDelegate:self];
    [self setTitle:@"first"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * indentifier = @"firstCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    return  cell;
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
    TableViewSecondController *aTableViewSecondController = [[TableViewSecondController alloc] init];
    [self.navigationController pushViewController:aTableViewSecondController animated:YES];
}
@end
