//
//  SchedulesModel.h
//  clock
//
//  Created by broy denty on 14-8-11.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Schedules.h"
#import "AppDelegate.h"
@interface SchedulesModel : NSObject
+(NSArray*)getSchedules;
+(BOOL)addSchedulesWithDate:(NSDate *) ringDate RingTime:(NSString *) ringTime AlertID:(NSInteger) alertID Enable:(BOOL) enable Shake:(BOOL) shake;
+(BOOL)deleteSchedulesWithAlertID:(NSInteger) alertID;
@end
