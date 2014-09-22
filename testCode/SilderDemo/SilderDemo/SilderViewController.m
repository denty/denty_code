//
//  SilderViewController.m
//  SilderDemo
//
//  Created by broy denty on 14-8-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "SilderViewController.h"

@interface SilderViewController ()

@end

@implementation SilderViewController

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
    self.title = @"A";
    UIButton * persentButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [persentButton addTarget:self action:@selector(persent) forControlEvents:UIControlEventTouchUpInside];
    [persentButton setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:persentButton];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)persent
{
    DemoViewController * aDemoViewController = [[DemoViewController alloc] init];
//    [UIView animateWithDuration:0.25 animations:^{
//        [self.view setFrame:CGRectMake(-320, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        [self presentViewController:aDemoViewController animated:NO completion:^{
//            [aDemoViewController.view setFrame:CGRectMake(320, 0, aDemoViewController.view.frame.size.width, aDemoViewController.view.frame.size.height)];
//        }];
//        [aDemoViewController.view setFrame:CGRectMake(0, 0, aDemoViewController.view.frame.size.width, aDemoViewController.view.frame.size.height)];
//    }];
    [self.navigationController pushViewController:aDemoViewController animated:YES];
}
@end
