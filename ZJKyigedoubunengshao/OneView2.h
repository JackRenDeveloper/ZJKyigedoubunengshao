//
//  OneView2.h
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Dieon2 <NSObject>

-(NSInteger)die2:(BOOL)die;

@end

@interface OneView2 : UIView

@property (nonatomic ,assign) BOOL begin;
@property (nonatomic ,strong) id<Dieon2>delegte;
-(void)die;

@end
