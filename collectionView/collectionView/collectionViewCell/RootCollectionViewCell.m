//
//  RootCollectionViewCell.m
//  collectionView
//
//  Created by broy denty on 14-9-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "RootCollectionViewCell.h"

@implementation RootCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.numberLabel = [[UILabel alloc] init];
        [self addSubview:self.numberLabel];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.numberLabel setFrame:rect];
    [self.contentView setBackgroundColor:[UIColor lightGrayColor]];
    [self.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.layer setBorderWidth:1];
    [self.numberLabel setTextColor:[UIColor whiteColor]];
}

@end
