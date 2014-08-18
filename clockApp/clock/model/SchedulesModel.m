//
//  SchedulesModel.m
//  clock
//
//  Created by broy denty on 14-8-11.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "SchedulesModel.h"

@implementation SchedulesModel
+(NSArray*)getSchedules
{
    NSManagedObjectContext *context;
    context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Schedules" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *aNSSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"alertID" ascending:YES];
    NSMutableArray *sortArray = [[NSMutableArray alloc] init];
    [sortArray addObject:aNSSortDescriptor];
    [fetchRequest setSortDescriptors:sortArray];
    NSError *error;
    NSArray *fetchObject = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray *schedulesArray = [[NSMutableArray alloc] init];
    for (Schedules *aSchedules in fetchObject) {
        if (aSchedules.date!=nil) {
            [schedulesArray addObject:aSchedules];
        }
    }
    return schedulesArray;
}

+(BOOL)addSchedulesWithDate:(NSDate *) ringDate RingTime:(NSString *) ringTime AlertID:(NSInteger) alertID Enable:(BOOL) enable Shake:(BOOL)shake
{
    NSManagedObjectContext *context;
    context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    BOOL isExist;
    isExist = NO;
    NSArray *schedulesArray = [SchedulesModel getSchedules];
    Schedules *existSchedules;
    for (Schedules *schedules in schedulesArray) {
        if ([schedules.alertID isEqualToNumber:[NSNumber numberWithInteger:alertID]]) {
            isExist = YES;
            existSchedules = schedules;
        }
    }
    if (isExist)
    {//更新
        if (ringDate) {
            existSchedules.date = ringDate;
            existSchedules.stringTime = ringTime;
            existSchedules.date = ringDate;
            existSchedules.enable = [NSNumber numberWithBool:enable];
        }
        existSchedules.shake = [NSNumber numberWithBool:shake];
    }
    else
    {//新增
        Schedules *aSchedules = [NSEntityDescription insertNewObjectForEntityForName:@"Schedules" inManagedObjectContext:context];

            aSchedules.date = ringDate;
            aSchedules.alertID = [NSNumber numberWithInteger:alertID];
            aSchedules.stringTime = ringTime;
            aSchedules.enable = [NSNumber numberWithBool:enable];

        aSchedules.shake = [NSNumber numberWithBool:shake];
    }
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"%@",[error localizedDescription]);
        return NO;
    }
    return YES;
}

+(BOOL)deleteSchedulesWithAlertID:(NSInteger) alertID
{
    NSManagedObjectContext *context;
    context = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Schedules" inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSPredicate *perdicate = [NSPredicate predicateWithFormat:@"alertID = %d",alertID];
    [fetchRequest setPredicate:perdicate];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *datas = [context executeFetchRequest:fetchRequest error:&error];
    if (datas.count>0) {
        for (NSManagedObject *obj in datas)
        {
            [context deleteObject:obj];
        }
        if (![context save:&error])
        {
            NSLog(@"error:%@",error);
            return NO;
        }else
        {
            return YES;
        }        
    }else
    {
        return NO;
    }
}
@end
