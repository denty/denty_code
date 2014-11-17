//
//  RootViewController.m
//  collectionView
//
//  Created by broy denty on 14-9-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RootViewController.h"
#import "RootCollectionViewCell.h"
#import "LineCollectionViewLayout.h"
@interface RootViewController ()

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
    LineCollectionViewLayout * aLineCollectionViewLayout = [[LineCollectionViewLayout alloc] init];
    UICollectionView * collectView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:aLineCollectionViewLayout];
    collectView.dataSource = self;
    collectView.delegate = self;
    [collectView registerClass:[RootCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:collectView];
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    self.extendedLayoutIncludesOpaqueBars = NO ;
    self.automaticallyAdjustsScrollViewInsets = NO ;
    
    [collectView setBackgroundColor:[UIColor orangeColor]];
    [collectView setScrollEnabled:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RootCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.numberLabel setText:[NSString stringWithFormat:@"%d",indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
@end
