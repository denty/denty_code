//
//  DetailViewController.h
//  abc
//
//  Created by broy denty on 14-10-29.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

