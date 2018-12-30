//
//  WSLoginBase+Private.m
//  WSLoginSDK
//
//  Created by 蓝秀文 on 2018/12/30.
//  Copyright © 2018 蓝秀文. All rights reserved.
//

#import "WSLoginBase+Private.h"

@implementation WSLoginBase (Private)

- (BOOL) login:(id<WSLoginDelegate>)delegate{
    return NO;
}

- (void)logout{
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    return NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return NO;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return NO;
}
@end
