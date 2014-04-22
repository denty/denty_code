//
//  PuzzleViewController.h
//  MagicPuzzle
//
//  Created by broy denty on 14-4-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMGridView.h"
#import "GMGridViewCell.h"
#import "UIView+Toast.h"
#import "ImagePickerViewController.h"
@interface PuzzleViewController : UIViewController <GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewActionDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ImagePickerSendIndexDelegate>
@property (strong, nonatomic) IBOutlet GMGridView *gridView;

- (IBAction)checkAction:(id)sender;
- (IBAction)tipAction:(id)sender;
@property (strong, nonatomic)  UIImageView *tipImageVIew;
@property (strong, nonatomic) IBOutlet UIImageView *homeBackgroundView;
@end
