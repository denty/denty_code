//
//  hookView.h
//  clock
//
//  Created by broy denty on 14-8-12.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface hookView : UIView
@property CGRect textRect;
@property NSDictionary* textFontAttributes;

- (void)startDrawRect;
@end
