//
//  CCSAppDelegate.h
//  CCSProject
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCSViewController;
@class Reachability;
#define APP_DELEGATE ((CCSAppDelegate *)[[UIApplication sharedApplication] delegate])

@interface CCSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CCSViewController *m_viewCtrl_root;
/**
 *	@brief	网络判断
 *
 *	判断网络类型
 */
@property(nonatomic,strong)Reachability  *m_reachability_host;
@end
