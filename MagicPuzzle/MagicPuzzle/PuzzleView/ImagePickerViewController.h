//
//  ImagePickerViewController.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoverFlowView.h"
@protocol ImagePickerSendIndexDelegate <NSObject>

- (NSInteger)sendIndexOfImage:(NSInteger) index;

@end
@interface ImagePickerViewController : UIViewController <CoverFlowViewActionDelegate>
@property id<ImagePickerSendIndexDelegate> sendIndexDelegate;
@end
