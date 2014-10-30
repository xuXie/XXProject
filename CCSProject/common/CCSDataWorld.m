//
//  CCSDataWorld.m
//  CCSProject
//
//  Created by xiexu on 13-12-23.
//  Copyright (c) 2013年 Tian Yu CO.,LTD. All rights reserved.
//

#import "CCSDataWorld.h"

static CCSDataWorld* s_dataWorld;

@implementation CCSDataWorld
// 单例模式
+ (CCSDataWorld*)shareData{
    @synchronized(self)
    {
        if (s_dataWorld==nil) {
            s_dataWorld = [[CCSDataWorld alloc] init];
            
        }
    }
    return s_dataWorld;
}

// 服务器Http请求引擎
- (CCSHttpEngine *)httpEngine{
    @synchronized(self)
	{
        
		if (m_httpEngine==nil)
		{
            NSDictionary *l_dict_header = [NSDictionary dictionaryWithObjectsAndKeys:
                                           @"iphone",@"User-Agent",
                                           nil];
			m_httpEngine=[CCSHttpEngine engineWithHeaderParams:l_dict_header];
            [m_httpEngine setM_timeInterval_timeout: 15.0f];
		}
	}
	return m_httpEngine;
}
@end
