
//
//  DemoViewController.m
//  SilderDemo
//
//  Created by broy denty on 14-8-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

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
    self.title = @"B";
    [self.view setBackgroundColor:[UIColor grayColor]];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:backButton];
//    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [backButton setBackgroundColor:[UIColor whiteColor]];
    
    CGRect frame = self.view.frame;
    self.navigationController.view.transform = CGAffineTransformRotate( CGAffineTransformIdentity, -M_PI/2);
    self.navigationController.view.frame = frame;
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
//    [self.delegate viewWillDisAppear];
    CGRect frame = self.view.frame;
    self.navigationController.view.transform = CGAffineTransformIdentity;
    self.navigationController.view.frame = frame;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)back
//{
//    [UIView animateWithDuration:0.25 animations:^{
//        [self.view setFrame:CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        
//    } completion:^(BOOL finished) {
//        [self dismissViewControllerAnimated:NO completion:^{}];
//    }];
//}
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
