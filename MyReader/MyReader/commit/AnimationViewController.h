//
//  AnimationViewController.h
//  MyReader
//
//  Created by broy denty on 14-7-29.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/CALayer.h>
#import <Foundation/NSObject.h>
@interface AnimationViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UIView *animationView;
@property (weak, nonatomic) IBOutlet UIButton *animationButton;

- (IBAction)animationStart:(id)sender;
@end
