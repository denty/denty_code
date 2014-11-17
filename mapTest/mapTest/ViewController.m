//
//  ViewController.m
//  maptest
//
//  Created by broy denty on 14-11-3.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.mapView = [[MAMapView alloc] initWithFrame:self.view.frame];
    [self.mapView setDelegate:self];
    [self.view addSubview:self.mapView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
