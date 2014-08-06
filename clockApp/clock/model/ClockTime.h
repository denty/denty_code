//
//  ClockTime.h
//  clock
//
//  Created by broy denty on 14-8-6.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ClockTime : NSManagedObject

@property (nonatomic, retain) NSDate * ringTime;
@property (nonatomic, retain) NSNumber * enable;

@end
