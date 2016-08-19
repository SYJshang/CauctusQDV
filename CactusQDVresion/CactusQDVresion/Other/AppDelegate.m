//
//  AppDelegate.m
//  仙人掌抢单般
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 muios. All rights reserved.
//


//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

#import "AppDelegate.h"
#import "XRZTabBarController.h"
#import "DNPageView.h"
#import "NSFileManager+DN.h"
#import "DataManager.h"
#import "XRZLoginIDController.h"
#import "XRZNavitationController.h"
#import "UMessage.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//     1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    // 2.设置根控制器
    NSDictionary *dataDict = [[DataManager shareManager] loadUsernameAndPassword];
    NSString *name = [dataDict objectForKey:[DataManager shareManager].username];
    NSString *password = [dataDict objectForKey:[DataManager shareManager].password];
    
    XRZLog(@"username:%@, password:%@.",name,password);
    if (name && password) {
        self.window.rootViewController = [[XRZTabBarController alloc] init];
    }else{
        XRZLoginIDController *login = [[XRZLoginIDController alloc]init];
        XRZNavitationController *vc = [[XRZNavitationController alloc]initWithRootViewController:login];
        self.window.rootViewController = vc;
}
    
    
    // 4.显示窗口
    [self.window makeKeyAndVisible];
    
    //设置引导图
    [self PageLoadingGuide];
    
    
    //设置 AppKey 及 LaunchOptions
    [UMessage startWithAppkey:@"577b25d9e0f55a4d7c002eb7" launchOptions:launchOptions];
    
    //1.3.0版本开始简化初始化过程。如不需要交互式的通知，下面用下面一句话注册通知即可。
    [UMessage registerForRemoteNotifications];
    
//      如果你期望使用交互式(只有iOS 8.0及以上有)的通知，请参考下面注释部分的初始化代码
     //register remoteNotification types （iOS 8.0及其以上版本）
     UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
     action1.identifier = @"action1_identifier";
     action1.title=@"Accept";
     action1.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
     
     UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];  //第二按钮
     action2.identifier = @"action2_identifier";
     action2.title=@"Reject";
     action2.activationMode = UIUserNotificationActivationModeBackground;//当点击的时候不启动程序，在后台处理
     action2.authenticationRequired = YES;//需要解锁才能处理，如果action.activationMode = UIUserNotificationActivationModeForeground;则这个属性被忽略；
     action2.destructive = YES;
     
     UIMutableUserNotificationCategory *actionCategory = [[UIMutableUserNotificationCategory alloc] init];
     actionCategory.identifier = @"category1";//这组动作的唯一标示
     [actionCategory setActions:@[action1,action2] forContext:(UIUserNotificationActionContextDefault)];
     
     NSSet *categories = [NSSet setWithObject:actionCategory];
     
     //如果默认使用角标，文字和声音全部打开，请用下面的方法
     [UMessage registerForRemoteNotifications:categories];
     
     //如果对角标，文字和声音的取舍，请用下面的方法
     //UIRemoteNotificationType types7 = UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound;
     //UIUserNotificationType types8 = UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge;
     //[UMessage registerForRemoteNotifications:categories withTypesForIos7:types7 withTypesForIos8:types8];

    [UMessage setLogEnabled:YES];

    return YES;

}

//加载引导页
- (void)PageLoadingGuide {
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *historyVersion =[NSFileManager getAppSettingsForObjectWithKey:@"VersionStr"];
    if (historyVersion == nil || [historyVersion compare:currentVersion options:NSNumericSearch] == NSOrderedAscending) {
        //        [DNPageView sharePageView].isPageControl = NO;
        [[DNPageView sharePageView] initPageViewToView:self.window dismiss:^{
            [NSFileManager setAppSettingsForObject:currentVersion forKey:@"VersionStr"];
        }];
    }
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //1.2.7版本开始不需要用户再手动注册devicetoken，SDK会自动注册
    //[UMessage registerDeviceToken:deviceToken];
    //用户可以在这个方法里面获取devicetoken
    
    XRZLog(@"设备deviceToken》》》》》》》》%@",[[[[deviceToken description] stringByReplacingOccurrencesOfString: @"<" withString: @""]
                  stringByReplacingOccurrencesOfString: @">" withString: @""]
                 stringByReplacingOccurrencesOfString: @" " withString: @""]);
}

 - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
 {
 //如果注册不成功，打印错误信息，可以在网上找到对应的解决方案
 //1.2.7版本开始自动捕获这个方法，log以application:didFailToRegisterForRemoteNotificationsWithError开头
     
     XRZLog(@"错误信息%@",error);

}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //关闭友盟自带的弹出框
    //  [UMessage setAutoAlert:NO];
    
    [UMessage didReceiveRemoteNotification:userInfo];
    
        self.userInfo = userInfo;
        //定制自定的的弹出框
        if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"标题"
                                                                message:@"Test On ApplicationStateActive"
                                                               delegate:self
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
    
            [alertView show];
    
        }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [UMessage sendClickReportForRemoteNotification:self.userInfo];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
