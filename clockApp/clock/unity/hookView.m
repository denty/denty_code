//
//  hookView.m
//  clock
//
//  Created by broy denty on 14-8-12.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "hookView.h"

@implementation hookView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.textRect = CGRectMake(0, 45, 120, 60);
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentCenter;
        self.textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 40], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

}


- (void)startDrawRect
{
    [UIView animateWithDuration:1 animations:^{
            [@"Edit" drawInRect: self.textRect withAttributes: self.textFontAttributes];
    }];
}

@end
