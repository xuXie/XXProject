//
//  CCSDataWorld.h
//  CCSProject
//
//  Http引擎初始化工具类
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSHttpEngine.h"

#ifndef KDATAWORLD
#define KDATAWORLD [CCSDataWorld shareData]
#endif

/**
 *	@brief	网络请求引擎
 *
 *	网络请求引擎
 */
@interface CCSDataWorld : NSObject{
    
    CCSHttpEngine *m_httpEngine;
}
// 单例模式
+ (CCSDataWorld*)shareData;

// 服务器Http请求引擎
- (CCSHttpEngine *)httpEngine;
@end
