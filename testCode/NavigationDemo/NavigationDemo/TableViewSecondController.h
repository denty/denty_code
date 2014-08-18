//
//  TableViewSecondController.h
//  NavigationDemo
//
//  Created by broy denty on 14-8-13.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewSecondController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *secondTabelView;
@end
