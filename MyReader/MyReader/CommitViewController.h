//
//  CommitViewController.h
//  MyReader
//
//  Created by broy denty on 14-6-10.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpandabelTableView.h"
@interface CommitViewController : UIViewController <ExpandabelTableViewDelegate,ExpandabelTableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *naviControllerBar;
- (IBAction)popViewControllerAction:(id)sender;
@end
