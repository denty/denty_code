//
//  ClockTableViewCell.h
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *timeHolderView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *iconView;

@end
