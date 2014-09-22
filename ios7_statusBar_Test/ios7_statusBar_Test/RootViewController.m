//
//  RootViewController.m
//  ios7_statusBar_Test
//
//  Created by broy denty on 14-9-16.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    UITableView * m_tabelView;
}
@end

@implementation RootViewController

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
    m_tabelView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [m_tabelView setDelegate:self];
    [m_tabelView setDataSource:self];
    [m_tabelView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:m_tabelView];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
//    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [m_tabelView setContentInset:UIEdgeInsetsMake(0, 20, 0, 0)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [header setBackgroundColor:[UIColor redColor]];
    return header;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdenty = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty];
    }
    [cell.textLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    [cell setBackgroundColor:[UIColor orangeColor]];
    return cell;
}
@end
