//
//  OneView.h
//  ZJKyigedoubunengshao
//
//  Created by qianfeng007 on 15/10/14.
//  Copyright (c) 2015年 钟继康. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Dieon <NSObject>

-(NSInteger)die:(BOOL)die;

@end

@interface OneView : UIView

@property (nonatomic ,assign) BOOL begin;
@property (nonatomic ,strong) id<Dieon>delegte;


-(void)die;


@end
