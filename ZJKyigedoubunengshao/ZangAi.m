//
//  ZangAi.m
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import "ZangAi.h"
#import "UIView+common.h"

@implementation ZangAi


-(void)moving:(float)x {
    //static int x = 3;
    CGRect rect = self.frame;
    if (rect.origin.x > 0 - CGRectGetWidth(rect)) {
            rect.origin.x -= x;
            self.frame = rect;
    } else {
            _isFlying = NO;
    }
}


@end
