//
//  OneView3.h
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol Dieon3 <NSObject>

-(NSInteger)die3:(BOOL)die;

@end

@interface OneView3 : UIView

@property (nonatomic ,assign) BOOL begin;
@property (nonatomic ,strong) id<Dieon3>delegte;
-(void)die;

@end
