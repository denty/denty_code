//
//  BounceButtonView.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "BounceButtonView.h"
static const CGFloat CSToastShadowOpacity       = 0.8;
static const CGFloat CSToastShadowRadius        = 6.0;
static const CGSize  CSToastShadowOffset        = { 4.0, 4.0 };
@implementation BounceButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.itemButton1 = [[UIView alloc] initWithFrame:CGRectMake(120, 10, 130, 30)];
        self.itemButton2 = [[UIView alloc] initWithFrame:CGRectMake(90, 60, 130, 30)];
        self.itemButton3 = [[UIView alloc] initWithFrame:CGRectMake(60, 110, 130, 30)];
        
        self.itemButton1.layer.shadowColor = [UIColor blackColor].CGColor;
        self.itemButton1.layer.shadowOpacity = CSToastShadowOpacity;
        self.itemButton1.layer.shadowRadius = CSToastShadowRadius;
        self.itemButton1.layer.shadowOffset = CSToastShadowOffset;
        
        self.itemButton2.layer.shadowColor = [UIColor blackColor].CGColor;
        self.itemButton2.layer.shadowOpacity = CSToastShadowOpacity;
        self.itemButton2.layer.shadowRadius = CSToastShadowRadius;
        self.itemButton2.layer.shadowOffset = CSToastShadowOffset;
        
        self.itemButton3.layer.shadowColor = [UIColor blackColor].CGColor;
        self.itemButton3.layer.shadowOpacity = CSToastShadowOpacity;
        self.itemButton3.layer.shadowRadius = CSToastShadowRadius;
        self.itemButton3.layer.shadowOffset = CSToastShadowOffset;
        
        UILabel *itemlabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
        [itemlabel1 setBackgroundColor:[UIColor clearColor]];
        [itemlabel1 setText:@"拍照"];
        UILabel *itemlabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
        [itemlabel2 setBackgroundColor:[UIColor clearColor]];
        [itemlabel2 setText:@"手机相册"];
        UILabel *itemlabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
        [itemlabel3 setBackgroundColor:[UIColor clearColor]];
        [itemlabel3 setText:@"MagicPuzzle图库"];
        
        UIButton *itemButtonActionButton1= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
        [itemButtonActionButton1 setTag:10];
        UIButton *itemButtonActionButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
        [itemButtonActionButton2 setTag:10];
        UIButton *itemButtonActionButton3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 30)];
        [itemButtonActionButton3 setTag:10];
    
        [self.itemButton1 addSubview:itemlabel1];
        [self.itemButton1 addSubview:itemButtonActionButton1];
        [self.itemButton2 addSubview:itemlabel2];
        [self.itemButton2 addSubview:itemButtonActionButton2];
        [self.itemButton3 addSubview:itemlabel3];
        [self.itemButton3 addSubview:itemButtonActionButton3];
        
        [self addSubview:self.itemButton1];
        [self addSubview:self.itemButton2];
        [self addSubview:self.itemButton3];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
@end
