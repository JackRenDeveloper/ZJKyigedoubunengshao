//
//  OneView1.h
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Dieon1 <NSObject>

-(NSInteger)die1:(BOOL)die;

@end

@interface OneView1 : UIView

@property (nonatomic ,assign) BOOL begin;
@property (nonatomic ,strong) id<Dieon1>delegte;
-(void)die;

@end
