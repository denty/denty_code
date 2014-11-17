//
//  TestTableViewCell.m
//  collectionView
//
//  Created by broy denty on 14-9-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.numberLabel  = [[UILabel alloc] initWithFrame:self.frame];
        [self.numberLabel setTextColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor lightGrayColor]];
        [self.layer setBorderWidth:1];
        [self.layer setBorderColor:[UIColor blackColor].CGColor];
        [self addSubview:self.numberLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
