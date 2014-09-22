//
//  RootViewController.m
//  testXMPP
//
//  Created by broy denty on 14-9-15.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"
@interface RootViewController ()
{
    
    __weak IBOutlet UITableView *m_tableView;
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
    self.title = @"联系人列表";
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] connect];
    // Do any additional setup after loading the view from its nib.
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
    static NSString * cellIndenty = @"testConmunicate";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenty];
    }
    return cell;
}
@end
