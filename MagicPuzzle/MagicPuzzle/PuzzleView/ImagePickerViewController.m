//
//  ImagePickerViewController.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ImagePickerViewController.h"
#import "CoverFlowView.h"
@interface ImagePickerViewController ()

@end

@implementation ImagePickerViewController

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
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Wood.jpg"]];
    [backgroundView setFrame:self.view.frame];
    
    [self.view addSubview:backgroundView];
    CoverFlowView *aCoverFlowView = [[CoverFlowView alloc] initWithFrame:self.view.frame];
    aCoverFlowView.selectDelegate = self;
    aCoverFlowView.puzzleArray = self.imageArray;
    [aCoverFlowView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview: aCoverFlowView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)selectImageIndex:(NSInteger)index
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
   return [self.sendIndexDelegate sendIndexOfImage:index];
}
@end
