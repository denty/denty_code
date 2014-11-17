//
//  ViewController.m
//  Crashtest
//
//  Created by broy denty on 14-10-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ViewController.h"
#import "CrashWithC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label =[[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-20, self.view.frame.size.height/2-20, 40, 40)];
    [label setText:@"crash"];
    [label setBackgroundColor:[UIColor blueColor]];
    [label setTextColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:label.frame];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonAction
{
//    [self crashWithOutArray];
//    [self crashWithRequestNull];
    crashWithNull();
}

- (void)crashWithOutArray
{
    NSArray * crashArray = [[NSArray alloc] initWithObjects:@"0", nil];
    [crashArray objectAtIndex:2];
}

- (void)crashWithRequestNull
{
    void (*nullFunction)() = NULL;
    nullFunction();
}
@end
