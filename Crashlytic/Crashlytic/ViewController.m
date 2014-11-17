//
//  ViewController.m
//  Crashlytic
//
//  Created by broy denty on 14-11-4.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ViewController.h"
#import "CrashWithC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setTitle:@"crashlytic"];
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    [button setTitle:@"crash" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(makeCrash) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeCrash
{
//    NSArray * testArray =[[NSArray alloc] initWithObjects:@"adsf", nil];
//    [testArray objectAtIndex:1];
//    void (*nullFunction)() = NULL;
//    nullFunction();
    crashWithNull();
}
@end
