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
#import "AlartViewController.h"
@implementation ClockTableViewCell
{
    CGPoint m_beganPoint;
    CGPoint m_center;
    CGRect m_rect;
    float m_angel;
    CGPoint m_posiztion;
    CGPoint m_timeposiztion;
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
        [self.timeHolderView.layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.timeHolderView.bounds] CGPath]];
        m_rect = self.iconView.layer.frame;
        
        [self.iconView.layer setShadowOpacity:1];
        [self.iconView.layer setAnchorPoint:CGPointMake(0, 0.5)];
        [self.iconView.layer setFrame:self.iconView.layer.frame];
        self.iconView.originX = self.timeHolderView.width;
        [self.iconView.layer setShadowRadius:0.5];
        [self.iconView.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.iconView.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.iconView.layer setShadowPath:[[UIBezierPath bezierPathWithRect:self.iconView.bounds] CGPath]];
        
        [self bringSubviewToFront:self.timeHolderView];
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.iconView.width, self.iconView.height)];
        [coverView setBackgroundColor:[UIColor blackColor]];
        [coverView setAlpha:0.1];
        
        m_posiztion=self.iconView.layer.position;
        m_timeposiztion = self.timeHolderView.layer.position;
        [self.iconView addSubview:coverView];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self.iconView.layer setBackgroundColor:self.timeHolderView.backgroundColor.CGColor];
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

    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        locationPoint = [gesture translationInView:self.timeHolderView];
        if ((locationPoint.x-m_beganPoint.x)<0&&(locationPoint.x-m_beganPoint.x)>-80) {
            
            self.timeHolderView.layer.transform = CATransform3DMakeTranslation(locationPoint.x-m_beganPoint.x, 0, 0);
            self.editView.layer.transform = CATransform3DMakeTranslation(locationPoint.x-m_beganPoint.x, 0, 0);
            m_angel =-(locationPoint.x-m_beganPoint.x)/800;
            CATransform3D rotate = CATransform3DMakeRotation(m_angel, 0, 1, 0);
            CATransform3D combinedTransform = CATransform3DConcat(CATransform3DPerspect(rotate, CGPointMake(0, 0), 200), CATransform3DMakeTranslation(locationPoint.x-m_beganPoint.x, 0, 0));
            [self.iconView.layer setShadowRadius:self.iconView.layer.shadowRadius++];
            self.iconView.layer.transform = combinedTransform;
            self.iconView.layer.shouldRasterize = YES;

        }
        if ((locationPoint.x-m_beganPoint.x)<-80) {
            [self performSelector:@selector(delayEditAction) withObject:self afterDelay:0.5];
        }
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"end");
        [UIView animateWithDuration:0.5 animations:^{
            self.editView.layer.transform = CATransform3DIdentity;
            self.timeHolderView.layer.transform = CATransform3DIdentity;
            self.iconView.layer.transform = CATransform3DIdentity;
            m_angel = 0;
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

- (void)delayEditAction
{
    [self.delegate editActionWithIndex:self.index];
}
@end
