//
//  NSString+Additions.m
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)
- (NSUInteger)integerValueFromHex
{
    unsigned result = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self];
    [scanner scanHexInt:&result];
    return result;
}
@end
