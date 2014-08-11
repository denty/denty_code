//
//  ClockTableViewCell.h
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClockTableViewCellDelegate <NSObject>

- (void)editActionWithIndex:(NSInteger) index;

@end
@interface ClockTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *timeHolderView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (weak, nonatomic) IBOutlet UIView *editView;
@property (assign,nonatomic) NSInteger index;
@property (weak, nonatomic) id<ClockTableViewCellDelegate> delegate;
@end
