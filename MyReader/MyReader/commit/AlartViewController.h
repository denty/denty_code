//
//  AlartViewController.h
//  MyReader
//
//  Created by broy denty on 14-8-4.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlartViewController : UIViewController
@property (nonatomic,strong) UIView *titleView;

- (void)showView:(UIViewController *)VC;
CA_EXTERN CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ);


CA_EXTERN CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ);

@end
