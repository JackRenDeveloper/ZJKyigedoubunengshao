//
//  ZangAi.h
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZangAi : UILabel

@property(nonatomic , assign) BOOL isFlying;

-(void)moving:(float)x;

@end
