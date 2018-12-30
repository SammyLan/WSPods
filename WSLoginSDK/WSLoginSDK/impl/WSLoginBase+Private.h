//
//  WSLoginBase+Private.h
//  WSLoginSDK
//
//  Created by 蓝秀文 on 2018/12/30.
//  Copyright © 2018 蓝秀文. All rights reserved.
//

#import "WSLoginBase.h"
#import "WSLoginDef.h"

NS_ASSUME_NONNULL_BEGIN

@interface WSLoginBase (Private)

@property (nonatomic, assign)   WSLoginType loginType;
@property (nonatomic, assign)   WSAuthVersion authVersion;
@property (nonatomic, assign)   UInt64 beginTime;
@property (nonatomic, weak) id<WSLoginDelegate>  delegate;
@property (nonatomic, assign)   BOOL isCancelByUser;
@property (nonatomic, copy)    NSString *accessToken;
@property (nonatomic, copy)    NSString *authTokenSecret;
@property (nonatomic, copy)    NSString *userName;
@property (nonatomic, copy)    NSString *userID;
@property (nonatomic, strong)   NSDate * expirationDate;

- (BOOL)login:(id<WSLoginDelegate>)delegate;
- (void)logout;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
- (void) activateApp;

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
@end

NS_ASSUME_NONNULL_END
