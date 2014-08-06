//
//  ClockTableViewController.m
//  MyReader
//
//  Created by broy denty on 14-7-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ClockTableViewController.h"
#import "ClockTableViewCell.h"
#import "AlartViewController.h"
#import "AppDelegate.h"
#import "MGConferenceDatePicker.h"
#import "MGConferenceDatePickerDelegate.h"
@interface ClockTableViewController ()<ClockTableViewCellDelegate,AlartViewExpandableDelegate,MGConferenceDatePickerDelegate>

@end

@implementation ClockTableViewController
{
    BOOL editDone;
    BOOL shakeDone;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        editDone = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.clockTableView setDelegate:self];
    [self.clockTableView setDataSource:self];
    [self.clockTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.clockTableView setBackgroundColor:[UIColor whiteColor]];
    [self.clockTableView setBackgroundColor:[UIColor blackColor]];
//    [self enableClock];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Indentifier = @"ClockTableViewCell";
    ClockTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:Indentifier];
    if (cell == nil) {
            cell = [[ClockTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Indentifier];
        cell.delegate = self;
    }
    //202 113 118
    //236 142 134
    //255 172 142
    //243 212 158
    if (indexPath.row == 0) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:237 intGreen:108 intBlue:108 alpha:1]];
//        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:237 intGreen:108 intBlue:108 alpha:1]];
    }
    if (indexPath.row == 1) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:241 intGreen:142 intBlue:124 alpha:1]];
//        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:241 intGreen:142 intBlue:124 alpha:1]];
    }
    if (indexPath.row == 2) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:255 intGreen:172 intBlue:132 alpha:1]];
//        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:255 intGreen:172 intBlue:132 alpha:1]];
    }
    if (indexPath.row == 3) {
        [cell.timeHolderView setBackgroundColor:[UIColor colorWithIntRed:243 intGreen:212 intBlue:148 alpha:1]];
//        [cell.iconView setBackgroundColor:[UIColor colorWithIntRed:243 intGreen:212 intBlue:148 alpha:1]];
        [cell.timeLabel setText:@"set"];
    }
    cell.backgroundColor = [UIColor blackColor];
    if (indexPath.row == 1&&shakeDone == NO) {
        CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
        [animation setDelegate:self];
        animation.values = @[@(M_PI/64),@(-M_PI/64),@(M_PI/64),@(-M_PI/64),@(M_PI/64),@(-M_PI/64)];
        animation.duration = 0.25;
        [animation setKeyPath:@"transform.rotation"];
        animation.repeatCount = 10;
        animation.autoreverses = YES;
        [cell.timeLabel.layer addAnimation:animation forKey:@"shake"];
        cell.layer.shouldRasterize = YES;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    shakeDone = YES;
    [self.clockTableView reloadData];
}

- (void)enableClock:(NSDate *)data
{
    //发送通知
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    if (notification!=nil) {
        NSDate *now=[NSDate new];
//        notification.fireDate=[now dateByAddingTimeInterval:10];//10秒后通知
        notification.fireDate = data;
        notification.repeatInterval=0;//循环次数，kCFCalendarUnitWeekday一周一次
        notification.timeZone=[NSTimeZone defaultTimeZone];
        notification.applicationIconBadgeNumber=1; //应用的红色数字
        notification.soundName= @"----01.caf";//声音，可以换成alarm.soundName = @"myMusic.caf"
        //去掉下面2行就不会弹出提示框
        notification.alertBody=@"通知内容";//提示信息 弹出提示框
        notification.alertAction = @"打开";  //提示框按钮
//        notification.hasAction = NO; //是否显示额外的按钮，为no时alertAction消失
        
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
        notification.userInfo = infoDict; //添加额外的信息
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    }
}

- (void)editAction
{
    if (editDone) {
        editDone = NO;
        AlartViewController *aAlartViewController = [[AlartViewController alloc] init];
        aAlartViewController.delegate = self;
        __weak UIViewController *weakSelf = self;
        [aAlartViewController showView:weakSelf];
    }
}

- (void)functionComplete
{
    editDone = YES;
}

//Delegate
-(void)conferenceDatePicker:(MGConferenceDatePicker *)datePicker saveDate:(NSDate *)date {
    NSLog(@"%@",[date description]);
    [self dismissViewControllerAnimated:YES completion:nil];
    [self enableClock:date];
}

- (void)alertDeleteAction
{

}

- (void)alertEditAction
{
    //New view controller
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIViewController *pickerViewController = [[UIViewController alloc] init];
    //Init the datePicker view and set self as delegate
    MGConferenceDatePicker *datePicker = [[MGConferenceDatePicker alloc] initWithFrame:self.view.bounds];
    [datePicker setDelegate:self];
    //OPTIONAL: Choose the background color
    [datePicker setBackgroundColor:[UIColor whiteColor]];
    //Set the data picker as view of the new view controller
    [pickerViewController setView:datePicker];
    //Present the view controller
    [self presentViewController:pickerViewController animated:YES completion:nil];
}
@end
