//
//  Schedules.h
//  clock
//
//  Created by broy denty on 14-8-11.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Schedules : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * alertID;
@property (nonatomic, retain) NSString * stringTime;
@property (nonatomic, retain) NSNumber * enable;

@end
