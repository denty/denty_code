//
//  AnimationViewController.m
//  MyReader
//
//  Created by broy denty on 14-7-29.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
{
    CALayer* sublayer;
    CALayer* sublayer2;
}
@end

@implementation AnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.animationView setBackgroundColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setHidden:NO];
    sublayer = [CALayer new];
    sublayer.backgroundColor = [UIColor redColor].CGColor;
    [sublayer setFrame:CGRectMake(50,50, 100, 100)];
    [sublayer setShadowOffset:CGSizeMake(0, 4)];
    [sublayer setShadowOpacity:0.9f];
    [sublayer setZPosition:100];
    [sublayer setShadowColor:[UIColor blackColor].CGColor];
    
    sublayer2 = [CALayer new];
    sublayer2.backgroundColor = [UIColor greenColor].CGColor;
    [sublayer2 setFrame:CGRectMake(50,50, 100, 100)];
    [sublayer2 setShadowOffset:CGSizeMake(0, 4)];
    [sublayer2 setShadowOpacity:0.9f];
    [sublayer2 setZPosition:101];
//    CATransform3D transfrom = CATransform3DMakeRotation(0.78, 1.0, 0.0, 0.0);
//    [sublayer2 setTransform:transfrom];
    [sublayer2 setShadowColor:[UIColor blackColor].CGColor];
    [self.animationView.layer addSublayer:sublayer];
    [self.animationView.layer addSublayer:sublayer2];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)animationStart:(id)sender
{
//***********************************************************************************************************************************
//    View动画实现
//    [UIView animateWithDuration:5.0 animations:^{
//        [self.animationView setOrigin:CGPointMake(100, 100)];
//    }];

//    CABasicAnimation* fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    fadeAnimation.fromValue = [NSNumber numberWithFloat:1.0];
//    fadeAnimation.toValue = [NSNumber numberWithFloat:0.0];
//    fadeAnimation.duration = 1.0;
//    [sublayer2 addAnimation:fadeAnimation forKey:nil];
//    //改变图层实际的最后数据值 
//    sublayer2.opacity = 0.0;  // 记得更新图层树
    
//***********************************************************************************************************************************
    
//  //关键帧动画——path赋值方式实现
//    CGMutablePathRef    path = CGPathCreateMutable();
//    //将路径的起点定位到    （50  120）
//    CGPathMoveToPoint(path,NULL,50.0,120.0);
//    //下面5行添加5条直线的路径到path中
//    CGPathAddLineToPoint(path, NULL, 60, 130);
//    CGPathAddLineToPoint(path, NULL, 70, 140);
//    CGPathAddLineToPoint(path, NULL, 80, 150);
//    CGPathAddLineToPoint(path, NULL, 90, 160);
//    CGPathAddLineToPoint(path, NULL, 100, 170);
//    //下面四行添加四条曲线路径到path
//    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
//    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
//    //以“position”为关键字创建 实例
//    CAKeyframeAnimation    *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    //设置path属性
//    [animation     setPath:path];
//    [animation     setDuration:3.0];
//    //这句代码    表示 是否动画回到原位
//    //    [animation setAutoreverses:YES];
//    CFRelease(path);
//    [sublayer2  addAnimation:animation forKey:NULL];
//  
//    //关键帧动画——values赋值方式实现
//    //1.创建核心动画
//     CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
//     keyAnima.keyPath=@"transform.rotation";
//     //设置动画时间
//     keyAnima.duration=5;
//     //设置图标抖动弧度
//     //把度数转换为弧度  度数/180*M_PI
//    keyAnima.values=@[@(M_PI/64),@(-M_PI/64),@(M_PI/64),@(-M_PI/64),@(M_PI/64),@(-M_PI/64)];
//     //设置动画的重复次数(设置为最大值)
//     keyAnima.repeatCount=1;
//    [keyAnima setCalculationMode:kCAAnimationLinear];
//    keyAnima.keyTimes = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.45],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.55],[NSNumber numberWithFloat:1], nil];
//     //2.添加动画
//     [sublayer2 addAnimation:keyAnima forKey:nil];
    
    
    
//***********************************************************************************************************************************
    //    组动画实现
    //以下必须导入QuartzCore包
//    UIBezierPath *movePath = [UIBezierPath bezierPath];
//    [movePath moveToPoint:CGPointMake(10.0, 10.0)];
//    [movePath addQuadCurveToPoint:CGPointMake(100, 300) controlPoint:CGPointMake(300, 100)];
//
//     CAKeyframeAnimation * posAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//     posAnim.path = movePath.CGPath;
//     posAnim.removedOnCompletion = YES;
//
//     //缩放动画
//     CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
//     scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//     scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.8)];
//     scaleAnim.removedOnCompletion = YES;
//
//     //透明动画
//     CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"alpha"];
//     opacityAnim.fromValue = [NSNumber numberWithFloat:1.0];
//     opacityAnim.toValue = [NSNumber numberWithFloat:0.1];
//     opacityAnim.removedOnCompletion = YES;
//
//     //动画组
//     CAAnimationGroup *animGroup = [CAAnimationGroup animation];
//     animGroup.animations = [NSArray arrayWithObjects:posAnim, scaleAnim, opacityAnim, nil];
//     animGroup.duration = 1;
//     
//     [sublayer2 addAnimation:animGroup forKey:nil];
//***********************************************************************************************************************************
    //3D动画实现
    CATransform3D rotationTransform  = CATransform3DMakeRotation(-M_PI/4, 0.5,0,0);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration = 1;
    animation.autoreverses = YES;
    animation.cumulative = YES;
//    animation.repeatCount = 1;
    [sublayer2 addAnimation:animation forKey:nil];
}
- (void)animationDidStart:(CAAnimation *)anim
{
    
}
@end
