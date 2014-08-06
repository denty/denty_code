//
//  UIColor+Additions.h
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

// String RGB like #123456 or 123456
+ (UIColor *)colorWithStringRGB:(NSString*)RGB;

// Integer RGB from 0 to 255
+ (UIColor *)colorWithIntRed:(NSUInteger)red intGreen:(NSUInteger)green intBlue:(NSUInteger)blue alpha:(CGFloat)alpha;

@end