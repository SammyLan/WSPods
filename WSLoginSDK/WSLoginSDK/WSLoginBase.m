//
//  WSLoginBase.m
//  WSLoginSDK
//
//  Created by 蓝秀文 on 2018/12/29.
//  Copyright © 2018 蓝秀文. All rights reserved.
//

#import "WSLoginBase.h"
#import "WSFBLogin.h"
#import "WSTWTLogin.h"
#import "WSGPLogin.h"
#import "WSWXLogin.h"
#import "WSQQLogin.h"

static UInt64 getCurrentTimestamp_ms() {
    UInt64 cur = (UInt64)(CACurrentMediaTime() * 1000);
    return cur;
}

static WSLoginBase * g_curLoginSDK;
@implementation WSLoginBase

+ (WSLoginBase *)curLoginSDK{
    return g_curLoginSDK;
}

+ (void)setCurLoginSDK:(WSLoginBase *)curLoginSDK{
    g_curLoginSDK = curLoginSDK;
}

+ (BOOL) isOpenSDKLoginType:(WSLoginType) loginType{
    return (loginType >= WSLoginType_Facebook && loginType <= WSLoginType_Twitter);
}

+ (WSLoginBase *) getOpenSDKByType:(WSLoginType) loginType{
    if (loginType == WSLoginType_Facebook) {
        return [WSFBLogin sharedInstance];
    }else if(loginType == WSLoginType_Twitter){
        return [WSTWTLogin sharedInstance];
    }else if(loginType == WSLoginType_Google){
        return [WSGPLogin sharedInstance];
    }else if(loginType == WSLoginType_WeChat){
        return [WSWXLogin sharedInstance];
    }else if(loginType == WSLoginType_QQ){
        return [WSQQLogin sharedInstance];
    }
    return nil;
}

- (instancetype) init{
    self = [super init];
    if (self != nil) {
        self.authVersion = 1.0;
    }
    return self;
}


+ (NSArray * ) loginSDKList{
    NSMutableArray * sdkList = NSMutableArray.new;
    if ([WSFBLogin sharedInstance] != nil) {
        [sdkList addObject:[WSFBLogin sharedInstance]];
    }
    
    if ([WSTWTLogin sharedInstance] != nil) {
        [sdkList addObject:[WSTWTLogin sharedInstance]];
    }
    
    if ([WSGPLogin sharedInstance] != nil) {
        [sdkList addObject:[WSGPLogin sharedInstance]];
    }
    
    if ([WSWXLogin sharedInstance] != nil) {
        [sdkList addObject:[WSWXLogin sharedInstance]];
    }
    
    if ([WSQQLogin sharedInstance] != nil) {
        [sdkList addObject:[WSQQLogin sharedInstance]];
    }
    
    return  sdkList;
}

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    NSArray * loginSDKList = [self loginSDKList];
    for (WSLoginBase * loginSDK in loginSDKList) {
        [loginSDK application:application didFinishLaunchingWithOptions:launchOptions];
    }
    return YES;
}

+ (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSArray * loginSDKList = [self loginSDKList];
    for (WSLoginBase * loginSDK in loginSDKList) {
        if ([loginSDK application:app openURL:url options:options]) {
            return YES;
        }
    }
    return NO;
}

+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    NSArray * loginSDKList = [self loginSDKList];
    for (WSLoginBase * loginSDK in loginSDKList) {
        if ([loginSDK application:application openURL:url sourceApplication:sourceApplication annotation:annotation]) {
            return YES;
        }
    }
    return NO;
}


+(void) loginWithLoginType:(WSLoginType) loginType callback:(LoginCallback) callback delegate:(id<WSLoginDelegate>)delegate{
    WSLoginBase * openSDK =  [self getOpenSDKByType:loginType];
    if (openSDK != nil) {
        openSDK.beginTime = getCurrentTimestamp_ms();
        openSDK.delegate = delegate;
        [openSDK login:delegate];
    }else{
        NSDictionary *userInfo = @{
                                   NSLocalizedDescriptionKey:KStringID(@"暂时不支持该登录类型"),
                                   NSLocalizedFailureReasonErrorKey:KStringID(@"暂时不支持该登录类型"),
                                   NSLocalizedRecoverySuggestionErrorKey:KStringID(@"暂时不支持该登录类型")
                                   };
        callback([NSError errorWithDomain:KStringID(@"授权失败") code:1 userInfo:userInfo]);
    }
}

+ (void)logout{
    if (WSLoginBase.curLoginSDK != nil) {
        [WSLoginBase.curLoginSDK logout];
    }
}
@end
