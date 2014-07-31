//
//  ClockTableViewCell.m
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//
//202 113 118
//236 142 134
//255 172 142
//243 212 158
#import "ClockTableViewCell.h"
@implementation ClockTableViewCell
{
    CGPoint m_beganPoint;
    CGPoint m_center;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [[[NSBundle mainBundle] loadNibNamed:reuseIdentifier owner:self options:nil] lastObject];
    if (self) {
        // Initialization code
        UIPanGestureRecognizer *panGesture =[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [panGesture setDelegate:self];
        [self.timeHolderView addGestureRecognizer:panGesture];
        [self.timeLabel setTextColor:[UIColor colorWithIntRed:222 intGreen:222 intBlue:222 alpha:0.6]];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.shadowColor = [UIColor lightGrayColor];
        self.timeLabel.shadowOffset = CGSizeMake(0, 1);
    
        [self.timeHolderView.layer setShadowOpacity:1];
        [self.timeHolderView.layer setShadowRadius:0.5];
        [self.timeHolderView.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.timeHolderView.layer setShadowColor:[UIColor blackColor].CGColor];
        
        [self.iconView.layer setShadowOpacity:1];
        [self.iconView.layer setShadowRadius:0.5];
        [self.iconView.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.iconView.layer setShadowColor:[UIColor blackColor].CGColor];
        
        [self bringSubviewToFront:self.timeHolderView];
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.iconView.width, self.iconView.height)];
        [coverView setBackgroundColor:[UIColor blackColor]];
        [coverView setAlpha:0.1];
        [self.iconView addSubview:coverView];
//        [self setClipsToBounds:YES];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)panAction:(UIPanGestureRecognizer*) gesture
{    
    CGPoint locationPoint;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        m_beganPoint = [gesture translationInView:self.timeHolderView];
        m_center = self.timeHolderView.center;
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        locationPoint = [gesture translationInView:self.timeHolderView];
        [self.timeHolderView setOriginX:(m_beganPoint.x+locationPoint.x)];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"end");
        [UIView animateWithDuration:0.5 animations:^{
            [self.timeHolderView setOriginX:0];
        }];
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
    // We only want to deal with the gesture of it's a pan gesture
    if ([panGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        CGPoint translation = [panGestureRecognizer translationInView:[self superview]];
        return (fabs(translation.x) / fabs(translation.y) > 1) ? YES : NO;
    } else {
        return NO;
    }
}
@end
