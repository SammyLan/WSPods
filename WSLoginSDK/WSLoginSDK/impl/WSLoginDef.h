//
//  WSLoginDef.h
//  WSLoginSDK
//
//  Created by 蓝秀文 on 2018/12/30.
//  Copyright © 2018 蓝秀文. All rights reserved.
//

#ifndef WSLoginDef_h
#define WSLoginDef_h

#pragma mark -  SINGLETON
#define DECL_SINGLETON(className) +(className *) sharedInstance
#define IMPL_SINGLETON(className) +(className *) sharedInstance{            \
static className *sharedInstance = nil;                                     \
static dispatch_once_t onceToken;                                           \
dispatch_once(&onceToken, ^{                                                \
sharedInstance = [[className alloc] init];                                  \
});                                                                         \
return sharedInstance;                                                      \
}


#define KStringID(x) x

#endif /* WSLoginDef_h */
