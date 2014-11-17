//
//  TestTableViewController.m
//  collectionView
//
//  Created by broy denty on 14-9-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "TestTableViewController.h"
#import "TestTableViewCell.h"
@interface TestTableViewController ()
{
    UITableView *m_tableView;
    UITableView *right_tableView;
}
@end

@implementation TestTableViewController

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
    m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height) style:UITableViewStylePlain];
    [m_tableView setDelegate:self];
    [m_tableView setDataSource:self];
    [(UIScrollView *)m_tableView setDelegate:self];
    [m_tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:m_tableView];
    right_tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, m_tableView.frame.origin.y, self.view.frame.size.width/2, self.view.frame.size.height) style:UITableViewStylePlain];
    [right_tableView setDelegate:self];
    [right_tableView setDataSource:self];
    [(UIScrollView *)right_tableView setDelegate:self];
    [right_tableView registerClass:[TestTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:right_tableView];
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    self.extendedLayoutIncludesOpaqueBars = NO ;
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
    [m_tableView setTag:1];
    [right_tableView setTag:2];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.numberLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==1) {
        return 180;
    }else
    {
        return 100;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 1) {
        [right_tableView setContentOffset:scrollView.contentOffset];
    }
    else
    {
        [m_tableView setContentOffset:scrollView.contentOffset];
    }
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

@end
