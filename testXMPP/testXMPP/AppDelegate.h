//
//  AppDelegate.h
//  testXMPP
//
//  Created by broy denty on 14-9-15.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPStream.h"
#import "XMPPPresence.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    XMPPStream *xmppStream;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,readonly) XMPPStream *xmppStream;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


-(void)setupStream;

-(void)goOnline;

-(void)goOffline;
-(BOOL)connect;

-(void)disconnect;
@end
