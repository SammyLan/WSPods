//
//  WSLoginBase.h
//  WSLoginSDK
//
//  Created by 蓝秀文 on 2018/12/29.
//  Copyright © 2018 蓝秀文. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef NS_ENUM(NSUInteger, WSLoginType) {
    WSLoginType_Facebook,
    WSLoginType_Twitter,
    WSLoginType_Google,
    WSLoginType_WeChat,
    WSLoginType_QQ
};

typedef NS_ENUM(NSUInteger, WSAuthVersion) {
    WSAuthVersion_1,    //Auth 1.0
    WSAuthVersion_2,    //Auto 2.0
};




typedef void (^LoginCallback)(NSError * error);

@class WSLoginBase;
@protocol WSLoginDelegate <NSObject>

@optional
- (void)openSDKLogInStart:(WSLoginBase *)aWrapper;
- (void)openSDKLogInDidFail:(WSLoginBase *)aWrapper error:(NSError *)error;
- (void)openSDKLogInDidSuccess:(WSLoginBase *)aWrapper;
- (void)openSDKLogInDidLogOut:(WSLoginBase *)aWrapper;
@end


NS_ASSUME_NONNULL_BEGIN

@interface WSLoginBase : NSObject

@property (nonatomic,copy,class) WSLoginBase * curLoginSDK;

@property (nonatomic, assign,readonly)   WSLoginType loginType;
@property (nonatomic, assign,readonly)   WSAuthVersion authVersion;
@property (nonatomic, assign,readonly)   UInt64 beginTime;
@property (nonatomic,weak,readonly) id<WSLoginDelegate>  delegate;
@property (nonatomic, assign,readonly)   BOOL isCancelByUser;
@property (nonatomic, copy,readonly)    NSString *accessToken;
@property (nonatomic, copy,readonly)    NSString *authTokenSecret;
@property (nonatomic, copy,readonly)    NSString *userName;
@property (nonatomic, copy,readonly)    NSString *userID;
@property (nonatomic, strong,readonly)   NSDate * expirationDate;
@property (nonatomic, strong)   NSObject * bizData; //业务层用


+ (WSLoginBase *) getOpenSDKByType:(WSLoginType) loginType;
+ (BOOL) isOpenSDKLoginType:(WSLoginType) loginType;

+ (void) loginWithLoginType:(WSLoginType) loginType callback:(LoginCallback) callback delegate:(id<WSLoginDelegate>)delegate;
+ (void)logout;

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
+ (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
+ (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;


@end

NS_ASSUME_NONNULL_END

