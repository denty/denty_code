//
//  ImagePickerCollectionCell.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ImagePickerCollectionCell.h"
#import "SWSnapshotStackView.h"
@implementation ImagePickerCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"ImagePickerCollectionCell" owner:self options:nil] lastObject];
    if (self) {
        // Initialization code
        self.imageStackView = [[SWSnapshotStackView alloc] initWithFrame:self.frame];
        [self addSubview:self.imageStackView];
        [self.imageStackView setDisplayAsStack:YES];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
