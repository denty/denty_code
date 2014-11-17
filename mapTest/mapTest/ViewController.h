//
//  ViewController.h
//  maptest
//
//  Created by broy denty on 14-11-3.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MAMapKit/MAMapKit.h>
@interface ViewController : UIViewController <MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@end

